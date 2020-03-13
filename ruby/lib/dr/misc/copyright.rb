#!/usr/bin/env ruby
# rubocop: enable Layout/IndentationWidth

module DR
  module Copyright
    extend self

    def replace(l, offset, content)
      l[offset[0], offset[1] - offset[0]] = content
    end

    def copyright(lines, verbose: false, change_year: true, name: nil, downgrade: false)
      changed=false
      change_log=[]
      text=lines.each_line.map do |l|
        if l =~ /Copyright.*#{name}/
          lorig = l.dup
          l.gsub!(/\([cC]\)/, "©")
          change_year = Time.now.year.to_s if change_year == true
          if (m = l.match(/\W(\d{4})[-–](\d{4})\W/))
            l[m.offset(1)[1], 1] = "–" # replace '-' by the en-dash
            beginyear = m[1]; endyear = m[2]
            if change_year
              if change_year > endyear
                replace(l, m.offset(2), change_year) 
              elsif change_year < endyear and downgrade
                if change_year > beginyear
                  replace(l, m.offset(2), change_year)
                else
                  replace(l, m.offset(0), " #{change_year}")
                end
              end
            end
          elsif (m = l.match(/\W(\d{4})\W/))
            year = m[1]
            if change_year
              if change_year > year
                replace(l, m.offset(1), "#{year}–#{change_year}")
              elsif change_year < year and downgrade
                replace(l, m.offset(1), " #{change_year}")
              end
            end
          end
          changed=true if (lorig != l)
          if verbose && l.match(/©/) # be verbose on real copyright lines
            if (lorig != l)
              change_log << "#{lorig.chomp} -> #{l.chomp}"
            elsif verbose == :full or verbose == "full"
              change_log << l
            end
          end
        end
        l
      end.join
      return text, changed, change_log
    end

    def change_files(*args, verbose: true, dryrun: true, year: true, **opts)
      cur_year=nil
      # date=short gives yyyy-mm-dd
      gityear = ->(s="") {`git log -1 --format=%cd --date=format:%Y #{s}`.chomp}
      args.each do |file|
        Dir.chdir(File.dirname(file)) do
          cur_year=case year
          when "git"
            gityear.call
          when "gitlib"
            if Dir.exist?("lib")
              gityear.call("lib")
            else
              gityear.call
            end
          when "gitcopyright"
            gityear.call("--invert-grep --grep Copyright")
          else
            year
          end
        end
        text, changed, change_log = copyright(File.read(file), verbose: verbose, change_year: cur_year, **opts)
        if changed or verbose == :full or verbose == "full"
          puts "-- #{file} (#{cur_year}) --" if verbose
          puts change_log.join("\n") unless change_log.empty?
        end
        File.open(file, "w") { |f| f.puts(text) } if changed and !dryrun
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  require "optparse"
  opts = { verbose: true, dryrun: false, year: true, downgrade: false }
  optparse = OptionParser.new do |opt|
    opt.banner = "#{File.basename($PROGRAM_NAME)} files"
    opt.on("-v", "--[no-]verbose=[mode]", "verbose", "verbose=full to always show the copyright year") do |v|
      opts[:verbose] = v
    end
    opt.on("-d", "--[no-]dry-run", "dry run") do |v|
      opts[:dryrun] = v
    end
    opt.on("-y", "--year", "=[year]", "update year", "When true (default), use current year. Special mode 'git' which looks at last modification") do |v|
      opts[:year] = v
    end
    opt.on("--name=name", "Only update copyright for name") do |v|
      opts[:name] = v
    end
    opt.on("--[no-]downgrade", "Allows to downgrade the year") do |v|
      opts[:downgrade] = v
    end
  end
  optparse.parse!
  DR::Copyright.change_files(*ARGV, **opts)
end
## ~/script/copyright.rb -d -y {~rubygems,~progs}/*/{LICENSE,README,COPYING}*(N)

# ~/script/copyright.rb --name="Damien Robert" --year=gitcopyright -d ~/dist/@github/*/{COPYING,*.{md,txt}} ~/website/common/erb_common.rb
# gitstatus.rb ~/dist/@github/*
# vcs action 'git ci -a -m "Copyright"' ~/dist/@github/*
# vcs push ~/dist/@github/*
