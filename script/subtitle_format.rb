#!/usr/bin/env ruby
require "dr/encoding"

file = ARGV[0]
out = ARGV[1] || STDOUT
text = File.readlines(file)
abort "No lines in #{file}" if text.empty?
otext=""

def format_line(line,col=50)
  cursor=0
  r=""
  while cursor < line.length do
    chunk = line[cursor...(cursor+col)]
    match=/.*\s+/.match(chunk)
    if match 
      cursoradv=match.offset(0)[1]
    else
      cursoradv=col
    end
    r<<chunk[0...cursoradv]
    r<< "\n" unless r.end_with?("\n")
    cursor+=cursoradv
  end
  return r
end

state=:number #looking for a number
text.each do |line|
  line=line.chomp!+"\n" #normalize end line from "\r\n" to "\n"
  line=DR::Encoding.fix_utf8(line)
  if state == :number and line =~ /^\d+\n$/
    state=:time
    otext << line
    next
  end
  if state == :time and line =~ /.*\s*-->\s*.*/
    state=:text
    otext << line
    next
  end
  if state == :text and line =~ /^\n$/
    state=:number #a new line means next subtitle
    otext << line
    next
  end
  if state == :text
    otext << format_line(line)
    next
  end
  state=:number #parsing error, go back to blank state
end
puts otext
