#!/usr/bin/env ruby

def inspect_libraries(*progs,ldd: "ldd")
	deps=[]
	progs.each do |prog|
		out=`#{ldd} #{prog}`
		out.each_line do |l|
			l.match(/=>\s*(\/.*)\s\(.*\)$/) do |m|
				deps.push(m[1]) unless deps.include?(m[1])
			end
		end
	end
	return deps
end

#todo: use pkgfile to speed up the process?
def libraries_to_packages(*libs)
	`pacman -Qqo #{libs.shelljoin}`.split("\n")
end

if __FILE__ == $0
	require "optparse"
	require "shellwords"
	opts={}
	optparse = OptionParser.new do |opt|
		opt.banner = "Show libraries needed"
		opt.on("-p", "--[no-]packages", "Looks from which packages the libs come") do |v| opts[:packages]=v end
	end
	optparse.parse!
	deps=inspect_libraries(*ARGV)
	if opts[:packages]
		puts libraries_to_packages(*deps).sort.uniq
	else
		puts deps.sort
	end
end
