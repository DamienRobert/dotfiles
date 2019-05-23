#!/usr/bin/env ruby
require 'set'
require 'dr/sh'
require 'dr/packages/process_helper'
require 'dr/packages/graphs'

module DR

	#how to install/remove packages
	module Packages
		autoload :GitOptDist, 'dr/packages/git_optdist'
		class Handler
			PackageHandlerError=Class.new(RuntimeError)
			extend ProcessActions
			def self.process_actions(*actions,**orig_opts)
				super do |computers,opts|
					types=opts.delete(:types)
					raise PackageHandlerError.new("No package types given") unless types
					computers.each do |computer|
						types.each do |type|
							puts "# #{computer} (#{type}) => #{actions} #{opts}" unless orig_opts[:verbose]==false
							self.new(computer,ptype: type,**opts).process(*actions,**opts)
						end
					end
				end
			end
			#generate a process method which dispatch the passed arguments to the
			#actions
			self.define_default_process(default: :show_infos)

			attr_accessor :ptype
			include PkgGraph::Helpers

			def initialize(computer,ptype:nil,**opts)
				@ptype=ptype.to_sym
				@opts=opts
				init_type(ptype: @ptype)
				@computer=Computer === computer ? computer : Computer.new(computer)
				case @ptype
				when :arch_abs,:arch_aur
					@pacmancheck=find_executable("checkupdates")
				end
				@sudo=@computer[:user][:sudo] || "sudo"
			end

			def to_s
				@ptype
			end

			def show_infos(groups: nil,**opts)
				puts infos(groups: groups,**opts)
			end

			private def common_options(**opts)
				opts=@opts.merge(opts)
				r=[]
				if opts[:quiet]
					case @ptype
					when :arch_abs
						r<<"-q"
					end
				end
				if opts[:go]
					case @ptype
					when :arch_abs
						r<<"--noconfirm"
					end
				end
				return r
			end

			def bootstrap(**opts)
				r=case @ptype
				when :perl_cpan
					"curl -L http://cpanmin.us | perl - App::cpanminus"
				when :python_pip2
					"curl -L https://bootstrap.pypa.io/get-pip.py | python2 - --user"
				when :python_pip3
					"curl -L https://bootstrap.pypa.io/get-pip.py | python3 - --user"
				when :arch_aur
					aur=SH.find_executable("aur")
					"#{aur} -- --asdeps cower; #{aur} pacaur"
				end
				eval_shell(r,**opts)
			end

			def install(*packages,**opts)
				packages_str=packages.uniq.shelljoin
				o=common_options(**opts)
				unless packages.empty? or @packager.nil?
					r=case @ptype
					when :arch_abs
						"#{@sudo} #{@packager} #{o.shelljoin} -S --needed #{packages_str};"
					when :arch_aur
						"#{@packager} -y #{packages_str};"
					when :ruby_gem
						"#{@packager} install #{packages_str};"
					when :python_pip2,:python_pip3
						"#{@packager} install --user #{packages_str};"
					when :nodejs
						"#{@packager} install -g #{packages_str};"
					when :perl_cpan
						"#{@packager} #{packages_str};"
					when :git_optdist
						"#{@packager} install #{packages_str};"
					end
					eval_shell(r,**opts)
				end
			end

			def uninstall(*packages,needed:[],**opts)
				packages.uniq!
				recursive=opts[:recursive]
				#for nodejs the graph is too long to construct; plus the nested structure means the uninstall is already recursive
				if recursive==:auto
					recursive=true
					recursive=false if @ptype==:nodejs
				end
				o=common_options(**opts)
				unless packages.empty? or @packager.nil?
					r=case @ptype
					#no need to construct the graph since pacman will handle it
					when :arch_abs,:arch_aur
						flags=""
						case recursive
						when :up; flags="c"
						when :down; flags="s"
						else flags="cs" if recursive
						end
						"#{@sudo} #{@pacman} #{o.shelljoin} -R#{flags} #{packages.shelljoin};"
					else
						pkg_graph=graph if recursive
						case recursive
						when :up; packages=pkg_graph.ancestors(*packages)
						when :down; packages=pkg_graph.unneeded_descendants(*packages,needed: needed)
						when :itself.to_proc #test for true...
							packages=pkg_graph.ancestors(*packages)
							packages=pkg_graph.unneeded_descendants(*packages,needed: needed)
						end
						packages_str=packages.map {|node| node.name}.shelljoin
						case @ptype
						when :arch_abs,:arch_aur
							flags=""
							case recursive
							when :up; flags="c"
							when :down; flags="s"
							else flags="cs" if recursive
							end
							"#{@sudo} #{@pacman} #{o.shelljoin} -R#{flags} #{packages_str};"
						when :ruby_gem
							#-aIx=--all  --ignore-dependencies --executables
							"#{@packager} uninstall -aIx #{packages_str};"
						when :python_pip2,:python_pip3
							"#{@packager} uninstall -y #{packages_str};"
						when :nodejs
							"#{@packager} uninstall -g #{packages_str};"
						when :perl_cpan
							"#{@packager} --uninstall #{packages_str};"
						when :git_optdist
							"#{@packager} uninstall #{packages_str};"
						end
					end
					eval_shell(r,**opts)
				end
			end

			#if possible set mode to manual/explicit or automatic/dependency
			def change_mode(*packages, mode: :manual,**opts)
				packages_str=packages.uniq.shelljoin
				case mode
				when :manual,:explicit
					mode=:manual
				when :auto,:automatic,:dependency,:dep
					mode=:automatic
				else
					warn 'Unknown mode, fallback to automatic'
					mode=:automatic
				end
				unless packages.empty? or @packager.nil?
					r=case @ptype
					when :arch_abs,:arch_aur
						opt=common_options(**opts)
						opt<<"-D" << "--asdeps" if mode==:automatic
						opt<<"-D" << "--asexplicit" if mode==:manual
						"#{@sudo} #{@pacman} #{opt.shelljoin} #{packages_str}"
					end
					eval_shell(r,**opts)
				end
			end

			#some pkgmgr like npm complain when the NPMHOME/lib folder does not exist
			#during updates
			def check_folder
				unless @packager.nil?
					case @ptype
					when :nodejs
						%x/#{@packager} config list/.match(/^prefix\s*=\s*"(.*)"/) do |m|
							prefix=Pathname.new(m[1])
							return (prefix+"lib").directory?
						end
					end
				end
				true
			end

			def update(**opts)
				o=common_options(**opts)
				unless @packager.nil?
					r=case @ptype
					when :arch_abs
						"#{@sudo} #{@packager} #{o.shelljoin} -Syu;"
					when :arch_aur
						"#{@packager} -u;"
					when :ruby_gem
						"#{@packager} update;"
					when :python_pip2,:python_pip3
						pkgs=list_packages
						"#{@packager} install --user #{pkgs.shelljoin} -U;" unless pkgs.empty?
					when :nodejs
						#pkgs=output_list("#{@packager} outdated -g --parseable --depth=0").map {|pkg| pkg.split(":")[3].split("@")[0]}
						#"#{@packager} update -g #{pkgs.shelljoin};" unless pkgs.empty?
						## With newer version, npm update -g only update top level packages, so I don't need to pass the packages list. Furthermore the --parseable is buggy with newer npm versions, so its better to just check if the output is empty or not, not trying to parse it
						if check_folder
							pkgs=output_list("#{@packager} outdated -g --parseable --depth=0")
							"#{@packager} update -g;" unless pkgs.empty?
						end
					when :perl_cpan
						##cpanm --self-upgrade is just a shortcup for cpanm App::cpanminus
						##so no need for a special case
						#pkgs=list_top-graph.descendants(cpanm).map(&:to_s)
						#cpanm='App::cpanminus'
						#"#{@packager} --self-upgrade;" +
						#	(pkgs.empty? ? "" : " #{@packager} #{pkgs.shelljoin};")
						pkgs=list_top
						"#{@packager} #{pkgs.shelljoin};" unless pkgs.empty?
					when :git_optdist
						GitOptDist.update(**opts)
					end
					eval_shell(r,**opts)
				end
			end
			def check_update(**opts)
				unless @packager.nil?
					r=case @ptype
					when :arch_abs
						"#{@pacmancheck};"
					when :arch_aur
						"#{@packager} -k;"
					when :nodejs
						check_folder && "#{@packager} outdated -g;"
					end
					eval_shell(r,**opts)
				end
			end
			#sometime updating inconditionnally is annoying (like if we need to
			#compile stuff); update_or_check automatically calls update or
			#check_update according to which is 'usually' better
			def update_or_check(**opts)
				case @ptype
				when :arch_aur
					check_update(**opts)
				else
					update(**opts)
				end
			end

			def clean(**opts)
				unless @packager.nil?
					r=case @ptype
					when :arch_abs
						"#{@pacman} -Sc;"
					when :ruby_gem
						"#{@packager} clean;"
					when :git_optdist
						"gitfolders -l optdist action 'git gc --aggressive';"
					end
					eval_shell(r,**opts)
				end
			end

			private def eval_shell(r,**opts)
				shell=@opts.merge(opts).fetch(:shell,"")
				ShellEval.eval_shell(r, shell: shell)
			end
		end
	end
end

if __FILE__ == $0
	#Ex: $0 -t ruby_gem infos
	DR::Packages::Handler.process_args(*ARGV)
	#show_infos bootstrap install uninstall update check_update update_or_check clean
end
