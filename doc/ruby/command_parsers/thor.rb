#!/usr/bin/env ruby
require "thor"
require "thor/group"

class MyCLI < Thor
  default_task :hello
  class_option :verbose, :type => :boolean
  desc "hello NAME", "say hello to NAME"
  long_desc <<-LONGDESC
    `cli hello` will print out a message to a person of your
    choosing.
 
    You can optionally specify a second parameter, which will print
    out a from message as well.
 
    > $ cli hello "Yehuda Katz" "Carl Lerche"
    \x5> from: Carl Lerche 
  LONGDESC
  #\x5 to force a line break
  
#note: ./thor.rb --version hello ploum
#./thor.rb hello --version ploum
#./thor.rb hello ploum --version
#all this work
  def hello(name="Damien", from=nil)
    puts options
    puts "from: #{from}" if from
    puts "Hello #{name}"
  end

  desc "hello2 NAME", "say hello to NAME"
  option :from, banner: "from who?", aliases: ["-f", "--who"]
  #note aliases have to be prefixed by -- except for one letter that can
  #use -, so -who and f will not work
  option :yell, :type => :boolean
  #or   options :from => :required, :yell => :boolean
  def hello2(name)
    output = []
    output << "from: #{options[:from]}" if options[:from]
    output << "Hello #{name}"
    output = output.join("\n")
    puts options[:yell] ? output.upcase : output
  end

#    :desc: A description for the option. When printing out full usage for a command using cli help hello, this description will appear next to the option.
#    :banner: The short description of the option, printed out in the usage description. By default, this is the upcase version of the flag (from=FROM).
#    :required: Indicates that an option is required
#    :default: The default value of this option if it is not provided. An option cannot be both :required and have a :default.
#    :lazy_default — A default that is only passed if the cli option is
#    passed without a value.
#    :type: :string, :hash, :array, :numeric, or :boolean
#    :aliases: A list of aliases for this option. Typically, you would use aliases to provide short versions of the option.

 desc "a task", "a task with a splat"
 def a_task(*args)
   p args
 end

 map 'task' => 'a_task' #map 'task' to 'a_task'

 no_tasks{ #methods here are not added to the list of task
   def ahah(n)
     return n+1
  end
 }

 desc "testing options", "lalal"
 option :ploum, aliases: "-p"
 #to specify several options, one can use options=method_options
 method_options [:plum, "--pl"] => 1.0, :plim => :numeric #we have aliases and a default value, and :plim is a string
 option :ahash, type: :hash
 option :anarray, type: :array
 option :abool, type: :boolean #=> --no-abool
 def test1
   p options
 end
 desc "more testing options", "lulul"
 option :anarray, type: :array
 #avec --anarray il faut faire -- pour séparer les options des args
 def test2(*args)
   p options, args
 end
end

MyCLI.start(ARGV)
