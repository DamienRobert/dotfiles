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
