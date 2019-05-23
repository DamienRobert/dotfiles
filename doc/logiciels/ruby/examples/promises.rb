#http://dinshaw.github.io/promises-sildes/

Promise.new { |fulfill, reject|
	cat_pics = get_cat_pics
	if cat_pics.size > 0
		fulfill.call cat_pics
	else
		reject.call 'No cat pics!'
	end
}

class Promise
	def initialize
		@state = :pending
		@value = nil
		begin
			yield method(:fulfill), method(:reject)
		rescue Exception => e
			reject(e)
		end
	end

	def self.all(promises)
		Promise.new do |fulfill, reject|
			results = []
			on_success = ->(result) do
				results << result
				if results.size == promises.size
					fulfill.call(results)
				end
			end
			promises.each do |promise|
				promise.then(on_success, reject)
			end
		end
	end
end
