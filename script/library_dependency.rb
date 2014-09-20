#!/usr/bin/env ruby

def inspect_libraries(*progs)
	deps=[]
	progs.each do |prog|
		out=`ldd #{$opts[:recursive]? '-v' : ''} #{prog}`
		out.each_line do |l|
			if l =~ /=>\s*(\/.*)\s\(.*\)$/
				deps.push($1) unless deps.include?($1)
			end
		end
	end
	return deps
end

if __FILE__ == $0
	require "optparse"
	require "shellwords"
	$opts={}
	optparse = OptionParser.new do |opt|
		opt.banner = "Show libraries needed"
		opt.on("-r", "--[no-]recursive", "Recursive") do |v| $opts[:recursive]=v end
		opt.on("--[no-]packages", "Looks from which package the libs come") do |v| $opts[:packages]=v end
	end
	optparse.parse!
	deps=inspect_libraries(*ARGV)
	if $opts[:packages]
		pkgs=[]
		deps.each do |dep|
			pkg=`pacman -Qqo #{dep}`
			pkgs.push(pkg) unless pkgs.include?(pkg)
		end
		puts pkgs.sort
	else
		puts deps.sort
	end
end
