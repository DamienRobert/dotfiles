# vim: foldmethod=marker ft=markdownlight

# Class method vs instance method {{{1

5 ways to define a class method:
===============================

(Notes, a "class method" or "module method" is just an instance method of
the metaclass)

~~~ ruby
class Person
  def self.species
    "Homo Sapien"
  end
end

class Person
  class << self
    def species
      "Homo Sapien"
    end
  end
end

class << Person #eigenclass
  def species
    "Homo Sapien"
  end
end

Person.instance_eval do
  def species
    "Homo Sapien"
  end
end

def Person.species
  "Homo Sapien"
end
~~~

For instance method:
===================

~~~ ruby
class Person
  def name
    "Matz"
  end
end

Person.class_eval do
  def name
    "Matz"
  end
end
~~~

Attention: comme les constantes, klass est lexical, pas dynamique.
Par exemple:
~~~ ruby
module Ploum
  def ploum
    def plam
    end
  end
end
class Plam
  include Ploum
end
a=Plam.new
a.ploum
Ploum.instance_methods #=> [:ploum, :plam]
~~~
On voit que a.ploum définit plam dans le module Ploum et pas seulement dans
la class Plam
#}}}
# Explanations{{{1
http://yehudakatz.com/2009/11/15/metaprogramming-in-ruby-its-all-about-the-self/
It comes down to the fact that all Ruby code is executed code–there is no separate compile or runtime phase. In Ruby, every line of code is executed against a particular self. Consider the following five snippets:

~~~ ruby
class Person
  def self.species
    "Homo Sapien"
  end
end

class Person
  class << self
    def species
      "Homo Sapien"
    end
  end
end

class << Person
  def species
    "Homo Sapien"
  end
end

Person.instance_eval do
  def species
    "Homo Sapien"
  end
end

def Person.species
  "Homo Sapien"
end

#All five of these snippets define a Person.species that returns Homo Sapien. Now consider another set of snippets:

class Person
  def name
    "Matz"
  end
end

Person.class_eval do
  def name
    "Matz"
  end
end
~~~

These snippets all define a method called name on the Person class. So
Person.new.name will return “Matz”. For those familiar with Ruby, this
isn’t news. When learning about metaprogramming, each of these snippets is
presented in isolation: another mechanism for getting methods where they
“belong”. In fact, however, there is a single unified reason that all of
these snippets work the way they do.

First, it is important to understand how Ruby’s metaclass works. When you
first learn Ruby, you learn about the concept of the class, and that each
object in Ruby has one:

~~~ ruby
class Person
end

Person.class #=> Class

class Class
  def loud_name
    "#{name.upcase}!"
  end
end

Person.loud_name #=> "PERSON!"
~~~

Person is an instance of Class, so any methods added to Class are available on Person as well. What they don’t tell you, however, is that each object in Ruby also has its own metaclass, a Class that can have methods, but is only attached to the object itself.

~~~ ruby
matz = Object.new
def matz.speak
  "Place your burden to machine's shoulders"
end
~~~

What’s going on here is that we’re adding the speak method to matz‘s metaclass, and the matz object inherits from its metaclass and then Object. The reason this is somewhat less clear than ideal is that the metaclass is invisible in Ruby:

~~~ ruby
matz = Object.new
def matz.speak
  "Place your burden to machine's shoulders"
end

matz.class #=> Object
~~~

In fact, matz‘s “class” is its invisible metaclass. We can even get access to the metaclass:

~~~ ruby
metaclass = class << matz; self; end
metaclass.instance_methods.grep(/speak/) #=> ["speak"]
~~~

At this point in other articles on this topic, you’re probably struggling
to keep all of the details in your head; it seems as though there are so
many rules. And what’s this `class << matz` thing anyway?

It turns out that all of these weird rules collapse down into a single
concept: control over the self in a given part of the code. Let’s go back
and take a look at some of the snippets we looked at earlier:

