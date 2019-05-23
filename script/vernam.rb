#!/usr/bin/ruby

#A=65, a=97
def chr_to_alpha(c)
	byte=c.getbyte(0)
	byte>=97 ? byte -97: byte-65
end
def alpha_to_chr(b)
	#output capital letters
	o=" "; o.setbyte(0,65+b) #there should be a better way
	o
end

secret=ARGV.shift
ARGF.each_char.with_index do |c,i|
	byte=chr_to_alpha(c)+chr_to_alpha(secret[i% secret.length])
	print alpha_to_chr(byte%26)
end
puts
