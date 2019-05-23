#!/usr/bin/env ruby
require 'boson/runner'

class CowRunner < Boson::Runner
  option :urgent, type: :boolean
  def say(text, options={})
    text.capitalize! if options[:urgent]
    puts text
  end

  def moo
    puts "MOOOO"
  end
end

CowRunner.start