~~~ ruby
class Person
  def name
    "Matz"
  end

  self.name #=> "Person"
end
~~~

Here, we are adding the name method to the Person class. Once we say class Person, the self until the end of the block is the Person class itself.

~~~ ruby
Person.class_eval do
  def name
    "Matz"
  end

  self.name #=> "Person"
end
~~~

Here, we’re doing exactly the same thing: adding the name method to instances of the Person class. In this case, class_eval is setting the self to Person until the end of the block. This is all perfectly straight forward when dealing with classes, but it’s equally straight forward when dealing with metaclasses:

~~~ ruby
def Person.species
  "Homo Sapien"
end

Person.name #=> "Person"
~~~

As in the matz example earlier, we are defining the species method on
Person‘s metaclass. We have not manipulated self, but you can see using def
with an object attaches the method to the object’s metaclass.

~~~ ruby
class Person
  def self.species
    "Homo Sapien"
  end

  self.name #=> "Person"
end
~~~

Here, we have opened the Person class, setting the self to Person for the
duration of the block, as in the example above. However, we are defining a
method on Person‘s metaclass here, since we’re defining the method on an
object (self). Also, you can see that self.name while inside the person
class is identical to Person.name while outside it.

~~~ ruby
class << Person
  def species
    "Homo Sapien"
  end

  self.name #=> ""
end
~~~

Ruby provides a syntax for accessing an object’s metaclass directly. By
doing `class << Person`, we are setting self to Person‘s metaclass for the
duration of the block. As a result, the species method is added to Person‘s
metaclass, rather than the class itself.

~~~ ruby
class Person
  class << self
    def species
      "Homo Sapien"
    end

    self.name #=> ""
  end
end
~~~

Here, we combine several of the techniques. First, we open Person, making
self equal to the Person class. Next, we do `class << self`, making self
equal to Person‘s metaclass. When we then define the species method, it is
defined on Person‘s metaclass.

~~~ ruby
Person.instance_eval do
  def species
    "Homo Sapien"
  end

  self.name #=> "Person"
end
~~~

The last case, `instance_eval`, actually does something interesting. It
breaks apart the self into the self that is used to execute methods and the
self that is used when new methods are defined. When `instance_eval` is used,
new methods are defined on the metaclass, but the self is the object
itself.

In some of these cases, the multiple ways to achieve the same thing arise
naturally out of Ruby’s semantics. After this explanation, it should be
clear that `def Person.species, class << Person; def species, and class
Person; class << self; def species` aren’t three ways to achieve the same
thing by design, but that they arise out of Ruby’s flexibility with regard
to specifying what self is at any given point in your program.

On the other hand, `class_eval` is slightly different. Because it take a
block, rather than act as a keyword, it captures the local variables
surrounding it. This can provide powerful DSL capabilities, in addition to
controlling the self used in a code block. But other than that, they are
exactly identical to the other constructs used here.

Finally, `instance_eval` breaks apart the self into two parts, while also
giving you access to local variables defined outside of it.

In the following table, defines a new scope means that code inside the
block does not have access to local variables outside of the block.

    mechanism       method resolution       method definition       new scope?
    class Person    Person  same           yes #class << Person         Person’s
    metaclass      same    yes             #Person.class_eval       Person  same    no
    Person.instance_eval    Person  Person’s metaclass

mechanism 	     method resolution 	method definition 	new scope?
class Person 	     Person 	        same 	                yes
`class << Person`    Person’s metaclass same 	                yes
Person.class_eval    Person 	        same 	                no
Person.instance_eval Person 	        Person’s metaclass 	no

========================================================

This example of instance_eval is similar, but evaluates the code in the
context of an instance instead of a class. This is confusing at first,
because in these examples class_eval creates instance methods and
instance_eval creates class methods. There is reason behind the madness,
however.

