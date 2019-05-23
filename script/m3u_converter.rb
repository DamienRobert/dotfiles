#!/usr/bin/env ruby

require 'uri'

ARGV.each do |name|
	out=File.readlines(name).map do |l|
		URI.unescape(l)
	end
	File.write(name.chomp(".m3u")+"-decoded.m3u",out.join(""))
end
