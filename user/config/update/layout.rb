#!/usr/bin/env ruby
require_relative '../generate'

module DR
	module Process
		class UserLayout < User
			def set_dir
				@dir[:name]="layout"
				@dir[:copy]=[]
				super
				@dir[:in]=@dir[:gen]+"home"
			end

			def process_dir(*args, **opts)
				opts[:filter]=%r{\.initxvars|\.Xresources|\.gtkrc-2\.0|gtk-[34]\.0/settings\.ini|xfce4/terminal/terminalrc|fontconfig/conf\.d/10-display\.conf}
				opts[:clean_emptydir]=true
				super
			end

			def process_scriptdir(*args, **opts)
				opts[:filter]=%r{xrdb\.rb|gnome_terminal\.rb|gnome\.rb|xfce\.rb}
				super
			end
		end
	end
end

if __FILE__ == $0
	DR::Process::UserLayout.process_args(*ARGV)
end
