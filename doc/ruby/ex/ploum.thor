class Counter < Thor::Group
  # number will be available as attr_accessor
  argument :number, :type => :numeric, :desc => "The number to start counting"
  desc "Prints the 'number' given upto 'number+2'"

  def one
    puts number + 0
  end

  def two
    puts number + 1
  end

  def three
    puts number + 2
  end
end
#thor counter 15

module Ahah
class Invocation < Thor
  #inside module Ahah the standard invocation would be
  #thor ahah:one
  #but here we change the namespace
  #so it is thor UhUh:two
  namespace :UhUh
  desc "one", "Prints 1 2 3"
  def one
    puts 1
    invoke :two
    invoke :three
  end

  desc "two", "Prints 2 3"
  def two
    puts 2
    invoke :three
  end

  desc "three", "Prints 3"
  def three
    puts 3
  end
end
end
#:three will only get called once
#thor UhUh:invocation:one
