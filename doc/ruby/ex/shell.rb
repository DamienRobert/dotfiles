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
b=Process.wait(a) #ou Process.wait, qui attend le dernier process
#a=b=pid du spawn
puts "Return value: #{a.inspect}, wait: #{b.inspect}, $?: #{$?}"

puts "# Using open |"
io=open('| uname')
a=io.read #ou io.readlines si on veut un array
pid=io.pid
io.close #=> fait le Process.wait
puts "Return value: #{a.inspect}, pid: #{pid.inspect}, $?: #{$?}"

puts "# Using open | with block"
open('| uname') do |out|
  a=out.read
end
puts "Return value: #{a.inspect}, $?: #{$?}"

#popen("ploum") is exactly like open("| ploum")
puts "# Using popen"
io = IO.popen("uname")
a=io.readlines
pid=io.pid
io.close #the close terminates the child here
puts "Return value: #{a}, pid: #{pid.inspect}, io #{io.inspect}, $?: #{$?}"

# merge standard output and standard error, and open read
puts "# Using popen with a block"
IO.popen(["cat", :err=>[:child, :out]], "r+") {|pipe|
  pipe.puts "hello world"
  pipe.close_write
  a=pipe.read
}
puts "Return value: #{a.chomp}, $?: #{$?}"

puts "# Simulating popen with a pipe"
# similar to r = IO.popen(command)
r, w = IO.pipe
pid = spawn("echo hellow world", :out=>w)   # r, w is closed in the child process.
#it is important to close w before reading r, otherwise the pipe waits
#because of bufferisation
w.close
a=r.readlines; r.close
b=Process.wait(pid) #Process.wait wait for any child, here we wait specifically for the child we spawned
puts "Return value: #{a}, r/w pipe: #{r.inspect}, #{w.inspect}, pid: #{pid}, wait: #{b}, $?: #{$?}"

puts "## Open3"
puts "# Using capture3"
out, error, status = Open3.capture3("echo a; sort >&2", :stdin_data=>"foo\nbar\nbaz\n")
#note that $? is not set here
puts "Out: #{out.chomp}, Error: #{error.chomp}, Status: #{status}"

puts "# Using capture3 in block form"
out, error, status = Open3.capture3("echo a; sort >&2", :stdin_data=>"foo\nbar\nbaz\n") do |*args|
  puts args.inspect
end
#note that $? is not set here
puts "Out: #{out.chomp}, Error: #{error.chomp}, Status: #{status}"

puts "# Using pipelines"
pids=Open3.pipeline("echo 'ploum\nplam'", "sort")
puts "pids: #{pids}"

puts "# pipeline_start"
threads = Open3.pipeline_start("echo ploum plam","sort")
threads.each do |t| t.value end #wait for threads
puts "threads: #{threads}"

puts "# pipeline_start block mode"
Open3.pipeline_start("echo ploum plam","sort") do |threads|
  p threads
end

puts "# Using rw pipelines"
i, o, threads = Open3.pipeline_rw("tr -dc A-Za-z", "wc -c")
i.puts "All persons more than a mile high to leave the court."
i.close
p o.gets #=> "42\n"
o.close
threads.each do |t| t.value end #wait for threads
puts "threads: #{threads}"

puts "# Using rw pipelines with blocks"
Open3.pipeline_rw("tr -dc A-Za-z", "wc -c") {|i,o,ts|
  i.puts "All persons more than a mile high to leave the court."
  i.close
  p o.gets #=> "42\n"
  b=ts
}
puts "threads: #{b}"

#while popen return a pipe, popen2 return two IO + a thread data containing
#the status of the child
puts "# popen2 with blocks"
# the non block form is left as an exercice :)
Open3.popen2("wc -c") {|i,o,wait_thr|
    pid = wait_thr.pid # pid of the started process.
    i.print "answer to life the universe and everything"
    i.close
    a=o.gets #=> "42\n"
    b = wait_thr.value # Process::Status object returned.
    #put at end because it waits for the process. In block form this is not
    #needed if we don't care about the value, the process is waited at exit
    #of block
}
puts "Return value: #{a.chomp}, pid: #{pid}, status: #{b}"

puts "# popen3"
#the block form is left as an exercice :)
i,o,e,wait_thr= Open3.popen3("wc -c") 
pid=wait_thr.pid
i.print "answer to life the universe and everything"
i.close
a=o.gets #=> "42\n"
o.close
e.close
exitvalue=wait_thr.value #wait_thr.value waits the termination of the process. The block form also waits the process when it returns.
puts "Return value: #{a.chomp}, wait_thrd: #{wait_thr.inspect}, pid: #{pid}, status: #{exitvalue}"

puts "## Calling exec"
exec("echo Goobbye cruel world!")
puts "never get here :-("
