#!/usr/bin/env ruby
require 'dr/opts/process_helper'
require 'dr/sh'

module DR
	class Run
		def initialize(computer=nil, **opts)
			@computer=Computer.computer(computer)
			@cur_comp=Computer.computer
			@opts=opts
		end

		def ssh_copy_id(id_file=true)
			id_file="~/.ssh/id_ed25519.pub" if id_file == true
			id_file=nil if (id_file=="all")
			id_opt = id_file ? "-i #{id_file}" : ""
			ssh=@computer.ssh(mode: :hash)
			SH.sh("ssh-copy-id #{ssh[:ssh_options].shelljoin} #{id_opt} #{ssh[:hostssh].shellescape}")
		end

		def bootstrap_rsync
			ssh=@computer.ssh(mode: :hash)
			abs_myfiles= @cur_comp.file(:myfiles)
			myfiles= @computer.file(:rel_myfiles)
			# 'rsync -vaczP --exclude 'old' --exclude ".git" --exclude "$MYFILENAME/doc" --exclude "$MYFILENAME/@infos" $MYFILES $HOSTSSH:'
			SH.rsync(abs_myfiles, "#{ssh[:hostssh].shellescape}:", exclude: ['old', '.git', myfiles+'doc', myfiles+'@infos'], sshcommand: ssh[:ssh_command_options])
		end

		def bootstrap_unison
			require 'dr/config/unison'
			# nil => use local computer
			# DR::Unison::Sync.new(server: nil, type: :minimal).process(@computer)
			DR::Unison::Sync.new(syncmode: true, type: :minimal).process(@computer)
		end

		def config_env
			r={}
			myhostname=@computer.dig(:user,:hostname) and r[:MYHOSTNAME]=myhostname
			myhosttype=@computer.dig(:user,:hosttype) and r[:MYHOSTTYPE]=myhosttype
			r
		end

		def remote_config(*args)
			run_command((@computer.file(:cfgfiles)+"generate.rb").to_s, *args, initenv: true, pty: true, ssh_env: config_env)
		end
		def remote_systconfig(*args)
			run_command((@computer.file(:systfiles)+"config"+"generate.rb").to_s, *args, initenv: true, pty: true, ssh_env: config_env)
		end

		def run_command(*args, initenv: false, **ssh_opts)
			args.unshift((@computer.file(:myfiles)+"initenv").to_s) if initenv
			@computer.ssh(*args, mode: :system, **ssh_opts)
		end

		def process(**opts)
			opts[:keyid] and ssh_copy_id(opts[:keyid])
			case opts[:bootstrap]
			when :rsync, "rsync"
				bootstrap_rsync
			when :unison, "unison"
				bootstrap_unison
			when true
				@computer.dig(:sync) == "unison" ? bootstrap_unison : bootstrap_rsync
			end
			opts.key?(:ssh) and run_command(opts[:ssh], initenv: opts[:initenv])
		end

		def self.run_command(computers, *args, **opts)
			require 'sshkit'
			begin
				require "airbrussh"
				SSHKit.config.output = Airbrussh::Formatter.new($stdout, command_output: true)
				#simulate a rake task so that we get numbering of the commands
				Airbrussh::Rake::Context.current_task_name="run"
			rescue LoadError
				warn "Could not load airbrussh"
			end
			SSHKit::Coordinator.new(Computer.computers(*computers).map {|c| c.ssh(mode: :sshkit)}).each do
				if opts[:script]
					require 'tmpdir'
					tmpname=Dir::Tmpname.create("run.rb-") {}
					upload! opts[:script], tmpname
					execute tmpname, *args
				else
					execute(*args) unless args.empty?
				end
			end
		end

		extend ProcessActions
		class <<self
			def process_args(*args, **opts)
				ENV['POSIXLY_CORRECT']="true"
				super do |opt,opts|
					opt.banner = "Run arguments on computers"
					opt.on("--[no-]keyid[=id_file]", "Push the ssh key id") do |v|
						opts[:keyid]=v
					end
					opt.on("--ssh=command", "Run ssh command", "(Directly via ssh rather than via net/ssh)") do |v|
						opts[:ssh]=v
					end
					opt.on("--[no-]initenv", "For --ssh: source initenv first") do |v|
						opts[:initenv]=v
					end
					opt.on("--script=file", "Upload and then run script", "(via net/ssh)") do |v|
						opts[:script]=v
					end
					opt.on("--[no-]bootstrap=[mode]", "Bootstrap 'mine'", "Values: rsync, unison, true/auto") do |v|
						# true: autodetection between rsync and unison
						opts[:bootstrap]=v
					end
					opt.separator("\nSpecial commands: :config, :systconfig")
					yield(opt,opts) if block_given?
				end
			end

			def process_actions(*_)
				super do |computers, *args, **opts|
					computers.each do |c|
						Run.new(c, **opts).process(**opts)
						# run a barebone ssh command if '--ssh foo' was passed
					end
					if args.first == ":config"
						# alias for '~config/generate.rb'
						args.shift
						computers.each do |c|
							Run.new(c, **opts).remote_config(*args)
						end
					elsif args.first == ":systconfig"
						# alias for '~syst/config/generate.rb'
						args.shift
						computers.each do |c|
							Run.new(c, **opts).remote_systconfig(*args)
						end
					else
						# DR::Run.run_command -> sshkit
						run_command(computers, *args, **opts)
					end
				end
			end
		end
	end
end

if __FILE__ == $0
	# $0 [--keyid] -c _ToUnison :[syst]config --all
	DR::Run.process_args(*ARGV)
end
