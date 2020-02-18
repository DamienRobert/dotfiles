#!/usr/bin/env ruby
$LOADED_FEATURES << File.realpath(__FILE__) if __FILE__ == $0
require 'dr/packages/handlers/python'

module DR
	module Packages
		class Handler::PythonPip2 < Handler::Generic
			include Handler::Python
			def initialize(*args, **kw)
				super
				@python="python2"
			end
			def get_packager
				find_executable("pip2")
			end
		end
	end
end
if __FILE__ == $0
	DR::Packages::Handler::PythonPip2.process_args(*ARGV)
	#show_infos bootstrap install uninstall update check_update update_or_check clean
end
