# Inspired by https://github.com/leemachin/node_module/blob/master/lib/node_module.rb

module Modifier
	def wrap(*methods)
		if methods.empty?
			Helpers.future_replace(self)
		else
			methods.each {|method| Helpers.replace(self, method)}
		end
	end

	module Helpers
		extend self
		def replace(receiver, name)
			old_method=receiver.instance_method(name)
			receiver.send :define_method, name do |*args|
				puts "Before call: #{args}"
				r=old_method.bind(self).call(*args) #because define_method use instance_eval, the self here is the one that calls the method
				puts "After call: #{r}"
				r
			end
		end

		def future_replace(receiver)
			active = nil
			receiver.define_singleton_method(:method_added) do |name|
				return if active 
				active = true #prevent recursion when calling wrap bellow which define a new method
				receiver.wrap(name)
				active = false
			end
		end
	end
end

class Foo
	extend Modifier
	def foo; "foo"; end
	wrap :foo
	wrap def bar; "bar"; end
	wrap
	def ploum(*args) args.first; end
end
foo=Foo.new
foo.foo
#=> Before call: []
#=> After call: foo
foo.bar
#=> Before call: []
#=> After call: bar
foo.ploum(2,3)
#=> Before call: [2, 3]
#=> After call: 2
