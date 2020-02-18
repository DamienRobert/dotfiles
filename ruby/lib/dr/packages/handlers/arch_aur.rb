#!/usr/bin/env ruby
$LOADED_FEATURES << File.realpath(__FILE__) if __FILE__ == $0
require 'dr/packages/handlers/arch_abs'

module DR
	module Packages
		class Handler::ArchAur < Handler::ArchAbs
			def get_packager
				# find_executable("pacaur")
				#find_executable("yay")
				find_executable("aur.rb")
			end

			def list_packages(mode: :foreign, **opts)
				super
			end
			def list_top(mode: :foreign, **opts)
				super
			end
			def list_unused(mode: :foreign, **opts)
				super
			end

			# def bootstrap(*args)
			# 	super do |_o|
			# 		# TODO
			# 		aur=SH.find_executable("aur_wrapper")
			# 		# "#{aur} -- --asdeps cower; #{aur} pacaur"
			# 		"#{aur} --bare yay"
			# 	end
			# end

			def install(*args)
				super do |pkgs,o|
					# "#{@packager} #{o} -y #{pkgs};"
					#"#{@packager} #{o} --aur -S #{pkgs};"
					"#{@packager} #{o} install #{pkgs};"
				end
			end

			def update(*args, **kw)
				super do |o|
					# "#{@packager} #{o} --aur -Su"
					"#{@packager} #{o} install -u"
				end
			end
			def check_update(*args)
				super do |o|
					# "#{@packager} #{o} --aur -Pu"
					"#{@packager} #{o} install -cu"
				end
			end
			def update_or_check(*args)
				check_update(*args)
			end

			# def clean(*args)
			# 	super do |o|
			# 		"#{@packager} #{o} --aur -Sc"
			# 	end
			# end

			def search(*args)
				super do |*args, o|
					# "#{@packager} #{o} --aur -Ss #{args.shelljoin}"
					"#{@packager} #{o} aur search #{args.shelljoin}"
				end
			end
		end
	end
end

if __FILE__ == $0
	DR::Packages::Handler::ArchAur.process_args(*ARGV)
	#show_infos bootstrap install uninstall update check_update update_or_check clean
end
