#!/usr/bin/env ruby
require "open3"

puts "# Using system"
a=system(*["echo", "hello", "world"])
puts "Return value: #{a}, $?: #{$?}"

puts "# Using backquote"
a=`#{["echo", "hello", "world"].join(" ")}`
puts "Return value: #{a.chomp}, $?: #{$?}"

puts "# Using spawn"
a=spawn(*["echo", "hello", "world"])
b=Process.wait #ou Process.wait(a)
#a=b=pid du spawn
puts "Return value: #{a.inspect}, #{b.inspect}, $?: #{$?}"

puts "# Using open |"
io=open('| ls')
a=io.read #ou io.readlines si on veut un array
io.close #=> fait le Process.wait
puts "Return value: #{a.inspect}, $?: #{$?}"

puts "# Using open | with block"
open('| ls') do |out|
  a=io
end
puts "Return value: #{a.inspect}, $?: #{$?}"

# merge standard output and standard error
puts "# Using popen with a block"
IO.popen(["cat", :err=>[:child, :out]], "r+") {|pipe|
  pipe.puts "hello world"
  pipe.close_write
  a=pipe.read
}
puts "Return value: #{a.chomp}, $?: #{$?}"

#popen("ploum") is exactly like open("| ploum")
puts "# Using popen"
f = IO.popen("uname")
bb=f.pid #the pid of the child popened
a=f.readlines
f.close #the close terminates the child here
b=Process.pid #this is the pid of ruby here
puts "Return value: #{a} #{f.inspect}, pid: parents #{b.inspect} child #{bb.inspect}, $?: #{$?}"

puts "# Simulating popen with a pipe"
# similar to r = IO.popen(command)
r, w = IO.pipe
pid = spawn("echo hellow world", :out=>w)   # r, w is closed in the child process.
#it is important to close w before reading r, otherwise the pipe waits
#because of bufferisation
w.close
a=r.readlines; r.close
b=Process.wait(pid) #Process.wait wait for any child, here we wait specifically for the child we spawned
puts "Return value: #{a} #{r.inspect}, #{w.inspect}, pid: #{pid} #{b}, $?: #{$?}"

puts "## Open3"
puts "# Using capture3"
out, error, status = Open3.capture3("echo a; sort >&2", :stdin_data=>"foo\nbar\nbaz\n")
#note that $? is not set here
puts "Out: #{out.chomp}, Error: #{error.lines.next.chomp}, Status: #{status}"

puts "# Using pipelines"
pids=Open3.pipeline("echo 'ploum\nplam'", "sort")
puts "pids: #{pids}"

puts "# Using rw pipelines with blocks"
Open3.pipeline_rw("tr -dc A-Za-z", "wc -c") {|i,o,ts|
  i.puts "All persons more than a mile high to leave the court."
  i.close
  p o.gets #=> "42\n"
  b=ts
}
puts "pids: #{b}"

puts "# Using rw pipelines"
i, o, threads = Open3.pipeline_rw("tr -dc A-Za-z", "wc -c")
i.puts "All persons more than a mile high to leave the court."
i.close
p o.gets #=> "42\n"
o.close
sleep 0.1 #letting the last thread die since all is closed
puts "pids: #{threads}"

#while popen return a pipe, popen2 return two IO + a thread data containing
#the status of the child
puts "# popen2 with blocks"
# the non block form is left as an exercice :)
Open3.popen2("wc -c") {|i,o,wait_thr|
    i.print "answer to life the universe and everything"
    i.close
    a=o.gets #=> "42\n"
    pid = wait_thr.pid # pid of the started process.
    b = wait_thr.value # Process::Status object returned.
}
puts "Return value: #{a.chomp}, pid: #{pid}, status: #{b}"

puts "# popen3"
#the block form is left as an exercice :)
i,o,e,wait_thr= Open3.popen3("wc -c") 
i.print "answer to life the universe and everything"
i.close
a=o.gets #=> "42\n"
o.close
e.close
sleep 0.1 #letting the last thread die
puts "Return value: #{a.chomp}, wait_thrd: #{wait_thr.inspect}, status: #{wait_thr.value}"

puts "## Calling exec"
exec("echo Goobbye cruel world!")
puts "never get here :-("
