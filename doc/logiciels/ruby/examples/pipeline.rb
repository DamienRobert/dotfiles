=begin
Enumerator::Generator.new do |yielder|
	yielder << 1
	yielder << 2
end.each { |v| p v } #=> 1, 2

Enumerator.new do |yielder|
	yielder << 1
	yielder << 2
end.tap { |e| p e.next; p e.next } #=> 1, 2

#A Consumer which is symmetric from a Producer role
Consumer::Receiver.new do |awaiter|
	p awaiter.await 1
	p awaiter.await 2
end.feed { |arg| arg+1 } #=> 2,3

Consumer.new do |awaiter|
	p awaiter.await 1
	p awaiter.await 2
end.tap { |c| c<<1; c<<2 } #=> 2,3

# And more generally
Transformer.new do |t|
	a=t.await; t.yield(a+1)
	a=t.await; t.yield(a+2)
end.pipe {|y| p y<<1; p y<<2} #=>2,4

#which would be equivalent to
f=Fiber.new do |a|
	a=Fiber.yield(a+1)
	a=Fiber.yield(a+2)
end.tap {|f| p f.resume(1); p f.resume(2) } #=>2, 4
=end

class Producer #This is like Enumerator without some features (rewind, feed)
	class Yielder #This is Enumerator::Yielder
		def initialize(&b)
			@proc=b
		end
		def yield(*args)
			@proc.call(*args)
		end
		def <<(*args)
			yield(*args)
			self
		end
	end

	class Generator #This is almost Enumerator::Generator
		def initialize(&b)
			@proc=b
		end
		def produce(consumer, *args)
			@proc.call(consumer, *args)
		end
		def each(*args)
			produce(Enumerator::Yielder.new {|*inargs| yield *inargs}, *args)
		end
	end
end

=begin
prod=Producer::Generator.new do |consumer| #a consumer is any object accepting '>>'
	consumer <<1
	consumer <<2
end
prod.produce([]) #1,2
prod.produce(Producer::Yielder.new {|x| p x+1}) #2,3
prod.each {|v| p v+2}
#passing arguments:

prod=Producer::Generator.new do |consumer,s|
	consumer.<<(1,s)
	consumer.<<(2,s)
end.each(3) {|a,b| p a,b} #=> [1,3], [2,3]
=end

#A Producer should be able go generate one object, via Producer#>>
#This is exactly what Enumerator#next provides, which we reimplement
class Producer
	def initialize(&b)
		@object=Generator.new(&b)
	end
	def >>(*args)
		#note that *args are useless (apart from the first time)
		@generator ||= FiberGenerator.new(@object,*args)
		begin
			return @generator.next if @generator.next?
		rescue StopIteration
		end
		exception = StopIteration.new "iteration reached end"
		#unfortunately in mri we cannot modify exception.result directly, so we need to wrap it
		class << exception; attr_accessor :result; end
		exception.result = @generator.result
		raise exception
	end

	#FiberGenerator.new(obj) (taken from rubinius) wraps obj.each into a fiber
	#on which we can call 'next'
	class FiberGenerator
		attr_reader :result
		def initialize(obj,*args)
			@done=false
			@fiber = Fiber.new do
				@result=obj.each(*args) do |*val|
					Fiber.yield *val
				end
				@done=true
			end
		end
		def next?
			!@done
		end
		def next
			val = @fiber.resume
			raise StopIteration, "iteration has ended" if @done
			return val
		end
	end
end
=begin
p=Producer.new {|c| c<<17; c<<42; 13}
p.>> p.>>; p.>> #=> 17, 42, StopIteration (.result=13)
=end

class Consumer #note the similarity with Producer, we only replace '<<' by '>>'
	class Awaiter
		def initialize(&b)
			@proc = b
		end
		def await(*args)
			@proc.call *args
		end
		def >>(*args)
			await(*args) #here we really want the value; this is the only difference with Yielder
		end
	end
	class Receiver
		def initialize(&b)
			@proc = b
		end
		def consume(producer,*args)
			@proc.call(producer,*args)
		end
		def feed(*args)
			consume Awaiter.new {|*inargs| yield *inargs}, *args
		end
	end
end

=begin
c=Consumer::Receiver.new do |producer|
	a=producer.>>
	b=producer.>>
	a+b
end
v=[3,4]; class << v; def >>; shift; end; end
c.consume(v) #=>7
c.feed {3} #=>6 #this is of course a lot less useful than Producer::Generator#each
c.consume(Producer.new do |c| c<<3; c<<4; end) #=>7

#with arguments
Consumer::Receiver.new do |producer, s|
	a=producer.>>(1,s)
	b=producer.>>(2,s)
	a+b
end.feed(3) {|a,b| a*b} #=>9=1*3+2*3

#We want 'Consumer.<<' so that we can do
p=Producer::Generator.new do |c| c<<3; c<<3; end
p.produce(Consumer.new do |p| a=p.>>; b=p.>>; a+b; end)
=end

