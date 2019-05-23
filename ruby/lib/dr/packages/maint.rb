#!/usr/bin/env ruby

require 'dr/packages/handlers'
require 'dr/packages/user'
require 'dr/packages/syst'

module DR
	module Packages
		module Maint
			extend ProcessActions
			extend self

			def self.process_actions(*actions,**opts)
				super do |computers,*_args, **gopts|
					types=gopts.delete(:types)
					computers.each do |computer|
						opts=gopts.dup
						if computer.attribute?(:syst_types,:admin)
							ctypes=types||process_types(:all)
						else
							ctypes=types||process_types(:user)
						end
						puts "# #{computer} (types: #{ctypes.join(', ')}) => #{actions} #{opts}" unless opts[:verbose]==false
						opts[:types]=ctypes
						opts[:computers]=computer
						actions=["show"] if actions.empty?
						action=actions.first
						case action
						#%w(show list list-all pristine get-all get rm rm-extra rm-unused fix_unused top_pkgs all_pkgs pkg_search)
						when ->(x){Resolver::Actions.include?(x)}
							user=process_types(:user)
							syst=process_types(:syst)
							utypes=opts[:types]&user
							stypes=opts[:types]&syst
							User.process_actions(*actions,**opts,types:utypes,verbose: !!opts[:verbose]) unless utypes.empty?
							Syst.process_actions(*actions,**opts,types:stypes,verbose: !!opts[:verbose]) unless stypes.empty?
						else
							#show_infos update check_update update_or_check clean bootstrap install uninstall
							Handler.process_actions(*actions,**opts, verbose: false)
						end
					end
				end
			end
		end
	end
end

if __FILE__ == $0
	DR::Packages::Maint.process_args(*ARGV)
end
