class Stream
	def initialize
		@buffer=[]
	end

	def close
		raise StopIteration
	end

	#def next
	#	@f.resume
	#end

	def <<(item)
		@buffer << item
	end

	def to_enum
		Enumerator.new do |yielder|
			item=@buffer.shift
			yielder << item if item
		end.lazy
	end
end
