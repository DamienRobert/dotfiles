#!/usr/bin/env ruby

require 'methadone'

include Methadone::Main
include Methadone::CLILogging


main do |thing,other_thing,optional_thing|
#main do |*args|
  # logic
  puts "thing: #{thing}, other_thing: #{other_thing}, optional_thing: #{optional_thing}"
  #puts "args: #{args}"
  p options
end
options[:username]="Damien Robert"
options[:idea]="ahah"

on("-u USER","--username","The user name")
on("-v","--verbose","Be verbose")
on("--no-idea")

description "Does so many awesome things, you won't believe it."

arg :thing
arg :other_thing, :any
arg :optional_thing, :optional

go!
