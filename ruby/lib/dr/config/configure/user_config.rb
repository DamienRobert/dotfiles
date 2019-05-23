#!/usr/bin/env ruby
require 'dr/config/process_files'
#GEM_HOME=$HOME/mine/ruby/core_gems $HOME/config/generate.rb --all

#$VERBOSE=2 #warnings
module DR
	module Process
		class User < Squel
			def set_dir
				@dir[:gen]||=@local_computer.file(:userfiles)+"config"
				@dir[:name]||="home"
				#@dir[:target]||=@local_computer.file(:homepath) #Pathname.home
				@dir[:target]||=if @computer.present?
						#TODO: add the relative homepath to @computer.root?
						@computer.file(:homepath) #Pathname.home
					else
						Pathname.new(".") #we will use ssh, so "" is the relative home
					end
				super
			end

			def generate(autogenerate:true, **opts)
				opts=@opts.merge(opts)
				minimal if opts[:minimal]
				super
			end

			def process_dir(*args, clean_emptydir: false, **opts)
				super
			end

			def minimal(**opts)
				@dir[:prescripts]=nil
				@dir[:copy]=nil
				@dir[:in]=nil
				@dir[:scripts]=@dir[:scripts]+"02symlinks.rb"

				minimal=%w(.bash_profile .bashrc .config/git .config/locale.conf .dir_colors .initenv .inputrc .profile .tmux.conf .vim/vimrc .vim/colors .zsh/.zprofile .zsh/.zshrc)
				minimal_files=minimal.map {|x| "#{@dir[:gen]}/dotfiles/./#{x}"}
				@dir[:rsync]=minimal_files
				# SH.rsync(*minimal_files , @dir[:out], clean_out: true, relative: true)
				#process_script(@dir[:scripts]+"02symlinks.rb")
			end

			class <<self
				def process_args(*args,**opts)
					super do |opt,opts|
						opt.separator("User options")
						opt.on("--[no-]minimal", "Minimal installation") do |v|
							opts[:minimal]=v
						end
						yield(opt,opts) if block_given?
					end
				end
			end
		end
	end
end

#SH.debug
if __FILE__ == $0
	DR::Process::User.process_args(*ARGV)
end