class_eval is a method of the Module class, meaning that the receiver will
be a module or a class. The block you pass to class_eval is evaluated in
the context of that class. Defining a method with the standard def keyword
within a class defines an instance method, and that's exactly what happens
here.

instance_eval, on the other hand, is a method of the Object class, meaning
that the receiver will be an object. The block you pass to instance_eval is
evaluated in the context of that object. That means that
Person.instance_eval is evaluated in the context of the Person object.
Remember that a class name is simply a constant which points to an instance
of the class Class. Because of this fact, defining a method in the context
of Class instance referenced by Person creates a class method for Person
class.

#}}}1
# why's metaprogramming helpers {{{1
http://ruby-metaprogramming.rubylearning.com/html/seeingMetaclassesClearly.html

metaid
------
a few simple metaclass helpers

http://github.com/dannytatom/metaid

~~~ ruby
class Object
  # The hidden singleton lurks behind everyone
  def metaclass; class << self; self; end; end
  def meta_eval &blk; metaclass.instance_eval &blk; end

  # Adds methods to a metaclass
  def meta_def name, &blk
    meta_eval { define_method name, &blk }
  end
end

class Module
  # Defines an instance method within a module
  def module_def name, &blk
    module_eval { define_method name, &blk }
  end
end

class Class
  alias class_def module_def
end
~~~

Note: in ruby1.9, one can use singleton_class for metaclass, and
define_singleton_method for meta_def
(l'avantage d'utiliser define_singleton_method plutôt que
"ploum".instance_evel ... def ... c'est que def ne crée pas de closure,
mais que le block associé à define_singleton_method si)

*Important Remarks*

* If A is a class, then in A.instance_eval
- def ploum will add ploum in klass which is A metaclass, so this give a class method
- however define_method ploum is called on self which is A, so will add ploum as an instance method. That's why meta_def above add methods to the metaclass and not to the metaclass' metaclass

* Class variables are resolved based on self and not on klass.

