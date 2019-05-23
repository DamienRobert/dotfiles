#puts "ploum: #{ploum}" #not passed by load
#puts "In loadee, $LOADED_FEATURES: #{$LOADED_FEATURES}"
puts "in loadee nesting: #{Module.nesting}, self: #{self}"
puts "@plam: #{@plam}"
@plim="plim"

module Foo
	def self.foo
		p "foo"
	end
end
