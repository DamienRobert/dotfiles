#!/usr/bin/env ruby
BEGIN {
  puts "Begin 1"
}
END {
  puts "End 1"
}
at_exit {
	puts "at exit 1"
}
puts "DATA is: #{DATA} -> #{DATA.read}"
BEGIN {
  puts "Begin 2"
}

=begin
comment block
=end

END {
  puts "End 2"
}

#EOS example:
def foo(a,b)
	p a
	p b
end

foo(<<EOS, <<EOT)
plim
EOS
plam
EOT

at_exit {
	puts "at exit 2"
}

__END__
lalalalal
