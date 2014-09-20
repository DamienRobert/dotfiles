#!/usr/bin/env ruby
# vim: fdm=marker
#output installed gems that are not in global or local gems

require 'config/computers'
require 'set'
require "#{ENV['HOME']}/mine/maint/gems/gems.helper.rb"

class Gems
	GEMS={ #{{{
		core: %w(erubis),
		commands: %w(gli),
		commandsextra: %w(thor rake commander micro-optparse cmdparse trollop
	methadone mina), #mina is a deployer
		doc: %w(yard),
		docextra: %w(rdoc yardstick), #yardstick verify doc coverage
		pry: %w(pry pry-doc pry-editline 
	pry-byebug pry-rescue pry-stack_explorer pry-self),
		pryextra: %w(boson boson-more hirb alias),
		tests: %w(minitest),
		testsextra: %w(rspec clean_test simplecov mocha
	aruba sdoc cucumber),
	#other rspec libs: rspec-core rspec-expectations rspec-mocks 
	#other gems: backports minitest-ansi syntax test-unit

		ext: %w(activesupport facets spruz),
		extra: %w(rb-inotify gtk2 bibtex-ruby),
		#rb-inotify and gtk2 are for checkmail.rb
		gems: %w(depgraph gem-man ore rubygems-tasks), #rubygems-tasks is included in ore
		git: %w(git_remote_branch),
		github: %w(hub gist),
		mail: %w(mail maildir mail_extract nntp-client),
		misc: %w(confstruct systemu vimdb), #systemu launch commands
		text: %w(awesome_print paint term-ansicolor), #paint,term-ansicolors are for colors
		time: %w(tzinfo chronic chronic_duration), #tzinfo is for activesupport
		web: %w(nokogiri
	kramdown webgen
	sass compass zurb-foundation foundation),
		webgenextra: %w(webgen-templates-bundle webgen-zurb_foundation-bundle webgen-font_awesome-bundle), #webgen templates
	#For webgen website: builder coderay maruku rdiscount haml RedCloth
	} #}}}

	#init {{{
	def initialize(computer)
		target(computer)
		# Find top gems (topgems) and installed gems (igems)
		getgems
	end

	def target(computer)
		@target=[]
		minimal=[:core]
		light=[:core, :commands, :doc, :pry, :tests]
		full=GEMS.keys
		modes={init: minimal, all: GEMS.keys, minimal: minimal, light: light, full: full}
		if String === computer
			if modes.key?(computer.to_sym)
				@target=modes[computer.to_sym]
			else
				computer=DR::Computer.new(computer) if String === computer
			end
		end
		if DR::Computer === computer
			@target=lambda {computer[:install].each do |type|
				case type
				when "gems-minimal"; return minimal
				when "gems-light"; return light
				when "gems-full"; return full
				end
			end
			}.call
		end

		@wanted=Set.new(@target.map {|g| GEMS[g]}.flatten)
		if DR::Computer === computer
			case computer.name
			when "phare"
				@wanted+=Set.new(["activesupport","chronic","chronic_duration"])+GEMS[:web]
			end
		end
	end

	def getgems
		dependency_list(latest_gems)
		@topgems=Set.new(Node.roots.map(&:to_s))
		@igems=Set.new(Node.all.map(&:to_s))
		@topgems -= ["bigdecimal", "io-console", "psych", "rake", "rdoc", "test-unit"] #these are gems included in ruby

		@extra=@topgems-@wanted
		@missing=@wanted-@igems
	end #}}}

	# Process {{{
	def process(action)
		case action
		when 'show'
			unless @extra.empty?
				puts "== Extra gems installed =="
				puts @extra.to_a.join(" ")
			end
			unless @missing.empty?
				puts "== Gems not installed =="
				puts @missing.to_a.join(" ")
			end
		when 'list'
			puts @wanted.to_a.join(" ")
		when 'pristine'
			process('get')
			process('rm')
		when 'get-all' #all gems that should be installed
			install @wanted
		when 'get'#gems that we want installed but missing
			install @missing
		when 'rm' #remove extra gems
			#remove a group: sudo pacman -Ru
			uninstall @extra
		else warn "action #{action} should be "+
			"show/list/pristine/get-all/get/rm"
		end
	end
	def install(pkgs)
		puts "gem install #{pkgs.to_a.join(" ")};" unless pkgs.empty?
	end
	def uninstall(pkgs)
		puts "gem uninstall #{pkgs.to_a.join(" ")};" unless pkgs.empty?
	end #}}}
end

if __FILE__ == $0
	def process_args(action,*args)
		args=[DR::Computer.new('current')] if args.empty?
		args.each do |arg|
			Gems.new(arg).process(action)
		end
	end

	if ARGV.empty?
		process_args('show')
	else
		args=ARGV; action=args.shift
		process_args(action,*args)
	end
end
