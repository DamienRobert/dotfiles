#!/usr/bin/env ruby

require 'erubi'
ARGV.each do |file|
	r=eval(Erubi::Engine.new(File.read(file)).src)
	puts r
end
