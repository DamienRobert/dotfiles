require 'dr/opts/process_helper'

module DR
	module Packages
		module ProcessActions
			include DR::ProcessActions
			extend self

			def process_args(*args,**opts)
				opts[:shell]||=:puts
				super do |opt,opts|
					opt.banner = "Show/Install packages"
					# opt.on("-i", "--[no-]init", "Initial package installation") do |v|
					# 	opts[:init]=v
					# end
					opt.on("--shell=type", "shell mode (eval/exec/[puts])") do |v|
						#-> eval, exec, puts
						opts[:shell]=v
					end
					opt.on("-t", "--types=package_types", Array, "packages types") do |v|
						opts[:types]=v
					end
					opt.on("-v", "--[no-]verbose", "Verbosity") do |v|
						opts[:verbose]=v
					end
					opt.on("-a", "--[no-]all", "Select empty types too") do |v|
						opts[:all]=v
					end
					opt.on("--recursive", "=[up/down/true/false/auto]") do |v|
						opts[:recursive]=v.to_sym
					end
					# allow subclasses to add their options
					yield opt, opts if block_given?
				end
			end

			def process_types(types, all: false)
				if all
					types||=[]
					types+=self.all_types
				end
				return types if types.nil?
				require 'dr/packages/user'
				require 'dr/packages/syst'
				types=[*types].map {|t| t.to_sym}
				syst_types=Syst.all_types
				user_types=User.all_types
				# all_types=syst_types+user_types
				handlers=Pathname.new(Pathname.new(__FILE__).dirname+"handlers")
				all_types=handlers.children.select {|f| f.file? && f.executable?}.map {|f| f.basename.to_s.sub(/\.rb/,'').to_sym}.sort
				types+=user_types if types.delete(:user)
				types+=syst_types if types.delete(:syst)
				types+=all_types if types.delete(:all)
				types.uniq!
				wrong_types=types.select {|t| ! all_types.include?(t)}
				warn "Unknown types: #{wrong_types}" unless wrong_types.empty?
				return types
			end

			def process_actions(*actions,**opts, &b)
				opts[:types]=process_types(opts[:types], all: opts[:all])
				super(*actions,**opts,&b)
			end
		end
	end
end
