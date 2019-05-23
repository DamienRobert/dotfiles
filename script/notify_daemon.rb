#!/usr/bin/env ruby
FIFO="/tmp/myfifo"

t=Thread.new do
	system('mkfifo', FIFO)
	pipe=File.open(FIFO,'r+')
	loop do
		r=pipe.gets
		puts "GOT #{r}"
	end
end
sleep 10
