#!/usr/bin/env ruby
require 'yaml'
require 'ap'
require 'pp'
#require 'pry'

ARGV.each do |filename|
  puts "-- #{filename} --"
  File.open(filename) do |file|
    streams=YAML.load_documents(file);
    #binding.pry
    streams.map {|stream| ap stream; puts "---"}
  end
  #puts data
  #pp data
  #ap data
end
