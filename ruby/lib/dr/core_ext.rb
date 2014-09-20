class Hash
	# Returns a new hash with +self+ and +other_hash+ merged recursively.
	#
	#		h1 = { x: { y: [4,5,6] }, z: [7,8,9] }
	#		h2 = { x: { y: [7,8,9] }, z: 'xyz' }
	#
	#		h1.deep_merge(h2) #=> {x: {y: [7, 8, 9]}, z: "xyz"}
	#		h2.deep_merge(h1) #=> {x: {y: [4, 5, 6]}, z: [7, 8, 9]}
	#		h1.deep_merge(h2) { |key, old, new| Array.wrap(old) + Array.wrap(new) }
	#		#=> {:x=>{:y=>[4, 5, 6, 7, 8, 9]}, :z=>[7, 8, 9, "xyz"]}
	#
	#		Adapted from active support
	def deep_merge(other_hash, &block)
		dup.deep_merge!(other_hash, &block)
	end

	# Same as +deep_merge+, but modifies +self+.
	def deep_merge!(other_hash, &block)
		other_hash.each_pair do |k,v|
			tv = self[k]
			case
			when tv.is_a?(Hash) && v.is_a?(Hash)
				self[k] = tv.deep_merge(v, &block)
			when tv.is_a?(Array) && v.is_a?(Array)
				if v.length > 0 && v.first.nil? then
					#hack: if the array begins with nil, we overwrite with the new
					#value rather than append it
					v.shift
					self[k]=v
				else
					self[k] += v
				end
			else
				self[k] = block && tv ? block.call(k, tv, v) : v
			end
		end
		self
	end
end
