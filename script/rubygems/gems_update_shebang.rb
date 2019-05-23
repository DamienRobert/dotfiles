#!/usr/bin/env ruby
# I don't have the same ruby executables everywhere
# /usr/bin/ruby is 1.8 at imb, 1.9 is in opt
# so i want to use /usr/bin/env ruby
# Note: it is better to use --env-shebang in .gemrc

arg = ARGV[0]
files = Dir.glob("*")
files.each do |file_name|
  if arg == "list"
    text = File.open(file_name) { |f| f.gets } ;
    puts "#{file_name}: #{text}" if text[0] =~ /^#![\/\w]+\/ruby\W/
  else
    print file_name
    text = File.readlines(file_name)
    if text[0] =~ /^#![\/\w]+\/ruby\W(.*)/
      extra=$1
      if extra.empty?
        text[0]="#!/usr/bin/env ruby\n"
      else
        text[0]="## #{$1}"
        text.unshift("#!/usr/bin/env ruby\n")
      end
      File.open(file_name, "w") { |f| f.puts(text) }
      puts ": Updated!"
    else
      puts ": OK"
    end
  end
end