* In class Ploum @ploum end, @ploum is a class instance variable (that is
  an instance variable of Ploum's metaclass). So this is a variable that is
  private to class Ploum, in particular instance method of ploum can't
  access to @ploum. For an application, see the variable @traits in class
  Creature below.

* If class A has for super class B (ie class A < B)
then the metaclass A.metaclass of class A has for superclass B.metaclass
So one can do:
~~~ ruby
class MailTruck
  def self.company( name )
    meta_def :company do; name; end
  end
end

class HappyTruck < MailTruck
  company "Happy's -- We Bring the Mail, and That's It!"
end
~~~

So with these remark we can write:
http://mislav.uniqpath.com/poignant-guide/dwemthy/
~~~ ruby
class Creature
  def self.traits( *arr )
    return @traits if arr.empty?
    attr_accessor *arr
    # Add a new class method for each trait.
    arr.each do |trait|
      meta_def trait do |val|
        @traits ||= {}
        @traits[trait] = val
      end
    end
    # For each monster, the `initialize' method
    # should use the default number for each trait.
    class_def :initialize do
      self.class.traits.each do |k,v|
        instance_variable_set( "@#{k}", v )
      end
    end
  end

  #### Application ####
  # Creature attributes are read-only
  traits :life, :strength, :charisma, :weapon

  # This method applies a hit taken during a fight.
  def hit( damage )
    p_up = rand( charisma )
    if p_up % 9 == 7
      @life += p_up / 4
      puts "[#{ self.class } magick powers up #{ p_up }!]"
    end
    @life -= damage
    puts "[#{ self.class } has died.]" if @life <= 0
  end

  # This method takes one turn in a fight.
  def fight( enemy, weapon )
    if life <= 0
      puts "[#{ self.class } is too dead to fight!]"
      return
    end

    # Attack the opponent
    your_hit = rand( strength + weapon )
    puts "[You hit with #{ your_hit } points of damage!]"
    enemy.hit( your_hit )

    # Retaliation
    p enemy
    if enemy.life > 0
      enemy_hit = rand( enemy.strength + enemy.weapon )
      puts "[Your enemy hit with #{ enemy_hit } points of damage!]"
      self.hit( enemy_hit )
    end
  end
end

class DwemthysArray < Array
  alias _inspect inspect
  def inspect; "#<#{ self.class }#{ _inspect }>"; end
  def method_missing( meth, *args )
    answer = first.send( meth, *args )
    if first.life <= 0
      shift
      if empty?
        puts "[Whoa.  You decimated Dwemthy's Array!]"
      else
        puts "[Get ready. #{ first.class } has emerged.]"
      end
    end
    answer || 0
  end
end

class Rabbit < Creature
  traits :bombs
  life 10
  strength 2
  charisma 44
  weapon 4
  bombs 3

  # little boomerang
  def ^( enemy )
    fight( enemy, 13 )
  end
  # the hero's sword is unlimited!!
  def /( enemy )
    fight( enemy, rand( 4 + ( ( enemy.life % 10 ) ** 2 ) ) )
  end
  # lettuce will build your strength and extra ruffage
  # will fly in the face of your opponent!!
  def %( enemy )
    lettuce = rand( charisma )
    puts "[Healthy lettuce gives you #{ lettuce } life points!!]"
    @life += lettuce
    fight( enemy, 0 )
  end
  # bombs, but you only have three!!
  def *( enemy )
    if @bombs.zero?
      puts "[UHN!! You're out of bombs!!]"
      return
    end
    @bombs -= 1
    fight( enemy, 86 )
  end
end

class ScubaArgentine < Creature
  life 46
  strength 35
  charisma 91
  weapon 2
end
r = Rabbit.new
s = ScubaArgentine.new
r ^ s

class Dragon < Creature
  life 1340     # tough scales
  strength 451  # bristling veins
  charisma 1020 # toothy smile
  weapon 939    # fire breath
end
dwarr = DwemthysArray[ScubaArgentine.new,
                      Dragon.new]
r*dwarr
~~~

#}}}1
# From ruby-doc {{{1
instance_eval(string [, filename [, lineno]] ) => obj
instance_eval {| | block } => obj

Evaluates a string containing Ruby source code, or the given block, within the context of the receiver (obj). In order to set the context, the variable self is set to obj while the code is executing, giving the code access to obj’s instance variables. In the version of instance_eval that takes a String, the optional second and third parameters supply a filename and starting line number that are used when reporting compilation errors.

~~~ ruby
class Klass
  def initialize
    @secret = 99
  end
end
k = Klass.new
k.instance_eval { @secret }   #=> 99
~~~


 method(sym)

Looks up the named method as a receiver in obj, returning a Method object (or raising NameError). The Method object acts as a closure in obj’s object instance, so instance variables and the value of self remain available.

 send(symbol [, args...]) => obj click to toggle source
__send__(symbol [, args...]) => obj

Invokes the method identified by symbol, passing it any arguments specified. You can use __send__ if the name send clashes with an existing method in obj.
#}}}1

include vs require {{{1
==================

What's the difference between "include" and "require" in Ruby?

The include and require methods do very different things.

The require method does what include does in most other programming
languages: run another file. It also tracks what you've required in the
past and won't require the same file twice. To run another file without
this added functionality, you can use the load method. (en pratique: load a
l'air de chercher dans le cwd mais pas require, qui doit chercher dans le
ruby_path)

The include method takes all the methods from another module and includes
them into the current module. This is a language-level thing as opposed to
a file-level thing as with require. The include method is the primary way
to "extend" classes with other modules (usually referred to as mix-ins).
For example, if your class defines the method "each", you can include the
mixin module Enumerable and it can act as a collection. This can be
confusing as the include verb is used very differently in other languages.
#}}}1
extend vs include {{{1
=================

http://stackoverflow.com/questions/156362/what-is-the-difference-between-include-and-extend-in-ruby

* extend - adds the specified module's methods and constants to the
  target's metaclass (e.g. the singleton class) e.g:
- if you call Klazz.extend(Mod), now Klazz has Mod's methods (as class methods)
- if you call obj.extend(Mod), now obj has Mod's methods (as instance
  methods), but no other instance of of obj.class has those methods.
  (extend is a public method)

* include - By default, it mixes in the specified module's methods as
  instance methods in the target module/class. e.g:
- if you call class Klazz; include Mod; end;, now all instances of Klazz
  have access to Mod's methods (as instance methods)
- include is a private method, because it's intended to be called from
  within the container class/module.

* However, modules very often override include's behavior by
  monkey-patching the included method. This is very prominent in legacy
  Rails code.

  More details from Yehuda Katz
  (http://yehudakatz.com/2009/11/12/better-ruby-idioms/)

  Further details about include, with its default behavior, assuming you've
  run the following code

  ~~~ ruby
  class Klazz
    include Mod
  end
  ~~~

  - If Mod is already included in Klazz, or one of its ancestors, the include
    statement has no effect
  - It also includes Mod's constants in Klazz, as long as they don't clash
  - It gives Klazz access to Mod's module variables, e.g. @@foo or @@bar
  - raises ArgumentError if there are cyclic includes
  - Attaches the module as the caller's immediate ancestor (this is a little
    esoteric, IMO. See the RubySpec for details. It adds Mod to
    Klazz.ancestors, but Mod is not added to the chain of
    Klazz.superclass.superclass.superclass).

Doing include *and* extend:
=========================
http://railstips.org/blog/archives/2009/05/15/include-vs-extend-in-ruby/

~~~ ruby
module Foo
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def bar
      puts 'class method'
    end
  end

  def foo
    puts 'instance method'
  end
end

class Baz
  include Foo
end

Baz.bar # class method
Baz.new.foo # instance method
Baz.foo # NoMethodError: undefined method ‘foo’ for Baz:Class
Baz.new.bar # NoMethodError: undefined method ‘bar’ for #<Baz:0x1e3d4>
~~~

We can even abstract this concept

~~~ ruby
class Module
  def extends_host_with(class_methods)
    @_extension_module = class_methods
    def self.included(base)
    #attention: le code que j'ai trouvé faisait def included
    #mais ça ne va pas car klass est Module, donc ça ajoute le code à
    #Module et pas le module actuel dans self
      base.extend(const_get(@_extension_module))
    end
  end
end

# Example
module MyMod
  extends_host_with :ClassMethods

  def an_instance_method; end

  module ClassMethods
    def a_class_method; end
  end
end
#including MyMod will add an_instance_method as an instance method and a_class_method as a class method!
~~~

Ou pour jouer à la fois avec extend et include:
~~~ ruby
class Module
  def includes_extends_host_with(instance_methods, class_methods)
    @_include_module = instance_methods
    @_extension_module = class_methods
    puts @_include_module, @_extension_module
    def self.included(base)
      print "Self is #{self}\n"
      print "@_extension_module is #{@_extension_module}\n"
      print "@_include_module is #{@_include_module}\n"
      base.send(:include, const_get(@_include_module))
      #we use send here because :include is private in Module
      base.extend(const_get(@_extension_module))
    end
    #alias self.extended self.included does not work
    def self.extended(*args)
      included(*args)
    end
  end
end
# Example
module MyMod
  includes_extends_host_with :InstanceMethods, :ClassMethods
  def a_method; end
  module ClassMethods
    def a_class_method; end
  end
  module InstanceMethods
    def an_instance_method; end
  end
end
class A; include MyMod; end
class B; extend MyMod; end
#including or extending MyMod will add an_instance_method as an instance method and a_class_method as a class method. a_method will be an instance method with include, but a class method with extend!
~~~
}}}1

# Constants {{{1

~~~ ruby
puts "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"

X = '::X'

class Foo
  X = 'Foo::X'

  def foo
    puts "instance method: #{X}"
  end
end

Foo.new.foo

f = Foo.new
def f.bar
  puts "singleton method: #{X}"
end
f.bar

Foo.class_eval do
  puts "class_eval: #{X}"
end

Foo.new.instance_eval do
  puts "instance_eval: #{X}"
end

# load "constant"
# 1.9.3-p194
# instance method: Foo::X
# singleton method: ::X
# class_eval: ::X
# instance_eval: ::X
#
# D'après
# http://jfire.io/blog/2011/01/21/making-sense-of-constant-lookup-in-ruby/
# ça change tout le temps entre 1.8,1.9.1,1.9.2,1.9.3...
# Dans 1.9.3, la règle pour les cref et la suivante: on regarde d'abord
# lexicographiquement (dans des scopes de plus en plus grand), *puis* si
# rien n'est trouvé dans la hiérarchie des parents du module où on est.

Ex:
class First
  X="First::X"
end
  => "First::X"
class Second < First
  puts X
  def ploum
    puts X
  end
  def self.plim
    puts X
  end
end
  First::X => nil
Second.plim
  First::X => nil
Second.new.ploum
  First::X => nil


#Example of the difference of scope with Class.new do end
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
~~~

Another example:
~~~ ruby
CONST = "outer"
module A
  CONST = "inner"
end
# This is A::CONST
module A
  class B
    def B.get_const
      CONST
    end
  end
end
A::B.get_const # => "inner"
class A::C
  def (A::C).get_const
    CONST
  end
end
A::C.get_const # => "outer"
~~~

####################################################################
http://stackoverflow.com/questions/2687276/scope-of-constants-in-ruby-modules
#nice examples of metaprogramming too

#très bien expliqué ici:
http://cirw.in/blog/constant-lookup
}}}1

