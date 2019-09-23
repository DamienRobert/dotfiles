#!/usr/bin/env ruby

e=Enumerator.new do |y|
	r=""
	(0..7).each do |u|
	(0..7).each do |d|
	(0..7).each do |s|
		r="?l?l?l?l?l?l?l?l"
		r[2*u+1]="u"
		r[2*d+1]="d"
		r[2*s+1]="s"
		y << r
	end end end
end

e.each do |r|
	puts r
end
