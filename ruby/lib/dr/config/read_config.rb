#!/usr/bin/env ruby
require 'pathname'
module DR
	module ReadConfig
		module_function

		#return an array for each non comment lines
		def strip(lines, clean_space: true)
			out=[]
			lines.each do |line|
				line.match(/(.*?)\#(.*)/) {|m| line=m[1]} #strip comments
				line =~ /^\s*$/ && next #skip blank lines
				out << line.gsub(/\s+/,' ')
			end
			return out
		end

		def is_empty?(file)
			lines=strip(readlines(file))
			return lines.empty?
		end

		def readlines(file)
			lines=if Pathname === file
				file.readlines
			else
				File.readlines(file)
			end
			return lines.map {|l| l.chomp!}
		end

		def parse(*args)
			out=[]
			args.each do |file|
				out.concat(strip(readlines(file)))
			end
			return out
		end
	end
end

if __FILE__ == $0 then
	join=ARGV.delete("--join") || ARGV.delete("-j")
	out=DR::ReadConfig.parse(*ARGV)
	if join
		puts out.join(" ")
	else
		out.each do |i|
			puts i
		end
	end
end
