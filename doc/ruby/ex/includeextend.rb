#!/usr/bin/env ruby

## Usage of include and extend
module Ploum
  def self.ploum
    puts "In Ploum.ploum"
  end
  def plam
    puts "In Ploum#plam"
  end
  def plum
    puts "In Ploum#plum"
  end
  module_function :plum #makes Ploum#plum private
end

class Plam
  extend Ploum
end

class Plim
  include Ploum
  def callPlum
    #Ploum#plum est private, donc il faut l'appeler depuis le self (ou le
    #rendre public)
    plum
  end
end

plim=Plim.new

# => on peut faire Plam.plam
# ou alors plim=Plim.new; plim.plam.
# mais ploum ne peut être appelé que par Ploum.ploum
# Pour utiliser plum: Ploum.plum, ou plim.callPlum

# Dans le top level,
# include Ploum ajoute plum et plam à Object, ils pourront être appelés
# n'importe où
# extend Ploum ajout plum et plam à la metaclass de self(=main), ils
# pourront être appelés dans le top level, mais pas quand self est
# différent


## How to 'include' ClassMethods:
#http://stackoverflow.com/questions/4662722/extending-a-ruby-module-in-another-module-including-the-module-methods
module A 
  module ClassMethods
    def say_hi
      puts "hi"
    end
  end
  extend ClassMethods
  def self.included( other )
    other.extend( ClassMethods )
  end
end

module B 
  include A
end

A.say_hi #=> "hi"
B.say_hi #=> "hi" 

# La version metaprogramming
class Module
  def include_module_methods(mod)
    mod.singleton_methods.each do |m|
      (class << self; self; end).send :define_method, m, mod.method(m).to_proc
    end
  end
end

module B
  #include methods in A.eigenclass into B.eigenclass
  include_module_methods A
end
#cf aussi: https://github.com/banister/include_complete
#qui a d'autres aspects meta rigolos (genre include une classe...)

module C
  def self.ploum
    puts "ploum"
  end
end
C.ploum
#module D
#  extend(C.singleton_class)
#end
#D.ploum
#ceci ne marche pas. extend(...) est l'équivalent de 
#class << self; include(...); end, mais on ne peut pas includer la
#singleton_class qui est une classe, pas un module...

## How to get a dynamic lookup in include:
#http://stackoverflow.com/questions/1655623/ruby-class-c-includes-module-m-including-module-n-in-m-does-not-affect-c-what
module Narf
  def narf?
    puts "(from #{self.class}) ZORT!"
  end
end
module Enumerable
  include Narf
end
class Fjord # Fjord is an Enumerable defined *after* including Narf in Enumerable
  include Enumerable
end
p Enumerable.ancestors    # Notice that Narf *is* there
p Fjord.ancestors         # Notice that Narf *is* here too
p Array.ancestors         # But, grr, not here
# => [Enumerable, Narf]
# => [Fjord, Enumerable, Narf, Object, Kernel]
# => [Array, Enumerable, Object, Kernel]
# include mixes the module hierarchy as is, to get the new module in Enumerable
#one has to do:
class Array
  include Enumerable
end
p Array.ancestors
# => [Array, Enumerable, Narf, Object, Kernel]

# Imbue provices the magic we need
class Module
  def imbue m
    include m
    # now that self includes m, find classes that previously
    # included self and include it again, so as to cause them
    # to also include m
    ObjectSpace.each_object(Class) do |k|
      k.send :include, self if k.include? self
    end
  end
end
# imbue will force Narf down on every existing Enumerable
module Enumerable
  imbue Narf
end
