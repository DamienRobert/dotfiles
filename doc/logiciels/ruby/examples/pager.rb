#!/usr/bin/env ruby
require 'dr/sh'

include SH
run_pager(:always)
puts "in pager"
p SH::ShellUtils.stdout
escape_pager(:orig)
puts "outside pager"
escape_pager
puts "outside pager2"
