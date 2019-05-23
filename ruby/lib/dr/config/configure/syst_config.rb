#!/usr/bin/env ruby
require 'dr/config/process_files'

#$VERBOSE=2 #warnings
module DR
	module Process
		module Squel::ContextHelper
			def has_package?(pkg, bin: pkg)
				@computer[:packages].include?(pkg) or @processor.present? && Pathname.new(@computer.root+"usr/bin/#{bin}").exist? 
			end
			def has_base_package?(pkg, bin: pkg)
				@computer[:packages].include?("base") or has_package?(pkg, bin: bin)
			end

			def sudo(*args, sudo: "sudo -E", **opts)
				# if we pass only one argument, assume it was already escaped
				args = args.length == 1 ? args.first : args.shelljoin
				SH.sh("#{sudo} #{args}", **opts)
			end

			def chroot(*args, chroot: "chroot", **opts)
				# if we pass only one argument, assume it was already escaped
				args = args.length == 1 ? args.first : args.shelljoin
				sudo("#{chroot} #{@dir[:target].to_s.shellescape} #{args}", **opts)
			end

			def archchroot(*args, **opts)
				chroot="arch-chroot"
				if @dir[:target].to_s=="/" #arch-chroot / fails
					sudo(*args, **opts)
				else
					chroot(*args, chroot: chroot, **opts)
				end
			end
		end

		class Syst < Squel
			#logger.level=Logger::DEBUG
			def initialize(computer="local",**opts)
				@computer=Computer.new(computer, infos: {root: opts[:root]}) if opts[:root]
				super
			end

			def set_dir
				@dir[:gen]||=@local_computer.file(:systfiles)+"config"
				@dir[:name]||="slash"
				@dir[:target]||=@computer.root
				@dir[:backup]||=@computer.root+"var"+"local"+"backups"+"rsync"+@computer.name+"#{@dir[:destname]}"
				super
			end

			def packages
				require 'dr/packages/syst'
				@packages||=DR::Packages::Syst.new(@computer)
			end

			def list_packages(*args)
				packages.list_packages(*args)
			end

			def set_context
				require 'dr/packages/syst'
				super
				@computer[:packages]=list_packages
			end

			#@opts are for global opts,
			#opts are for local 'generate' opts (which reverse merge @opts)
			def generate(*args,**opts)
				# we need to do this here evn through super does the same thing
				# because we need to acces the @opts options
				opts=@opts.merge(opts)
				# if opts[:minimal] or computer[:syst][:type]=="server"
				# 	opts[:filter]||=/locale.gen|mkinitcpio.conf|nsswitch.conf|sudoers.d|network/
				# 	opts[:notfilter]||=/polkit/
				# end
				opts[:notfilter]||=/root/ unless @computer.any_attribute?(:syst_types, %i(client server))
				@opts[:mirror]||="init-reflector"
				super
			end
			def diff(*args,sudo: true,**opts)
				super
			end
			def commit(*args,sudo: true,**opts)
				super
			end

			class <<self
				def process_args(*args,**opts)
					super do |opt,opts|
						opt.separator("\nSystem options")
						# opt.on("--[no-]minimal", "Minimal installation") do |v|
						# 	# this is now a noop
						# 	opts[:minimal]=v
						# end
						opt.on("--root=dir", "Set root directory of the computer") do |v|
							opts[:root]=v
						end
						opt.on("--mirror[=init/reflector/init-reflector]", "Regenerate pacman's mirror list") do |v|
							#init/[init-reflector]: only run if files not present
							#reflector/init-reflector: use reflector
							opts[:mirror]=v
							opts[:mirror]="reflector" if v.nil?
						end
						yield(opt,opts) if block_given?
					end
				end
			end
		end
	end
end

if __FILE__ == $0
	DR::Process::Syst.process_args(*ARGV)
end
