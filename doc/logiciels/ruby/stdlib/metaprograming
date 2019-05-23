# vim: foldmethod=marker ft=markdownlight

# Instance Methods {{{1
~~~ ruby
class Person
  def name
    "Matz"
  end
end

Person.class_eval do #or module_eval
  def name
    "Matz"
  end
end
~~~

# Singleton Methods {{{1
http://stackoverflow.com/questions/6759777/ruby-singleton-methods-for-class-and-objects

~~~ ruby
class MyClass
end
obj = MyClass.new

class << obj
  def first_sing_method
    'first'
  end
end

def obj.second_sing_method
  'second'
end

obj.define_singleton_method(:third_sing_method) do
  'third'
end

obj.instance_eval do
  def fourth_sing_method
  end
end
~~~
with a class we also have as a specialisation of the above methods
~~~ ruby
class MyClass
  class << self
    def ploum
    end
  end

  def self.plam
  end
  
  define_singleton_method(:plom) do
  end
end
~~~
# Methods {{{1
- obj.method(:foo) #=> return a bound method, can use .unbind, or .call or .name to get the corresponding symbol
  obj.singleton_method(:foo) #=> like #method but only return singleton_methods
- klass.instance_method(:foo) #=> return an unbound method
=> obj.bind(m).call(*args)
- :foo.to_proc #use the method :foo on the first passed argument
Ex: (:foo.to_proc).call(obj,*args) will do obj.method(:foo).call(*args)
    or equivalently obj.send(:foo,*args)
- send(:foo, args)

- define_method, define_singleton_method (like singleton_class.define_method)
The block passed to define_method is kept and instance_evaled when the
method is called.
Ex: klass.define_method(:foo,&b)
obj=klass.new; obj.foo #=> calls obj.instance_eval(&b)
#}}}1

# Constants Lookup {{{1
- http://cirw.in/blog/constant-lookup
très bien expliqué
- http://stackoverflow.com/questions/2687276/scope-of-constants-in-ruby-modules
nice examples of metaprogramming too

Module nesting à l'oeuvre:
~~~ ruby
class Foo
  class Bar
  end
end
Baz = Class.new do
  class Quux
  end
end
puts Foo::Bar
puts Quux
#ie Bar lives inside Foo but Quux is outside Baz

CONST = "outer"
module A
  CONST = "inner"
end
# This is A::CONST
module A
  class B
    def B.get_const
      CONST #here B is nested in A
    end
  end
end
A::B.get_const # => "inner"
class A::C
  def (A::C).get_const
    CONST #here C is not nested in A
  end
end
A::C.get_const # => "outer"
~~~


# Singleton, Struct, Forwardable, Delegate {{{1
## Singleton {{{2
http://ruby-doc.org/stdlib-1.9.3/libdoc/singleton/rdoc/Singleton.html
~~~ ruby
require 'singleton'
class Foo
  include Singleton
end
a,b=Foo.instance, Foo.instance
a==b #=>true
~~~
For other ways, see: https://practicingruby.com/articles/ruby-and-the-singleton-pattern-dont-get-along
Example of usage: http://dalibornasevic.com/posts/9-ruby-singleton-pattern

## Struct {{{2
~~~ ruby
Customer = Struct.new(:name, :address) #Customer is a class!
cus=Customer.new("Dave", "123 Main")
cus.name #=> Dave

class Foo < Struct.new(:x,:y) #subclassing works!
end
foo=Foo.new(1,2)
foo.x
~~~

Note: by contrast `foo=OpenStruct.new` is an object of class OpenStruct
~~~ ruby
require 'ostruct'
a=OpenStruct.new
a.foo="foo"
a.class #=>OpenStruct
~~~

## Forwardable {{{2
~~~ ruby
require 'forwardable'
class Foo
  extend Forwardable
  def_delegators(accessor, *methods) #=> map method in methods to accessor
  def_delegator(accessor, method, ali = method) #=>maps ali to accessor.method
  delegate {:foo => accessor1, [:bar,:baz] => accessor2} #=>maps bar to accessor2.bar and so on
  #or use the aliases def_instance_delegator[s],instance_delegate
end
~~~
Forwardable when applied to a module gives instance method (the defs are
evalued via module_eval), to an object it gives singleton methods (the
defs are evalued via instance_eval).
To force singleton methods (to set up delegation for a class or module),
use SingleForwardable
(which define def_delegator and so on or the aliases def_single_delegator[s],single_delegate)
~~~ ruby
#From forwardable.rb:
printer = String.new
printer.extend SingleForwardable        # prepare object for delegation
#Here printer.extend Forwardable would work too
printer.def_delegator "STDOUT", "puts"  # add delegation for STDOUT.puts()
printer.puts "Howdy!"
#This bugs! NoMethodError: undefined method `method_defined?' for "":String (forwardable.rb:182)
#=> we would need to call 'klass=self.kind_of?(Module) : self : self.singleton_class; klass.method_defined?' instead

