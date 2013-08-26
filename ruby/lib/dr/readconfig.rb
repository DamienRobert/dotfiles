#!/usr/bin/env ruby
module DR
  module ReadConfig
    module_function
    #return an array for each non comment lines
    #of array of elements in this line
    def parse(*args)
      out=[]
      args.each do |file|
        lines=File.readlines(file)
        lines.each do |line|
          line =~ /(.*)\#(.*)/ && line=$1 #strip comments
          line =~ /^\s*$/ && next #skip blank lines
          out << line.split(/\s+/)
        end
        return out
      end
    end
  end
end

if __FILE__ == $0 then
  join=ARGV.delete("--join") || ARGV.delete("-j")
  out=DR::ReadConfig.parse(*ARGV)
  if join
    puts out.flatten.join(" ")
  else
    out.each do |i|
      puts i.join(" ")
    end
  end
end
