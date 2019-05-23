#!/usr/bin/ruby

require 'pry'

class A
  def hello() puts "hello world!" end
end

a = A.new

def ploum()
  x=37
  y=plam(x)
  return x+y
end

def plam(x)
  z=x+x
  puts "z is #{z}"
  # start a REPL session
  binding.pry
  puts "next: z is #{z}"
  return z
end

#binding.pry
puts ploum

# program resumes here (after pry session)
puts "program resumes here."

################################### pry-rescue ###############
require 'pry-rescue'

def alpha
  name = "john"
  beta
  puts name
end

def beta
  x = "john"
  gamma(x)
end

def gamma(x)
  raise ArgumentError, "x must be a number!" if !x.is_a?(Numeric)
  puts "2 * x = #{2 * x}"
end

Pry.rescue do
  alpha
end

#one can also do
#EE.intercept(ArgumentError)
#to intercept all ArgumentError exceptions
#but one need to call EE.inline! for that to work:
#EE.intercept(ArgumentError)
#EE.inline!
#alpha
