#!/usr/bin/env ruby

require 'active_support/inflector'

class Boggle
	def initialize(*dicos)
		dict = "/usr/share/dict/french" # this one is larger
		# dict = "#{ENV['HOME']}/Documents/Misc/words_lists/moby_words_five_lang/french.txt"
		dicos=[dict] if dicos.empty?
		@length=4 #size of the board
		@min_length=3 #min length of words
		@words=Hash.new {|h,k| h[k] = h.class.new(&h.default_proc) }
		dicos.each do |dico|
			get_words(dico) do |word|
				construct_tree(@words, word)
			end
		end
	end

	#get the 'scrabble words' from file
	def get_words(file)
		words=Set.new
		unless file.nil? or !File.exist?(file)
			File.readlines(file).each do |line|
				#Replaces non-ASCII characters with an ASCII approximation
				#Le gsub est là parce que la liste moby décompose les mots 'a^cre'
				word=ActiveSupport::Inflector.transliterate(line.chomp).gsub(/\W/, '')
				if block_given?
					yield word
				else
					words << word
				end
			end
		else
			warn "File #{file} not found"
		end
		words
	end

	def construct_tree(h,word)
		word.each_char do |c|
			h=h[c]
		end
		h[nil]=nil
	end


	def neighboors(i,j)
		[[i+1, j], [i-1, j], [i, j+1], [i, j-1], [i+1, j+1], [i-1, j-1], [i+1, j-1], [i-1, j+1]].select {|i,j| i >= 0 && j >=0 && i< @length && j< @length }
	end

	def play_from_pos(i,j, w=[], pos=[])
		pos=pos.clone
		w=w.clone
		pos << [i,j]
		w << @game[i][j]
		r=Set.new
		list = @words.dig(*w).keys
		# puts "Pos: #{i} ,#{j}, w: #{w}, list: #{list}"
		r << w.join if list.include?(nil) #nil marks the end of a word
		(neighboors(i,j)-pos).each do |k,l|
			r |= play_from_pos(k,l, w, pos) if list.include?(@game[k][l])
		end
		r
	end

	def play(game, verbose: false)
		game=game.downcase.each_char.to_a if game.is_a?(String)
		@game=[]
		for i in 0...game.length/@length do
			@game << game[i*@length, @length]
		end
		puts "Game:\n#{@game.map {|l| l.join.upcase}.join("\n")}\n\n"

		r=Set.new
		(0...@length).each do |i|
			(0...@length).each do |j|
				s=play_from_pos(i,j)
				puts "Pos: #{i}, #{j}; found: #{s}" if verbose
				r |= s
			end
		end
		puts filter_solutions(r)
		r
	end

	def filter_solutions(list)
		list.to_a.select {|i| i.length >= @min_length}.sort.sort {|i,j| i.length <=> j.length}
	end
end

if __FILE__ == $0
	require 'optparse'
	opts={} #dict: "/usr/share/dict/french"
	optparse = OptionParser.new do |opt|
		opt.banner = "Boggle"
		opt.on("-d", "--dict=files", Array, "Word lists") do |v|
			opts[:dict]=v
		end
	end
	optparse.parse!
	game=Boggle.new(*opts[:dict])
	ARGV.each do |g|
		game.play(g)
	end
end
