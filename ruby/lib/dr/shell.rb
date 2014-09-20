require 'shellwords'; require 'pathname'; require 'fileutils'
require 'dr/sh'; require 'dr/shextra'
require 'dr/core_ext'

if RUBY_VERSION < "2.0"
	#monkeypatch ShellWords to convert Paths into strings
	#this is not needed anymore in ruby2.0
	module Shellwords
		class << self
			alias :shellescape_orig :shellescape 
			def shellescape(item)
				return shellescape_orig(item.to_s)
			end
		end
	end
end

#ruby < 2.1
#ruby 2.1 defined Pathname#write but I want to use
#slightly different semantic so I define filewrite anyway
class Pathname
	def filewrite(*args,mode:"w")
		self.open(mode=mode) do |fh|
			#hack to pass an array to write and do the right thing
			if args.length == 1 && Array === args.first
				fh.puts(args.first)
			else
				fh.write(*args)
			end
			yield fh if block_given?
		end
	end
	#write is not the same as filewrite
	#but if given only one argument we should be ok
	unless Pathname.method_defined?(:write)
		alias :write :filewrite 
	end
end

module DR
	module Shell
		include DR::SH
	end
	#including DR::ShellInclude will allow 
	module ShellInclude
		include ::FileUtils
		include DR::Run #run_command, run_output, run_status, run
		include DR::Shell #sh, sh!
											#find, export, run_pager
		include DR::CLILogging #logger.{debug info warn error fatal}, log_and_do
		include DR::ExitNow #exit_now!
	end
end