printer.singleton_class.extend Forwardable
printer.singleton_class.def_delegator "STDOUT", "puts"
print.puts "Howdy!"

class Implementation
  def self.service
    puts "serviced!"
  end
end
module Facade
  #here we have to use SingleForwardable to get singleton methods
  extend SingleForwardable
  def_delegator :Implementation, :service
end
Facade.service #=> serviced!
~~~
## Delegate {{{2
Delegator is a factory class, the implementation is done by SimpleDelegator
or DelegateClass

~~~ ruby
require 'delegate'
class Foo < SimpleDelegator
end
foo=Foo.new("foo") #delegate unknown methods to "foo"
foo.length #=>3
SimpleDelegator.new("foo").length #=>3
~~~
One can access the delegated object via `__getobj__` and change it via
`__setobj__`. Since SimpleDelegator is a subclass of Delegator, super works
too:
~~~ ruby
require 'delegate'
class Foo < SimpleDelegator
  def length
    "My length: #{super}"
  end
  def length2
    "My length2: #{__getobj__.length}"
  end
end
foo=Foo.new("foo")
foo.length #=>My length: 3
foo.length2 #=>My length2: 3
~~~

Here is the implementation of SimpleDelegator:
~~~ ruby
require 'delegate'
class SimpleDelegator < Delegator
  def initialize(obj)
    super                  # pass obj to Delegator constructor, required
    @delegate_sd_obj = obj # store obj for future use
  end

  def __getobj__
    @delegate_sd_obj # return object we are delegating to, required
  end

  def __setobj__(obj)
    @delegate_sd_obj = obj # change delegation object,
  end
end
~~~

For more complex use, see `DelegateClass`
~~~ ruby
require 'delegate'
class MyClass < DelegateClass(ClassToDelegateTo) # Step 1
  def initialize
    super(obj_of_ClassToDelegateTo)              # Step 2
  end
end

class Foo < DelegateClass(Array)
  def initialize(a)
    super(a)
  end
end
foo=Foo.new([1,2])
foo.length #=> 2
~~~
This uses `Delegator.delegating_block(mid)`
(which is just a lambda that calls `self.__getobj__.__send__(mid,*args,&block)`)
to define the delegated methods:
~~~ ruby
def DelegateClass(superclass)
  klass = Class.new(Delegator)
  methods = superclass.instance_methods
  methods.each do |method|
    define_method(method, Delegator.delegating_block(method))
  end
  klass
end
~~~
In practice, DelegateClass is like a SimpleDelegator, but it predefines the
method from 'superclass' for delegation for efficiency
#}}}1

# Module Factory {{{1
~~~ ruby
#via subclassing module
class ModuleAttr < Module
  def initialize(*attrs,&b)
    attr_accessor *attrs
    super(&b)
  end
end
class Book
  include ModuleAttr.new(:title)
  def title
    "Book: #{super}"
  end
end
b=Book.new; b.title="My Book"; b.title #=> "Book: My Book"

#via Module.new
module ModuleAttr2
  def self.new(*attrs,&b)
    m=Module.new(&b)
    m.module_eval do
      attr_accessor *attrs
    end
    m
  end
end
class Book2
  include ModuleAttr2.new(:title)
  def title
    "Book: #{super}"
  end
end
b=Book2.new; b.title="My Book"; b.title #=> "Book: My Book"

#This can be extended at wish:
class ModuleStruct < Module
  def initialize(*attributes)
    @attributes = attributes
    attr_reader *attributes
    define_method :initialize do |data| #here initialize is an instance method of the created module
      attributes.each do |attribute|
        instance_variable_set("@#{attribute}", data[attribute])
      end
    end
  end
  def inspect #here inspect is a method of the created module
    "#{self.class.to_s}(#{@attributes.map(&:inspect).join(', ')})"
  end
end
class Book3
  include ModuleStruct.new(:title)
  def title
    "#{self.class.name}: #{super}"
  end
end
book3 = Book3.new(title: "My Book")
puts book3.title #=>Book3: My Book
p ModuleStruct(:title)#=>ModuleStruct(:title)

#Note: Class can't be subclassed, the solution is to use the
#singleton_class: class Foo; extend Ploum; #class_helpers; end
~~~
#}}}1
# Examples {{{1
# Module instance variables:
~~~ ruby
module Foo
  include Module.new {
    attr_accessor :foo
  } #using do/end here would pass the block to include and not Module.new
  def foo
    super
    @foo||="default_foo"
  end  
  extend Foo
end
Foo.foo
~~~
# }}}1

# Methods modifiers {{{1
See ex/method_modifier.rb
inspired by https://github.com/leemachin/node_module/blob/master/lib/node_module.rb
See also: http://stackoverflow.com/questions/1891429/decorators-in-ruby-migrating-from-python
http://stackoverflow.com/questions/8022986/what-actually-occurs-when-stating-private-protected-in-ruby
(for an example which undefined method_added once it has done its job)
# }}}1