# Functions {{{1
Module
------
Module Instance methods:
ancestors, class_eval(=module_eval), {class,module}_exec (comme class_eval
mais prend seulement un block alors que class_eval peut prendre un string)
class_variable_{defined?,get,set}(symbol), class_variables, remove_class_variable
const_{defined?,get,missing,set}, constants, remove_const
include?, included_modules
extended, included
{private,protected,public,}_{class,instance}_method{,s,_defined?}(symbol),

Module private instance method:
alias_method, attr_accessor, extend_object (callback called by Object#extend)
define_method, {remove,undef}_method module_function (copy a
module function into an instance method of its singleton class)
extended,included,include,method_{added,removed,undefined},
private,public,protected

Class methods: constants, nesting

Class private instance methods: inherited

BasicObject public instance methods: instance_{eval,exec}, object_id, send,
__send__

BasicObject private instance methods: method_missing,
singleton_method_{added,removed,undefined}

Object public instance method: define_singleton_method, extend,
instance_variable{_defined?, _get, _set, s}, {public_,}method, public_send, send, respond_to?, respond_to_missing (called by respond_to? when the method is missing)
singleton_class, singleton_methods,

Object private instance method: remove_instance_variable

Kernel public instance methods: global_variables, local_variables, method

# More links {{{1
- Invoking private methods with send:
http://khelll.com/blog/ruby/ruby-dynamic-method-calling/

- The 3 contexts in ruby (self, klass, cref): this is by far the best tutorial
http://yugui.jp/articles/846

- Une implémentation des classes/modules de ruby en ruby:
https://gist.github.com/4009812
(cloné dans ClassModules)

- https://www.ruby-forum.com/topic/571597#966293
Ploum.singleton_class.superclass == Ploum.superclass.singleton_class
+ more details on virtual and proxy classes
On top there is also the following code for the "double include problem":
~~~ ruby
  class Module
    alias :old_include :include
    def include other
      old_include other
      if self.class == Module
        this = self
        ObjectSpace.each_object Module do |mod|
          mod.module_eval do include this end if mod < self
        end
      end
    end
  end
  module Z
    def x; "x"; end
  end
  #whith the new include, this forces Array to include Z too
  #otherwise it does not work because Z is not in the proxy classes of Array, since Array mix in Enumerable before Enumerable includes Z.
  module Enumerable
    include Z
  end
  a = [1,2,3,4,5]
  p a.x  # => "x"
~~~

- http://www.hokstad.com/ruby-object-model
Notes on the implementation of ruby object model in MRI

- https://www.ruby-forum.com/topic/41349
class Foo < Class does not work, but a solution is to use 'super' in the
eigen class of Foo

- http://blog.rubybestpractices.com/posts/gregory/anonymous_class_hacks.html
  How to parameterize subclasses
}}}1

