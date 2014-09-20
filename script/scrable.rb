#!/usr/bin/env ruby

#generate a list of words of length n, each word changing from the previous
#by one character
require 'active_support'
require 'active_support/inflector'
$length=6

def get_words(file)
	words=[]
	unless file.nil?
		File.readlines(file).each do |line|
			line=line.chomp
			words << ActiveSupport::Inflector.transliterate(line) if line.length == $length
		end
	end
	return words.uniq!||[]
end

#similar up to no permutation
def similar_noperm(w1,w2)
	c1=w1.chars;c2=w2.chars;
	#p w1,w2,(0...$length).inject(0) {|sum,i| sum + (c1[i]==c2[i] ? 1 : 0) } 
	return (0...$length).inject(0) {|sum,i| sum + (c1[i]==c2[i] ? 1 : 0) } == $length-1
end

#similar up to a permutation
def similar(w1,w2)
#two different ways to construct a multiset http://stackoverflow.com/questions/5128200/how-to-count-identical-string-elements-in-a-ruby-array
#a.group_by {|name| name}.map {|k,v| [k,v.length]}
#a.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
	c1=w1.chars;c2=w2.chars;
	h1=c1.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
	h2=c2.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
	w1 != w2 and (h1.keys+h2.keys).uniq.each.inject(0) do |sum,k|
		sum+(h1[k]-h2[k]).abs
	end <= 2
end


def next_words(word, words)
	nextw=[]
	words.each do |w|
		nextw << w if similar(word,w)
	end
	return nextw
end

lastword=ARGV.shift.chomp
dict_file=ARGV.shift
done_file=ARGV.shift

words=get_words(dict_file)-get_words(done_file)

#check if donew works
#donew=get_words(done_file) (attention à enlever le .uniq! pour let est)
#p donew
#p (0...donew.length-1).map { |i| similar(donew[i],donew[i+1])}.include?(false)
#(0...donew.length-1).map do |i|
#	print donew[i]," ",donew[i+1],"\n" unless similar(donew[i],donew[i+1])
#end

$max=0
def maximal_chain(chain,words)
	nws=next_words(chain.last,words)
	curmax=chain
	#print curmax.length," "
	#p curmax if curmax.length % 100 == 0
	if $max < curmax.length then
		$max=curmax.length
		print "#{$max} "
		p curmax if $max % 100 ==0
	end
	nws.each do |nw|
		nchain=chain.dup << nw
		nwords=words.dup
		nwords.delete(nw)
		if nwords.empty?
			puts "Maximal chain reached:",nchain
			return nchain
		end
		maxchain=maximal_chain(nchain,nwords)
		curmax=maxchain if curmax.length < maxchain.length
	end
	return curmax
end

def random_chain(chain,words)
	loop do
		nws=next_words(chain.last,words)
		return chain if nws.empty?
		nw=nws.sample
		chain << nw
		words.delete(nw)
		print "#{chain.length} "
		puts '',chain.join(" ") if chain.length % 100 ==0
	end
end

puts "Number of words available: #{words.length}"
p next_words(lastword,words).sort
begin
	#p maximal_chain([lastword],words)
	puts random_chain([lastword],words).join(" ")
rescue Interrupt
end
