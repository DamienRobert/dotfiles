def reload
	@nbgames=1
	@cards=(1..10).to_a*4*@nbgames + [1,2,3]*4*@nbgames
	# @cards=(1..10).to_a*4*2 + [10,10,10]*4*2
	@cards.shuffle!

	@nbrounds=2
	@nb_step0=25
	@nb_steps=25
end
reload

def play_rounds(i)
	n=0; r=[]; j=i
	until n > @nbrounds*@cards.length
		r << j
		n+=@cards[j]
		j=(i+n) % @cards.length
	end
	return r
end

def play_steps(i)
	n=0; steps=0; j=i; r=[]
	until steps >= @nb_step0
		steps+=1
		r << j
		n+=@cards[j]
		j=(i+n) % @cards.length
	end
	return r
end

def test(rounds=false)
	r={}
	for i in (0...@cards.length) do
		rounds ? r[i]=play_rounds(i) : r[i]=play_steps(i)
	end

	min_percent=100.0
	max_percent=0.0
	average_percent=0
	average_length=0
	for i in (0...@cards.length) do
		target=r[i].last
		# target=r[i][-2]
		success=0
		for j in (0...@cards.length) do
			success+=1 if r[j][0..(rounds ? -1 : @nb_steps-1)].include?(target)
		end
		percent=success*100.0/@cards.length
		min_percent=[percent, min_percent].min
		max_percent=[percent, max_percent].max
		average_percent+=percent
		average_length+=r[i].length
		# puts "Position #{i}: success: #{success} (#{percent}%)"
	end
	average_percent=average_percent/@cards.length
	average_length=average_length/@cards.length

	p r[0]
	p r[10]
	puts "Average: #{average_percent}%, max #{max_percent}%, min #{min_percent}%, length: #{average_length}"
end

def rho(i)
	n=0; j=i; r=[]
	until r.include?(j)
		r << j
		n+=@cards[j]
		j=(i+n) % @cards.length
	end
	colision=r.find_index(j)
	tail=r[0...colision]
	loop=r[colision..-1]
	# max=loop.max
	return tail, loop
end

def all_rho
	r={}
	loops=[]
	tails=[]
	# l_tail=0.0
	l_loop=0.0
	for i in (0...@cards.length) do
		tail, loop=rho(i)
		tails << tail
		max=loop.max
		# l_tail+=tail.length
		unless loops.include?(max)
			loops << max
			l_loop+=loop.length
		end
	end
	puts "Nb loops: #{loops.length}, av. loop length: #{l_loop/loops.length}, av. tail length: #{tails.map{|t| t.length}.sum/@cards.length} (min: #{tails.map{|t| t.length}.min}, max: #{tails.map{|t| t.length}.max})"
end
