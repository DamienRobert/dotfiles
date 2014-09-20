#Small helpers for ruby scripts in extra
#Usually the script has a main function with generate a config file for a
#computer. This helper install this config file (if run without argument,
#for the current computer), or show the config file generated if called
#with arguments
require 'config/computers'
require 'pathname'
require 'fileutils'

$helperfile=nil
module DR
		module Helper
		def show(*types)
			types.each do |type|
				comp=Computer.new(type)
				puts "## #{$helperfile}: #{comp} ##"
				puts main(comp)
			end
		end

		def process()
			comp=DR::Computer.new('current')
			puts "## -> #{$helperfile} (type=#{comp})"
			data=main(comp)
			f=(Pathname.new(ENV["HOME"])+$helperfile)
			FileUtils.rm(f) if f.symlink?
			FileUtils.mv(f,f.to_s+".old") if f.exist?
			File.write(f,data)
		end

		def run(args)
			args.length > 0 ? show(*args) : process()
		end
	end
end
