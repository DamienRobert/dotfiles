class Ploum
  attr_accessor :foo
  
  def initialize
    foo=true
  end

  def module
    puts "top, self is: #{self}"
    old=self
    Module.new do |m|
      puts "in module, self is: #{self}, old is #{old}, m is #{m}"
      define_method :amethod do
        puts "amethod, self is: #{self}, old is #{old}"
      end
    end
  end
end

ploum=Ploum.new
m=ploum.module
include m
amethod

# top, self is: #<Ploum:0x85ae4e0>
# in module, self is: #<Module:0x85ae468>, old is #<Ploum:0x85ae4e0>, m is #<Module:0x85ae468>
# amethod, self is: main, old is #<Ploum:0x85ae4e0>
