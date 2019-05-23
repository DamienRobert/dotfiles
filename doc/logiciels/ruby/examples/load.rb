#!/usr/bin/env ruby

def foo()
	ploum="ploum"
	@plam="plam"
	#$LOADED_FEATURES apply to require, not load
	#puts "Before load, $LOADED_FEATURES: #{$LOADED_FEATURES}"
	puts "--------------------------------"
	load "loadee.rb"
	puts "--------------------------------"
	#puts "After load, $LOADED_FEATURES: #{$LOADED_FEATURES}"
	puts "@plim: #{@plim}"
end

foo
Foo.foo

module Bar
	@plam="bli"
	puts "in load::Bar nesting: #{Module.nesting}"
	puts "--------------------------------"
	load "loadee.rb"
	puts "--------------------------------"
	#'loadee' is still loaded with an empty nesting, so this does not define
	#Bar::Foo
end