# All the ways to define a function {{{1

## Object Singleton Methods
http://stackoverflow.com/questions/6759777/ruby-singleton-methods-for-class-and-objects

To get the singleton_methods list of object, along with it's ancestors, use 'obj.singleton_methods' or to only get the singleton_methods  defined in object use
'obj.singleton_methods(false)'

~~~ruby
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

Note on define method:
it accepts a block (Proc), a method or an unbound method. In the latter two
cases the module need to be a submodule of the method.owner. To get around
that one can do
    define_method(:name,&m) for a bound method
and for an unbound method, (when it comes from a module or can be bound
because we respect the ancestor chain)
    define_method name do |*args,&block|
      method.bind(self).call(*args,&block)
    end
(note that the block passed is evaluated using instance_eval, so self is the object calling, not the current module)
The difference between the two is that in the first case the method m is
still bound to the original object, while in the second case we update self
to the current object call

# }}}1
# Fun with metaprogramming {{{1
## Subclassing Module {{{2

http://solnic.eu/2012/08/13/subclassing-module-for-fun-and-profit.html
is interesting, but the approach here and in the links
https://github.com/cameron-martin/rattributes/blob/master/lib/rattributes.rb
https://gist.github.com/renato-zannon/3616434
is more complicated than necessary.

I regroup everything in this snippet:
~~~ ruby
#https://gist.github.com/renato-zannon/3616434
class AttributeAccessor < Module
  def initialize(name)
    @name = name
    #module_eval { define_accessors } 
    #module_eval here is a noop: self is not changed, and klass is set to self (rather than AttributeAccessor but is not used below since we don't use `def`. It would make sense to use meta_eval if we used def to define the methods for the created module (self) rather than for AttributeAccessor
    #Here it suffices to do:
    define_accessors
  end

