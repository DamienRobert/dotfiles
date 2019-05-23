#!/usr/bin/env ruby

#an example of a module with a core module, extension methods and helper functions in the singleton_class
module Foo
	module Core
		def wrap
			"foo"+self.to_s+"bar"
		end
	end

	include Core
	def wrap?
		!! (self.to_s =~/^foo.*bar$/)
	end
	def unwrap
		self.sub(/^foo/,'').sub(/bar$/,'')
	end
	#one could also redefine wrap here and call 'super'

	module Helpers
		def mixin(m)
			m.send(:include,self)
		end

		def mixin_string
			mixin(String)
		end
	end
	extend Helpers
end

#now we extend wrap
module Bar
	#this is not really needed, we could just
	#put the def of wrap after 'include Foo' (since Foo includes Core))
	#this is what we do below
	module Core
		include Foo::Core
		def wrap
			"ploum "+super+" plam"
		end
	end

	include Foo
	include Core #override Foo#wrap
	extend Foo::Helpers
end

#we can abstract this approach
module Foo::Helpers
	def enhance_mod(m)
		curmod=self
		Module.new do
			include curmod
			#extend curmod.singleton_class #does not work as is because we can't extend a class, but see my library 'meta_ext.rb'
			extend Foo::Helpers
			# or extend curmod.const_get(:Helpers)
			include m
		end
	end
end

module BazCore
	class <<self
		attr_accessor :active
	end
	self.active=true
	klass=self
	#we use define_method here so that we have a closure and klass is defined
	define_method :wrap do
		klass.active ? super() : self
	end
end
#note: the advantage of our definition of BazCore#wrap compared to
#def wrap
#	BazCore.active ? super() : self
#end
#is that we can change the name of BazCore more easily

Baz=Foo.enhance_mod(BazCore)
#=> Baz [=> Foo::Helpers], Baz::Core, Foo, Foo::Core

Baz.mixin_string
puts "ploum".wrap.wrap? #=> true
BazCore.active=false
puts "ploum".wrap #=> "ploum"

################################################
#another example, where we don't want to include Foo::Core in Foo
#and generate a new module directly
module Foo2
	module Core
		extend self
		def wrapper(s)
			"foo"+s.to_s+"bar"
		end
	end

	def wrap
		#If defined as #Core.wrapper(self), Core will always refer to Foo::Core
		#(because cref is lexical first). To do a dynamic search, we need to do:
		(singleton_class.ancestors.find do |m|
			m.const_defined?(:Core)
		end.const_get(:Core)).wrapper(self)
	end

	module Helpers
		def mixin(m)
			m.send(:include,self)
		end

		def mixin_string
			mixin(String)
		end

		def new_module
			curmod=self
			m=Module.new do
				include curmod
				core=Module.new do
					include curmod.const_get(:Core)
					extend self
				end
				helpers=Module.new do
					include curmod.const_get(:Helpers)
				end
				const_set("Core",core)
				const_set("Helpers",helpers)
				extend helpers
			end
		end
	end
	extend Helpers
end

Bar2=Foo2.new_module
#=> module Bar2; include Foo2; module Core; include Foo2::Core; extend self; end; module Helpers; include Foo2::Helpers; end; extend Helpers; end
module Bar2
	def wrap
		"Bar2: "+super
	end
end
module Bar2::Core
	def wrapper(s)
		"ploum "+super+" plam"
	end
end
puts (Class.new(String) { include Bar2 }).new("object").wrap
#=> Bar2: ploum fooobjectbar plam

Baz2=Bar2.new_module
module Baz2
	def wrap
		"Baz2: "+super
	end
end
puts (Class.new(String) { include Baz2 }).new("object").wrap
#=> Baz2: Bar2: ploum fooobjectbar plam
#Baz2 ->Bar2 -> Foo2
#Baz2::Core ->Bar2::Core -> Foo2::Core
#Baz2::Helpers ->Bar2::Helpers -> Foo2::Helpers
