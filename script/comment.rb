#!/usr/bin/env ruby

#./comment.rb files <<<comments
#Comment 'comment' in files
#with option -u: uncomment 'comment' in files
opt_uncomment=ARGV.delete("-u")
comment=STDIN.each_line.to_a
#comment=ARGV.shift.lines.to_a unless comment

def commenting(s)
  case s
  when Array
    return s.map {|i| "# "+i}
  else
    return "# "+s.to_s
  end
end

def find_comment(text,comment)
  for i in 0...text.length do
    if text[i, comment.length] == comment
      return i
    end
  end
  return nil
end

def write_file(file,text)
  File.open(file, "w") { |f| f.puts(text) }
end

commented=commenting(comment)

ARGV.each do |filename|
  text = File.readlines(filename)
  if !opt_uncomment
    if found=find_comment(text,comment)
      text[found, comment.length] = commented
      write_file(filename,text)
    else
      #there was nothing to comment in 'text'
      exit 1
    end
  else
    if !find_comment(text,comment)
      if found=find_comment(text,commented)
        #text already contain 'commented', replace by 'comment'
        text[found, comment.length] = comment
      else
        #we need to add 'comment' to 'text'
        text.concat(comment)
      end
      write_file(filename, text)
    end
  end
end
