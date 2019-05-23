#!/usr/bin/env ruby
#generated by 'gli init todo list add complete'

require 'gli'
include GLI::App

## Doc: https://github.com/davetron5000/gli/wiki/Reference
#       https://github.com/davetron5000/gli/wiki/Declaring-flags-and-switches
#       https://github.com/davetron5000/gli/wiki/Controlling-help-output
#       https://github.com/davetron5000/gli/wiki/Subcommands
#       https://github.com/davetron5000/gli/wiki/Config
#       https://github.com/davetron5000/gli/wiki/Error-Handling [GLI_DEBUG=true to get backtraces]
#       https://github.com/davetron5000/gli/wiki/Hooks
#       https://github.com/davetron5000/gli/wiki/Controlling-help-output

## GLI::App => Available in the main app
#  accept                 hide_commands_without_desc  skips_post
#  arguments              on_error                    skips_pre
#  around                 post                        sort_help
#  autocomplete_commands  pre                         subcommand_option_handling
#  commands_from          preserve_argv               synopsis_format
#  config_file            program_desc                use_openstruct
#  default_command        program_long_desc           version
#  exit_now!              program_name                wrap_help_text
#  help_now!              skips_around

## GLI::DSL => Available in the main app and commands
#  arg          d              flags_declaration_order
#  arg_name     default_value  long_desc
#  c [=command] desc           s [=switch]
#  clear_nexts  f [=flag]      switch
#  command      flag           switches_declaration_order

## GLI::Command < GLI::CommandLineToken
#  action  default_command  default_desc  example  has_option?  name_for_help

## GLI::CommandLineOption < GLI::CommandLineToken
#  associated_command  associated_command=  default_value  default_value=

## GLI::CommandLineToken
#  aliases  description  long_description  name  names_and_aliases

# - help as a '-c' argument for shell completion: ./gli.rb help -c 'mul' =>
#   multi
# - there is a hidden command '_do' => ./gli.rb help _doc
# - If we put 'config_file '.yourapp.rc'' this adds a command 'initconfig'
#   that will generate ~/.yourapp.rc

program_desc 'Describe your application here'
version "0.0.1"

subcommand_option_handling :normal #legacy par défaut
arguments :strict #loose par défaut
#strict => arguments are validated according to their specification
#but see below we change it back to :loose for our tests

desc 'Describe some switch here'
switch [:s,:switch]

desc 'Describe some flag here'
default_value 'the default'
arg_name 'The name of the argument'
flag [:f,:flagname]

desc 'Describe list here'
arg_name 'Describe arguments to list here'
command :list do |c|
	c.desc 'Describe a switch to list'
	c.switch :s

	c.desc 'Describe a flag to list'
	c.default_value 'default'
	c.flag :f
	c.action do |global_options,options,args|

		# Your command logic here

		# If you have any errors, just raise them
		# raise "that command made no sense"

		puts "list command ran"
	end
end

desc 'Describe add here'
arg :foo, :multiple
arg :bar, :optional
command :add do |c|

	c.desc 'Describe some flag here'
	c.default_value 'the default'
	c.arg_name 'The name of the argument'
	c.flag [:g,:otherflag]

	c.action do |global_options,options,args|
		puts "add command ran"
	end
end
#since we are in :strict mode, '$0 add' will give an error:
#error: Not enough arguments for command

desc 'Describe complete here'
arg_name 'Describe arguments to complete here'
command :complete do |c|
	c.action do |global_options,options,args|
		#puts "complete command ran"
		raise "Complete is not yet implemented!"
	end
end

desc 'Wrap another command'
command :ls do |c|
	c.action do |global_options,options,args|
		require 'shellwords'
		exec (["ls"]+args).shelljoin
	end
end

#skips pre for this command and all subcommands
skips_pre
desc 'Multiple command'
command :multi do |c|
	#Does not work :-(
	#c.arguments :loose
	arguments :loose #this change the privous 'arguments :strict' call :-(

	#note: the 'pre' hook is called just for 'sub1', not for 'multi'
	c.desc "Sub command 1"
	c.command :sub1 do |c|
		c.desc 'Describe some flag here'
		c.default_value 'the default'
		c.arg_name 'The name of the argument'
		c.flag [:g,:otherflag]

		c.action do
			puts "sub1 called"
		end
	end

	c.desc "Sub command 2"
	c.command :sub2 do |c|
		c.action do |global_options,options,args|
			puts "sub2 called"
		end
	end
	
	#if not specified will call 'help'
	c.default_command :sub2
end

desc 'Multiple command2'
command :multi2 do |c|
	c.default_desc "The default action"
	c.action do |global_options, options, args|
		puts "multi2: #{args}"
	end

	c.desc "Sub command"
	c.command :sub do |c|
		#c.skipps_pre is not defined; monkey patch:
		c.instance_variable_set(:@skips_pre, true)
		#note that due to the code this would also propagate to subcommands of
		#this command
		c.action { puts "multi2/sub" }
	end
end

pre do |global,command,options,args|
	# Pre logic here
	# Return true to proceed; false to abort and not call the
	# chosen command
	# Use skips_pre before a command to skip this block
	# on that command only
	puts "pre on '#{command.name}'"
	true
end

post do |global,command,options,args|
	# Post logic here
	# Use skips_post before a command to skip this
	# block on that command only
end

#Monkey patch error_handler
class GLI::GLIOptionParser::NormalCommandOptionParser
	def error_handler
		#lambda { |message,extra_error_context| raise UnknownCommandArgument.new(message,extra_error_context) }
		lambda { |message,extra_error_context| warn "UnknownCommandArgument: #{message} (#{extra_error_context})" }
	end
end

on_error do |exception|
	# Error logic here
	# return false to skip default error handling
	puts "Exception received #{exception.class}: #{exception}"
	#skip GLI's standard error handling which is to print 'help'
	next false if exception.class == GLI::UnknownCommandArgument
	true
end

exit run(ARGV)
