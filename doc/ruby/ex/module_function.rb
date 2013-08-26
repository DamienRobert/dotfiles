#!/usr/bin/env ruby -w

## Usage of include and extend
module Ploum
  module_function
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
