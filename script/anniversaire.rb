#!/usr/bin/env ruby
require 'yaml'

class Person
  attr_accessor :name, :bday
  def initialize(name,bday)
    @name=name
    if bday.class == Date then
      @bday=bday
    else
      @bday = Date.parse(bday)
    end
  end
  def birthday?(today)
    (today.month == @bday.month && today.day == @bday.day)
  end
  def age(today)
    today.year - @bday.year
  end
  def to_s
    @name+" (Born the #{@bday})"
  end
end

filename="anniversaire.yaml"
data=YAML.load_file(filename)
persons=[]
data.each do |name,bday|
  persons = persons  << Person.new(name,bday)
end
p persons

ARGV.each do |today|
  today = Date.parse(today)
  personsbday = persons.select {|p| p.birthday?(today)}
  puts "On #{today}, the birthdays are", personsbday if personsbday
end
