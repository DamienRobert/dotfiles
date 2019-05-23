=begin
https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/RefinementsSpec

NOTE: The lookup order for a class C is: refinements of C (and their prepended and included modules) -> prepended modules of C -> C -> included modules of C -> the superclass of C.
In this specification subclasses have priority over refinements. (ie Subclass#foo is called before Class#refined_foo)

NOTE: In this specification, super in a method of a refinement R invokes the method in the refined class C of R even if there is another refinement for C which has been activated in the same context before R.

More precisely, the code behaves as if R.superclass=C, ie it goes through the included modules of R then pass to C, bypassing any other active refinements
=end

class Foo
	def initialize(foo=nil)
		@foo=foo
	end
	def foo
		"Foo#foo: #{@foo}"
	end
	def foo2
		"Foo#foo2: #{@foo}"
	end
end

class Bar < Foo
	def foo
		"Bar#foo->"+super
	end
end

module RefPrepend1
	def foo
		"In RefPreprend1 ->"+super
	end
end
module RefInclude1
	def foo
		"In RefInclude1 ->"+super
	end
	# def foo2
	# 	"In RefInclude1 ->"+super
	# end
end
module RefPrepend2
	def foo
		"In RefPreprend2 ->"+super
	end
end
module RefInclude2
	def foo
		"In RefInclude2 ->"+super
	end
end
module RefPrepend3
	def foo
		"In RefPreprend3 ->"+super
	end
end
module RefInclude3
	def foo
		"In RefInclude3 ->"+super
	end
end

prepend_ref=module Prepend #RefPrepend1 -> Prepend -> RefInclude1
	refine Foo do
		include RefInclude1
		prepend RefPrepend1
		def foo2
			"In Prepend#Ref:Foo#foo2 ->"+super
		end
	end
end
include_ref=module Include #RefPrepend3 -> Include -> RefInclude3

	refine Foo do
		include RefInclude3
		prepend RefPrepend3
		def foo
			"In Include#Ref:Foo#foo ->"+super
		end
	end
end

foo_ref=module FooRef #RefPrepend1 -> Prepend -> RefInclude1 -> RefPrepend2 -> FooRef -> RefInclude2 -> RefPrepend3 -> Include -> RefInclude3
	include Include #Using FooRef will activate the corresponding refinements of Include/Prepend; in the order Prepend -> FooRef -> Include
	prepend Prepend
	refine Foo do
		include RefInclude2
		prepend RefPrepend2
		def foo2
			"In #Ref:Foo#foo2 ->"+super
		end
	end
end

using FooRef
f=Bar.new "bar"
def f.foo
	"In singleton_class ->"+super
end
puts f.foo # => In singleton_class ->Bar#foo -> Foo#foo: bar
#Explanation: there are no refinements for Foo#foo active in the definition
#of Bar#foo

f=Foo.new "foo"
def f.foo
	"In singleton_class ->"+super
end
puts f.foo # => In singleton_class ->In RefPreprend1 ->In RefInclude1 ->In RefPreprend2 ->In RefInclude2 ->In RefPreprend3 ->In Include#Ref:Foo#foo ->In RefInclude3 ->Foo#foo: foo
# Explanation: this is probably a bug, when super is called in RefInclude1,
# the "superclass" should be Foo, not the next refinement FooRef. But since
# super is called in an included Module and not directly in the Refinement
# module, it seems there is a bug. See below.
puts f.foo2 # => In Prepend#Ref:Foo#foo2 ->Foo#foo2: foo
# Explanation: in Prepend#Ref:Foo#foo2, super calls directly Foo#foo2
# Note that adding in RefInclude1
# def foo2
# 	"In RefInclude1 ->"+super
# end
# change the result to 'In Prepend#Ref:Foo#foo2 ->In RefInclude1
# ->Foo#foo2: foo', so here the super bypass after RefInclude1 works (ie as
# long as there is a method in the refinement module)


##############################################################################
# strange behavior with super
# Submitted: https://bugs.ruby-lang.org/issues/13271

class Foo
	def foo
		"Foo#foo"
	end
	def bar
		"Foo#bar"
	end
end
class Bar < Foo
	def foo
		"Bar#foo -> "
	end
	def bar
		"Bar#bar -> "+super
	end
end

module R1
	def foo
		"R1#foo -> "+super
	end
	def bar
		"R1#bar -> "+super
	end
end
module R2
	def foo
		"R2#foo -> "+super
	end
	def bar
		"R2#bar -> "+super
	end
end

module M2
	refine Foo do
		include R2
		def foo
			"refinement:Foo@M2#foo -> "+super
		end
		def bar
			"refinement:Foo@M2#bar -> "+super
		end
	end
end

module M1
	include M2
	refine Foo do
		include R1
		def foo
			"refinement:Foo@M1#foo -> "+super
		end
	end
end

#using M2
using M1 #if we had not included M2 in M1, 'using M2; using M1' would give the same results
puts Foo.new.foo #=> refinement:Foo@M1#foo -> R1#foo -> Foo#foo
# Explanation: in R1, super jumps to Foo as a superclass and bypass the
# refinement M2
puts Foo.new.bar #=> R1#bar -> refinement:Foo@M2#bar -> R2#bar -> Foo#bar
# This is a bug, since the refinement of Foo in M1 does not have 'foo2',
# the bypass of M2 does not occur. Cf above too
puts Bar.new.foo #=> Bar#foo -> 
puts Bar.new.bar #=> Bar#bar -> Foo#bar
# Explanation: in Bar the refinements for Foo are not active

#########################################################################
## Trying to correct behaviour '3)' which is not a bug

module StringRef
	def foo
		"foo"
	end
	def bar
		foo
	end
end

module Ref
	refine String do
		include StringRef
		#StringRef.instance_methods.each do |m|
		#	define_method(m) {|*args,&b| super(*args,&b) }
		#end
		def foo; super; end
		def bar; super; end #does not work :-( since :foo is called in StringRef where refinements are not active
		# More precisely, the def bar; super; end is useless, in any case the
		# bar from StringRef is called; which calls foo but here the
		# refinements are not active, so foo does not work.
	end
end

module Test
	using Ref
	puts "foo".foo #foo
	## puts "foo".bar #in `bar': undefined local variable or method `foo' for "foo":String (NameError)
end

# so we cannot use MonkeyPatches as refinements if they call each other.
# trick from
# https://stackoverflow.com/questions/31097733/how-to-share-code-between-ruby-refinements

$ref = lambda do
  def foo
    puts :in_foo
  end
  def bar
    puts :in_bar
    foo
  end
end
module Refinement
  refine Hash do
    $ref.call
  end
end
module Test
  using Refinement
  Hash.new.bar
end

module Monkey
  $ref.call
end #this works, but strangely Monkey.instance_methods return nothing
class Hash
  include Monkey
end
Hash.new.bar

# Trying with define_method
$ref = lambda do |klass|
  p klass
  klass.define_method :foo do
    puts :in_foo
  end
  klass.define_method :bar do
    puts :in_bar
    foo
  end
end
module Refinement
  refine Hash do
    $ref.call(self)
  end
end
module Test
  using Refinement
  Hash.new.bar
  # => <refinement:Hash@Refinement>
  # in_bar
  # NameError: undefined local variable or method `foo' for {}:Hash
end

module Monkey
  $ref.call(self)
end #this do define instance_methods
class Hash
  include Monkey
end
Hash.new.bar


##########################################################################

# Cf https://bugs.ruby-lang.org/issues/13236
# In futures rubies we won't be able to include refining modules
## module M
##   include refine(String) {def test;:ok end} # in `append_features': refinement module is not allowed (ArgumentError) [new 2.5 error: we cannot include a refinement module)
## end
## class C
##   include M #=> error
## end
## GC.stress = true
## C.new("foo").test

#even if we return the refining module directly
r=lambda do Module.new do
  return refine(String) {def length;super+5 end}
end end.call
## c=Class.new do
##   include r #=> error: in `append_features': refinement module is not allowed (ArgumentError)
## end
GC.stress = true
# c.new("foo").test
p r.instance_method(:length).bind("foo").call #works: => 8
