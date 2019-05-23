#!/usr/bin/env ruby
$LOADED_FEATURES << File.realpath(__FILE__) if __FILE__ == $0
require 'dr/packages/handlers'

module DR
	module Packages
		class Handler::ArchAbs < Handler::Generic
			def initialize(*args)
				super
				@graph_type=:manual
				@pacmancheck=find_executable("checkupdates")
				@pacman=find_executable("pacman")
			end
			def get_packager
				find_executable("powerpill") or find_executable("pacman")
			end

			def package_dependency(pkg)
				output_list("pactree -l -d1 #{pkg.shellescape}") - [pkg]
			end

			def query_mode(mode)
				case mode
					when :native; 'n'
					when :foreign; 'm'
					else ''
				end
			end
			def list_packages(mode: :native, **opts)
				super do
					return output_list("#{@pacman} -Qq#{query_mode(mode)}")
				end
			end
			def list_top(mode: :native, **opts)
				super do
					#-t filter optional dependencies too, we only want to filter direct deps so we use -tt
					output_list("#{@pacman} -Qqtt#{query_mode(mode)}")
				end
			end
			def list_unused(mode: :native, **opts)
				super do
					#-t filter optional dependencies too, -tt only filter direct
					#deps; here we want -t
					output_list("#{@pacman} -Qqdt#{query_mode(mode)}")
				end
			end

			def group_packages(**_opts)
				@pacman && output_list("#{@pacman} -Sg") or []
			end

			def list_groups(groups, **opts)
				super do |*gps|
					gpkgs={}
					l=output_list("#{@pacman} -Sg #{gps.shelljoin}")
					l.each do |item|
						item.match(/(\S*)\s+(\S*)/) do |m|
							gpkgs[m[1]]||=[]
							gpkgs[m[1]]<<m[2]
						end
					end
					#gps.each do |i|
					#	@pacman and gpkgs[i]=output_list("#{@pacman} -Sqg #{i}")
					#end
					gpkgs
				end
			end

			private def common_options(**opts)
				opts=@opts.merge(opts)
				r=[]
				r<<"-q" if opts[:quiet]
				r<<"--noconfirm" if opts[:go]
				return r.shelljoin
			end

			def install(*args)
				# when we subclass arch_abs in arch_aur, we want the block
				# in arch_aur to be transmitted directly to Handler::Generic
				return super if block_given?
				super do |pkgs,o|
					"#{@sudo} #{@packager} #{o} -S --needed #{pkgs}"
				end
			end

			def uninstall(*args, **opts)
				return super if block_given?
				recursive=opts[:recursive] || true
				flags=""
				case recursive
				when :up; flags="c"
				when :down; flags="s"
				else flags="cs" if recursive
				end
				super do |pkgs,o|
					"#{@sudo} #{@pacman} #{o} -R#{flags} #{pkgs}"
				end
			end

			def change_mode(*args)
				super do |pkgs, mode, o|
					opt=["-D"]
					opt << "--asdeps" if mode==:automatic
					opt << "--asexplicit" if mode==:manual
					"#{@sudo} #{@pacman} #{o} #{opt.shelljoin} #{pkgs}"
				end
			end

			def update(*args)
				return super if block_given?
				super do |o|
					"#{@sudo} #{@packager} #{o} -Syu"
				end
			end
			def check_update(*args)
				return super if block_given?
				super do |_o|
					@pacmancheck
				end
			end
			def clean(*args)
				return super if block_given?
				super do |o|
					"#{@sudo} #{@pacman} #{o} -Sc"
				end
			end

			def search(*args)
				return super if block_given?
				super do |*args, o|
					"#{@pacman} #{o} -Ss #{args.shelljoin}"
				end
			end
		end

	end
end

if __FILE__ == $0
	DR::Packages::Handler::ArchAbs.process_args(*ARGV)
	#show_infos bootstrap install uninstall update check_update update_or_check clean
end
