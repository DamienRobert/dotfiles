#!/usr/bin/ruby
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
