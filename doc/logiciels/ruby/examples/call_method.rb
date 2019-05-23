#!/usr/bin/env ruby

var=0
def a(first, *second)
  var=10
  puts "first: #{first}"
  puts "second: #{second}"
  r=yield if block_given?
  puts "block: #{r}"
end

a(50) do
  var + 20 #this is the var=0 here that is used
end

a(15,20,30, ploum: 1, plam: 2)
a(15)
a(15, ploum: 50)
#a(ploum: 50, 15) => syntax error
puts "------------"

def b(opts={})
  puts "opts: #{opts}"
end
b
b(15)
b(ploum: 1, plam: 2)
#b(15, ploum:1) => error
