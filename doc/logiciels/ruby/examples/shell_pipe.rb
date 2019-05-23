#!/usr/bin/env ruby

# This version blocks until EOF
def block
	IO.popen("cat",'r+') do |f|
		f.write(ARGF.read)
		f.close_write
		f.each_line do |l|
			puts l
		end
	end
end

def enum
	Enumerator.new do |y|
		IO.popen("cat",'r+') do |f|
			ARGF.each_line do |l|
				y<<l
			end
		end
	end.each do |l|
		puts l
	end
end

def thread
	IO.popen("cat",'r+') do |f|
		Thread.new do
			ARGF.each_line do |l|
				f.write(l)
			end
			f.close_write
		end
		f.each_line do |l|
			puts l
		end
	end
end

mode=:enum
require 'optparse'
OptionParser.new do |o|
	o.on("--mode=MODE", "cat mode", "enum/block/thread") do |v|
		mode=v.to_sym
	end
end.parse!
puts "Mode: #{mode}"
send mode