private

  def define_accessors
    ivar = "@#{@name}"
    define_writer(ivar)
    define_reader(ivar)
  end

  def define_writer(ivar)
    define_method("#{@name}=") do |value|
      instance_variable_set("#{ivar}", value)
    end
  end

  def define_reader(ivar)
    define_method(@name) do
      instance_variable_get("#{ivar}")
    end
  end
end

class Book
  include AttributeAccessor.new(:title)

  def title
    "#{super} + super works!"
  end
end
book = Book.new
book.title = "Module Subclassing Guide"
puts book.title #=>Module Subclassing Guide + super works!

module SingletonBook
  extend AttributeAccessor.new(:title)

  def self.title
    "#{super} + super works on singletons!"
  end
end
SingletonBook.title = "Singleton Module Subclassing Guide"
puts SingletonBook.title #=>Singleton Module Subclassing Guide + super works on singletons!

#https://github.com/cameron-martin/rattributes/blob/master/lib/rattributes.rb
class Rattributes < Module
  VERSION = '0.0.3'
  def initialize(*attributes)
    @attributes = attributes
    #super here will call module_eval on the block, so this is a noop too,
    #see the comment on module_eval above
    #super() do 
      attr_reader *attributes
      define_method :initialize do |data|
        attributes.each do |attribute|
          instance_variable_set("@#{attribute}", data[attribute])
        end
      end
    #end
    #note it could have made sense do use super {...} if we had used
    #def initialize rather than define_method initialize so that klass is
    #properly set, but I don't see a way we could pass attributes to the
    #def since it would open a new binding
  end
  def inspect
    "#{self.class.to_s}(#{@attributes.map(&:inspect).join(', ')})"
  end
  alias_method :to_s, :inspect
