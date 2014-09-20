#!/usr/bin/env ruby
require 'micro-optparse'

options = Parser.new do |p|
   p.banner = "This is a fancy script, for usage see below"
   p.version = "fancy script 0.0 alpha"
   p.option :severity, "set severity", :default => 4, :value_in_set => [4,5,6,7,8]
   p.option :verbose, "enable verbose output"
   p.option :mutation, "set mutation", :default => "MightyMutation", :value_matches => /Mutation/
   p.option :plus_selection, "use plus-selection if set", :default => true
   p.option :selection, "selection used", :default => "BestSelection", :short => "l"
   p.option :chance, "set mutation chance", :default => 0.8, :value_satisfies => lambda {|x| x >= 0.0 && x <= 1.0}

  p.option :filenames, "Files which will be processed", :default => []
#--filenames ploum,plam will produce an array
  p.option :ploum_plam,  "ploum plam", :short => "P"
  p.option :Va, "test de V"
  p.option :sm, "test de sm"
  #--false_option set this to true
  p.option :false_option, "an option set to false by default", :default=>false
  #--true_option set this to true also!
  p.option :true_option, "an option set to true by default", :default=>true
end.process!

p options
