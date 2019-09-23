#!/usr/bin/env ruby

def gen_all(n)
	a=(('a'..'z').to_a+('0'..'9').to_a)
	return a if n==1
	a.product(gen_all(n-1))
end

def gen_all
	Enumerator.new do |y|
		a=(('a'..'f').to_a+('0'..'9').to_a)
		a.each do |c1|
		a.each do |c2|
		a.each do |c3|
		a.each do |c4|
		a.each do |c5|
		a.each do |c6|
		a.each do |c7|
		a.each do |c8|
			y<<"#{c1}#{c2}#{c3}#{c4}#{c5}#{c6}#{c7}#{c8}"
		end end end end end end end end
	end
end

goal="hfv/XlVPKHsIA"
gen_all.lazy.take(10000).each do |mdp|
	salt="hf"
	# r=%x(openssl passwd -crypt -salt hf #{mdp}).chomp
	# Base64.encode64(Digest::MD5.digest("vdd458a376"))
	r=mdp.crypt(salt)
	puts r if r==goal
end

	# hfv/XlVPKHsIA