end
class Book2
  include Rattributes.new(:title)
  def title
    "#{super} + super works!"
  end
end
book2 = Book2.new(title: "a title")
puts book2.title #=>a title + super works!
puts Rattributes.new(:ploum)#=>Rattributes(:ploum)
~~~

There is a gem on these principles here: https://github.com/AlexParamonov/inheritance_module_eval
  Allows to create methods with same name inside particular class/object by
  pushing them down by inheritance tree. So method "field" may call other
  "field" in same class by calling super keyword instead of just redefine it.
this gem basically contains this code:
~~~ ruby
#dynamically creates a module with functions defined via `module_eval` and
#including or extending it afterwards
module InheritanceModuleEval
  def self.instance_eval_on(sender, code = nil, &block)
    sender.send :include, (get_module_for code, &block)
  end

  def self.class_eval_on(sender, code = nil, &block)
    sender.send :extend, (get_module_for code, &block)
  end

  private
  def self.get_module_for(code, &block)
    raise ArgumentError, "Empty code given" if (code.nil? or code.empty?) and not block_given?
    include_module = Module.new
    if code.nil? then include_module.module_eval &block else include_module.module_eval code end

    include_module
  end
end

class Module
  # acts same as module_eval, but saves method hierarchy
  # should be called only for instance methods evaluation
  # @params (see Module#module_eval)
  def instance_module_eval(code = nil, &block)
    InheritanceModuleEval.instance_eval_on self, code, &block
  end

  # acts same as module_eval, but saves method hierarchy
  # should be called only for class methods evaluation
  # @params (see Module#module_eval)
  def class_module_eval(code = nil, &block)
    InheritanceModuleEval.class_eval_on self, code, &block
  end
end
~~~

## Using to_proc {{{2

- https://github.com/rapportive-oss/ampex
  The Ampex (&X) library provides a Metavariable X that can be used in
  conjunction with the unary ampersand to create anonymous blocks in a
  slightly more readable way than the default. It was inspired by the clever
  Symbol#to_proc method which handles the most common case very elegantly,
  and discussion with Sam Stokes about creating lazy enumerators in ruby.

~~~ ruby
class Metavariable < BasicObject
  # When you pass an argument with & in ruby, you're actually calling #to_proc
  # on the object. So it's Symbol#to_proc that makes the &:to_s trick work,
  # and Metavariable#to_proc that makes &X work.
  attr_reader :to_proc

  def initialize(&block)
    @to_proc = block || ::Proc.new{|x| x}
  end

  # This method is here so that a metavariable can be used as a target for "when" like this:
  #
  #   case foo
  #   when X.respond_to? :bar
  #     "Responds to :bar"
  #   when X.respond_to? :foobar
  #     "Responds to :foobar"
  #   end
  #
  def ===(y)
    !!to_proc.call(y)
  end

  # Each time a method is called on a Metavariable, we want to create a new
  # Metavariable that is like the last but does something more.
  #
  # The end result of calling X.one.two will be like:
  #
  # lambda{|x|
  #   (lambda{|x|
  #     (lambda{|x| x}).call(x).one
  #   }).call(x).two
  # }
  #
  def method_missing(name, *args, &block)
    raise ::NotImplementedError, "(&X = 'foo') is unsupported in ampex > 2.0.0" if name.to_s =~ /[^!=<>]=$/
    ::Metavariable.new { |x| @to_proc.call(x).__send__(name, *args, &block) }
  end
end

X = Metavariable.new
~~~

#}}}1
