#!/usr/bin/env ruby -w

## Defining singleton method via module_function
module Ploum
	module_function #furthermore makes all methods private
	def ploum
		puts "In Ploum.ploum"
	end
end

class Plam
	include Ploum
end

Ploum.ploum
plam=Plam.new
#plam.ploum #error since ploum is private
plam.send :ploum

## Defining singleton method via extend self
module Plim
	extend self
	def self.included(k); k.extend(self); end

	def plim
		puts "In Plim.plim"
	end
end

class Plum
	include Plim
end
Plim.plim
Plum.plim
plum=Plum.new
plum.plim

## Differences between instance and singleton methods
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

Ploum.ploum #ne peut être appelé que comme ça
Ploum.plum
Plam.plam
plim=Plim.new
plim.plam
plim.send :plum #car :plum est private
plim.callPlum
# Dans le top level,
# - include Ploum ajoute plum et plam à Object, ils pourront être appelés n'importe où
# - extend Ploum ajout plum et plam à la metaclass de self(=main), ils pourront être appelés dans le top level, mais pas quand self est différent

############################################################################
## include hook to call extend
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
		singleton_class.module_eval do #instance_eval would work here too since we don't use 'def'
			mod.singleton_methods.each do |m|
				define_method(m, mod.method(m).to_proc)
			end
		end
	end
end
#Another way to manipulate a method when it comes from a Module
#is to unbind the method, and then use bind to self:
# define_method(m) { mod.method(m).unbind.bind(self).call }
#This only works for a method from a Module where we can bind to an object
#of another class

module B
	#include methods in A.eigenclass into B.eigenclass
	include_module_methods A
end
#cf aussi: https://github.com/banister/include_complete
#qui a d'autres aspects meta rigolos (genre include une classe...)

#Note that this work because in A we extend a module
#if we do 'def A.ploum end', then we can't inherit A.ploum because
#extend A.singleton_class won't work this we can't include a class

############################################################################
## How to get a dynamic lookup in include (solve the double include problem):
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
p Enumerable.ancestors		# Notice that Narf *is* there
p Fjord.ancestors					# Notice that Narf *is* here too
p Array.ancestors					# But, grr, not here
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
