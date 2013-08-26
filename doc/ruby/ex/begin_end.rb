#!/usr/bin/env ruby
BEGIN {
  puts "Begin 1"
}
END {
  puts "End 1"
}
puts "DATA is: #{DATA}"
BEGIN {
  puts "Begin 2"
}
=begin
comment block
=end

END {
  puts "End 2"
}

__END__
lalalalal
