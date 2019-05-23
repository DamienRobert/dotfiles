#!/usr/bin/env ruby

require 'cmdparse'
parser = CmdParse::CommandParser.new(handle_exceptions: :no_help)
parser.add_command(CmdParse::HelpCommand.new, default: true)
parser.add_command('infos') do |cmd|
	cmd.takes_commands(false)
	cmd.short_desc("Get informations on texts")
	cmd.action do |a="a",b|
		puts a, b
	end
end

parser.add_command('dl') do |cmd|
	cmd.action do
		puts "plim"
	end
	cmd.add_command('ploum') do |subcmd|
		subcmd.takes_commands(false)
		subcmd.action do
			puts "ploum"
		end
	end
end
parser.parse
