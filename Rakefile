#!/usr/bin/env ruby

# allow to call the Rakefile as an executable
unless $LOADED_FEATURES.find {|l| l =~ /\Wrake\.rb/}
	# We only do this if 'rake' is not already loaded, otherwise we get an
	# infinite loop of Rake.application.run
	ARGV.unshift("--rakefile", $0)
	require 'rake'
	Rake.application.run
end

require_relative 'ruby/lib/dr/load/load_path'
require 'dr/config/computers'

def lookup(arg)
	ENV.find {|k,_v| (k.downcase == arg.downcase) }&.slice(1)
end
def unison_list(default=DR::Computers::List[:ToUnison])
	(u=lookup('List')) ? u.split(',') : default
end
def unison_type
	(t=lookup('Types')) ?  t.split(',') : []
end

desc "Configure current computer user
Shortcut for ~config/generate --all"
task :config do
	require 'dr/config/configure/user_config'
	DR::Process::User.new.dispatch(actions: :all)
end

desc "Configure current computer user (without asking for confirmation)
Shortcut for ~config/generate --all --process_now"
task "config:now" do
	require 'dr/config/configure/user_config'
	DR::Process::User.new.dispatch(actions: :all, pause: false)
end

desc "Configure current computer system
Shortcut for ~syst/config/generate --all"
task :syst do
	require 'dr/config/configure/syst_config'
	DR::Process::Syst.new.dispatch(actions: :all)
end

namespace :remote do
	desc "Unison to #{DR::Computers::List[:ToUnison]} via #{DR::Computers::UnisonServer}
	Shortcut for unisonsync _ToUnison
	ENV: List=:ToUnison, Type=nil"
	task "unison" do
		require 'dr/config/unison'
		DR::Unison::Sync.new(syncmode: true, type: unison_type).process(*unison_list)
	end

	desc "Update config on remotes
	Shortcut for ~config/run.rb -c _ToUnison :config --all
	'args=--all': splitted and passed as arguments"
	task :config, :args do |_t, a|
		a.with_defaults(:args => "--all")
		args=a.args.shellsplit

		require 'dr/config/configure/run'
		unison_list.each do |c|
			# ~config/run.rb -c _ToUnison :config --all
			DR::Run.new(c).remote_config(*args)
		end
	end

	desc "Cat config on remotes
	Shortcut for ~config/run.rb -c _AllUnison 'cat ~/.initvars | grep MYHOST'
	ENV: List=:AllUnison"
	task :cat do
		require 'dr/config/configure/run'
		DR::Run.run_command(unison_list(DR::Computers::List[:AllUnison]), 'cat ~/.initvars | grep MYHOST')
	end

=begin
Procedure: if the glibc archlinux version is too recent; compile unison on imb (eventually compile ocaml first): ~/script/install/{ocaml,unison}
Put the unison binary in ~/opt/unison
Then $ transfert aimb:opt/unison ~/tmp/
=end
	desc "Update unison binary to latest version
	If 'version' is not passed autodetect it from the unison binary.
	ENV: List=:AllUnison"

	task :update_unison, :version do |_t,a|
		require 'dr/config/configure/run'
		curcomp=DR::Computer.new
		unison="unison"

		# unison version
		universion = lambda do |ubin|
			return nil unless SH.find_executable(ubin)
			SH.sh("#{ubin} -version", capture: true, log: false) do |_suc, stdout|
				stdout&.match(/unison version\s+(\S+)\s+/) do |m|
					return m[1]
				end
			end
		end

		# get architecture
		comparch = lambda do |c|
			arch=c.dig(:syst, :arch)
			if arch=="x86_64" or arch.nil?
				"64" 
			else
				"unknown"
			end
		end

		findbin = lambda do |ubin|
			if (b=SH::Pathname.home+"opt/unison/#{ubin}").exist?
				b
			elsif (b=SH::Pathname.home+"tmp/unison/#{ubin}").exist?
				b
			else
				ubin.to_s.match(/^unison-(.*)-(text|gtk2)-(.*)$/) do |m|
					version=m[1]
					type=m[2]
					arch=m[3]
					if arch == comparch.call(curcomp) and version==universion.call(u="unison-#{type}")
						SH.find_executable(u)
					end
				end
			end
		end

		# rsync -vaczP /bin/unison-text imbu:opt/unison/${VERSION}-64
		# rsync -vaczP /bin/unison-gtk2 imbu:opt/unison/${VERSION}-gtk2-64

		# a.with_defaults(version: "unison-2.51.2")
		version=a.version
		version=universion.call(unison) if version.nil?

		if version
			ubin="#{unison}-#{version}"
			DR::Computer.computers(*unison_list(DR::Computers::List[:AllUnison])).each do |c|
				if c === DR::Computers::UnisonServer
					arch=comparch.call(curcomp)
					puts "-- #{c} [#{c.ssh_name}]: opt/unison/ => #{arch} --"
					[ "#{ubin}-gtk2-#{arch}", "#{ubin}-text-#{arch}"].each do |target|
						if (obin=findbin.call(target))
							SH.rsync("#{obin}", c.sshfile("opt/unison/#{target}", escape: true, universal: true))
						end
					end
				end

				arch=comparch.call(c)
				if !c.dig(:xorg).empty?
					bin="#{ubin}-gtk2-#{arch}"
				else
					bin="#{ubin}-text-#{arch}"
				end
				puts "-- #{c} [#{c.ssh_name}]: #{bin} --"
				if (obin=findbin.call(bin))
					DR::Run.new(c).run_command("mkdir -p bin", universal: true)
					suc, _=SH.rsync(curcomp.sshfile(obin, escape: true, universal: true), c.sshfile("bin/#{bin}", escape: true, universal: true))
					DR::Run.new(c).run_command("ln -snf #{bin.shellescape} bin/unison", universal: true) if suc
				end
			end
		end
	end
end

desc "Shortcut for remote:unison"
task :sync => 'remote:unison'