class Consumer
	def initialize(&b)
		@object=Receiver.new(&b)
	end
	#the first '<<' is more similar to a 'start'
	#it is used to pass args to feed
	def <<(*vals)
		@generator ||= FiberGenerator.new(@object,*vals)
		begin
			if @generator.next?
				@generator.next(*vals) 
				return self
			end
		rescue StopIteration
		end
		exception = StopIteration.new "iteration reached end"
		class << exception; attr_accessor :result; end
		exception.result = @generator.result
		raise exception
	end

	#Here we wrap 'feed' instead of 'each'
	class FiberGenerator
		attr_reader :result
		def initialize(obj,*args)
			@done=false
			@fiber = Fiber.new do
				@result=obj.feed(*args) do
					Fiber.yield
				end
				@done=true
			end
		end
		def next?
			!@done
		end
		def next(*vals)
			@fiber.resume(*vals) #this will be nil
			raise StopIteration, "iteration has ended" if @done
		end
	end
end
=begin
cons=Consumer.new {|p,a| b=p.>>; c=p.>>; p a+b+c; a+b+c}
cons<<1; cons<<2; begin cons<<3; rescue StopIteration=>e; e.result; end #=> 6
=end

class Pipeline #Pipeline=Producer+Consumer
	class Lambda
		def initialize(&b)
			@proc = b
		end
		def >>(*args)
			@proc.call(*args)
		end
		alias await >>
		alias yield >>
		def <<(*args) #<< are usually chainable
			@proc.call(*args)
			self
		end
	end
	class Pipe
		def initialize(&b)
			@proc = b
		end
		def connect(pipe,*args)
			@proc.call(pipe,*args)
		end
		alias produce connect
		alias consume connect
		def pipe(*args)
			connect Lambda.new {|*inargs| yield *inargs}, *args
		end
		alias each pipe
		alias feed pipe
	end
end
=begin
pl=Pipeline::Pipe.new do |pipe|
	a=pipe.>>
	b=pipe.>>
	pipe<<a+b
	pipe<<a*b
end
v=[3,4]; class << v; def >>; shift; end; end
pl.connect(v) #=>[7,12]
pl.pipe {|v| v.nil? ? 1 : puts(v+1) } #=>3;2
=end

class Pipeline
	def initialize(&b)
		@object=Pipe.new(&b)
	end
	def pipe(*args,&b)
		@object.pipe(*args,&b)
	end
	def start(*args)
		@generator ||= FiberGenerator.new(@object,*args)
		@generator.next #start
	end
	def step(vals=nil)
		@generator ||= FiberGenerator.new(@object)
		begin
			return @generator.next(*vals) if @generator.next?
		rescue StopIteration
		end
		exception = StopIteration.new "iteration reached end"
		class << exception; attr_accessor :result; end
		exception.result = @generator.result
		raise exception
	end
	alias >> step
	alias next step
	def <<(*args)
		step(*args)
		self
	end

	class FiberGenerator
		attr_reader :result
		def initialize(obj,*init_args)
			@done=false
			@fiber = Fiber.new do |*first_args|
				@result=obj.pipe(*(init_args+first_args)) do |*out_vals|
					Fiber.yield *out_vals
				end
				@done=true
			end
		end
		def next?
			!@done
		end
		def next(*vals)
			r = @fiber.resume(*vals)
			raise StopIteration, "iteration has ended" if @done
			return r
		end
	end
end
=begin
p=Pipeline.new do |pipe|
	a=pipe.>>
	b=pipe.>>
	pipe<<a+b
	pipe<<a*b
end
p.start; p<<5; p<<10; p.>> #15; 50

#The trivial pipe
trivial=Pipeline.new { |p,x| loop do puts x; x=p.yield x; end }

half=Pipeline.new do |p1,p2|
	loop do
		p1.>>
		p2<<(p1.>>)
	end
end
half.start(trivial); half<<3; half<<4; half<<5; half<<6 #print 4 and 6
=end

class Pipeline
	#greedily connect the input with a Producer
	def in_connect(prod) #needs prod.each
		prod.each { |e| self << e }
	end
	def in_connect2(prod) #needs prod.>>
		self.feed { prod.>> }
	end
	#connect the output with a consumer
	def out_connect(consumer) #needs consumer.feed
		consumer.feed { self.>> }
	end
	def out_connect2(consumer) #needs consumer.<<
		self.each { |e| consumer << e }
	end

	def map
		Pipeline.new do |p|
			self.pipe do |e|
				p << yield(e)
			end
		end
	end
	def in_map
		Pipeline.new do |p|
			self.pipe do
				yield p.>>
			end
		end
	end

	#TODO
	def lazy_connect(p2)
		Pipeline.new do |p|
			self.each do |e|
				p2<<e
			end
		end
	end
end

=begin
p1=Pipeline.new {|p| p<<3; p<<4}
p2=Pipeline.new {|p| p.>>-p.>>}
p1.out_connect(p2.self.object) #-1

p1=Pipeline.new {|p| p<<3; p<<4}
p2=Pipeline.new {|p| r=p.>>-p.>>; puts r; r}
p1m=p1.map {|x| x+1}; p1m.>>; p1m.>> #4,5
p2m=p2.in_map {|x| x*2}; p2m.start; p2m.<<3; p2m.<<4 #-2

p1=Pipeline.new {|p| p<<3; p<<4}
p2=Pipeline.new {|p| p.>>-p.>>}
p1.lazy_connect(p2)
=end

class Pipeline
	def self.connect(n)
		pipes=[]
		(0...n).each do |i|
			pipes[i]=Pipeline.new { |p,x| loop do puts x; x=p.yield x; end }
		end
		yield *pipes
	end
end
=begin
conn=Pipeline.connect(2) do |p1,p2|
	loop do
		a=p1.>>
		b=p1.>>
		p a; p b;
		p2<<b
		p2<<a
	end
end
=end
