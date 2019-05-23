#!/usr/bin/env ruby

require 'dr/packages/syst.rb'
require 'shellwords'
load "~/script/library_dependency.rb"

def binaries_in_packages(*pkgs)
	`pacman -Ql #{pkgs.shelljoin}`.split("\n").select do |path|
		path=~%r!/usr/bin/.*[^/]$!
	end.map {|path| path.split[1]}
end

ARCH="#{ENV['HOME']}/opt/archfull"
comp=DR::Computer.new
pkgs=DR::Packages::Syst.new(comp)
mypkgs=pkgs.pkgs_list[:arch_abs].to_a
puts "mypkgs: #{mypkgs}"
##eventually replace with the binaries we really want
bins=binaries_in_packages(*mypkgs)
#puts "bins: #{bins}"
libs=inspect_libraries(*bins, ldd: "LD_TRACE_LOADED_OBJECTS=1; export LD_TRACE_LOADED_OBJECTS; #{ARCH}/usr/lib/ld-linux-x86-64.so.2 --library-path #{ARCH}/usr/lib:")
#puts "libs: #{libs}"
dep_want=libraries_to_packages(*libs).uniq
#puts "dep_want: #{dep_want}"
want=mypkgs+dep_want

have=DR::Packages::Handler.new(comp, ptype: :arch_abs).list_packages

puts "# We want: #{want}"
puts "# We have: #{have}"
puts "pacman -Rdd #{(have-want).shelljoin}"
puts "pacman -Sdd --needed --asdeps #{(dep_want - have).shelljoin}"
puts "pacman -Sdd --needed #{(mypkgs- have).shelljoin}"
