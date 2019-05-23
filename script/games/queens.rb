#!/usr/bin/env ruby

class Queens
	def initialize(n)
		@n=n
	end

	# encoding: pos[i] is the position of the queen on the i line
	def find(pos=[])
		return pos if pos.length == @n # found solution
		valid=space_left(pos)
		valid.each do |i|
			npos=pos.dup
			npos << i
			r=find(npos)
			return r unless r.nil?
		end
		return nil # no solutions
	end

	def space_left(pos)
		i=pos.length
		occupied=Set.new(pos) #queens occupy the columns
		(0...i).each do |j| #check diagonals
			occupied << pos[j]+(i-j)
			occupied << pos[j]-(i-j)
		end
		(0...@n).to_a-occupied.to_a
	end
end

if __FILE__ == $0
	ARGV.each do |n|
		Queens.new(n.to_i).find
	end
end
