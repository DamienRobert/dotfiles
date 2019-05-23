#!/usr/bin/env ruby
$length=4

require 'active_support'
require 'active_support/inflector'

#get the 'scrabble words' from file
def get_words(file)
	words=[]
	unless file.nil?
		File.readlines(file).each do |line|
			line=line.chomp
			#Replaces non-ASCII characters with an ASCII approximation
			words << ActiveSupport::Inflector.transliterate(line)
		end
	end
	return words.uniq!||[]
end

def can_continue(l)
	@words.find {|i| i =~ /^#{l}/}
end
def is_word(l)
	@words.include?(l)
end

def neighboors(i,j)
	[[i+1, j], [i-1, j], [i, j+1], [i, j-1], [i+1, j+1], [i-1, j-1], [i+1, j-1], [i-1, j+1]].select {|i,j| i >= 0 && j >=0 && i< $length && j< $length }
end

def play_from_pos(i,j, w="", pos=[])
	pos=pos.clone
	w=w.clone
	pos << [i,j]
	w << @game[i][j]
	# puts "Pos: #{i} ,#{j}, w: #{w}"
	r=Set.new
	r << w if is_word(w)
	if can_continue(w)
		(neighboors(i,j)-pos).each do |k,l|
			r |= play_from_pos(k,l, w, pos)
		end
	end
	r
end

dict_file=ARGV.shift
@words=get_words(dict_file)

game=ARGV.shift.downcase.each_char.to_a
# TODO use $length here
@game=[game[0, $length], game[4, $length], game[8, $length], game[12, $length]]

r=Set.new
(0...$length).each do |i|
	(0...$length).each do |j|
		s=play_from_pos(i,j)
		p s
		r |= s
		puts "Pos: #{i}, #{j}; size: #{r.length}"
	end
end
puts r.to_a.select {|i| i.length >= 3}.sort {|i,j| i.length <=> j.length}
