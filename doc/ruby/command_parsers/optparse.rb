#!/usr/bin/env ruby
require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'

=begin
require 'optparse'

options = {}
OptionParser.new do |opts|
    opts.banner = "Usage: example.rb [options]"

      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
            options[:verbose] = v
              end
end.parse!

p options
p ARGV
=end

class OptparseExample

  CODES = %w[iso-2022-jp shift_jis euc-jp utf8 binary]
  CODE_ALIASES = { "jis" => "iso-2022-jp", "sjis" => "shift_jis" }

  #
  # Return a structure describing the options.
  #
  def self.parse(args)
    # The options specified on the command line will be collected in *options*.
    # We set default values here.
    options = OpenStruct.new
    options.library = []
    options.inplace = false
    options.encoding = "utf8"
    options.transfer_type = :auto
    options.verbose = false


    opts = OptionParser.new do |opts|
      opts.banner = "Usage: example.rb [options]"

      opts.separator ""
      opts.separator "Specific options:"

      # Mandatory argument.
      opts.on("-r", "--require LIBRARY",
              "Require the LIBRARY before executing your script") do |lib|
        options.library << lib
      end

      # Optional argument; multi-line description.
      opts.on("-i", "--inplace [EXTENSION]",
              "Edit ARGV files in place",
              "  (make backup if EXTENSION supplied)") do |ext|
        options.inplace = true
        options.extension = ext || ''
        options.extension.sub!(/\A\.?(?=.)/, ".")  # Ensure extension begins with dot.
      end

      # Cast 'delay' argument to a Float.
      opts.on("--delay N", Float, "Delay N seconds before executing") do |n|
        options.delay = n
      end

      # Cast 'time' argument to a Time object.
      opts.on("-t", "--time [TIME]", Time, "Begin execution at given time") do |time|
        options.time = time
      end

      # Cast to octal integer.
      opts.on("-F", "--irs [OCTAL]", OptionParser::OctalInteger,
              "Specify record separator (default \\0)") do |rs|
        options.record_separator = rs
      end

      # List of arguments.
      opts.on("--list x,y,z", Array, "Example 'list' of arguments") do |list|
        options.list = list
      end

      # Keyword completion.  We are specifying a specific set of arguments (CODES
      # and CODE_ALIASES - notice the latter is a Hash), and the user may provide
      # the shortest unambiguous text.
      code_list = (CODE_ALIASES.keys + CODES).join(',')
      opts.on("--code CODE", CODES, CODE_ALIASES, "Select encoding",
              "  (#{code_list})") do |encoding|
        options.encoding = encoding
      end

      # Optional argument with keyword completion.
      opts.on("--type [TYPE]", [:text, :binary, :auto],
              "Select transfer type (text, binary, auto)") do |t|
        options.transfer_type = t
      end

      # Boolean switch.
      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options.verbose = v
      end

      opts.separator ""
      opts.separator "Common options:"

      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      # actually the -h, --help is an officious option, so even whithout
      # this we can still call -h or --help, it just won't appear in the
      # option list
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end

      # Another typical switch to print the version.
      opts.on_tail("--version2", "Show version") do
        puts OptionParser::Version.join('.')
        exit
      end
      # --version is also an officious argument
      opts.version="ploum"
      opts.release="plam"
      #./optparse.rb --version will give: optparse ploum (plam)
      #--*-completion-zsh is another officious option which produce zsh completion

      opts.separator ""
      opts.separator "Je fais joujou"
      opts.on("ploumifie", "--ploum PLOUM", "l'argument est obligatoire", [:ploum, :plam], ["plim"], {"un" => :plim }) do |v|
        puts v
        options.ploum = v
      end
      opts.on("plaifie", "--plam PLOUM", [:ploum, :plam, :plim], {"un" => :plim }) do |v|
        puts v
        options.plam = v
      end
      opts.on("plimifie", "--plim PLOUM", {"un" => :plim, "deux" => :plam }) do |v|
        puts v
        options.plim = v
      end
      opts.on("plumifie", "--plum PLOUM", [1,:deux, "trois"]) do |v|
        #1 n'est pas accepté, deux donne :deux et trois donne "trois"
        #l'expansion marche
        puts v
        options.plum = v
      end
      opts.on(:REQUIRED, "plimoifie", "--plimo", ["deux", "trois", "quatre","cinq"]) do |v|
        #passer le REQUIRED sans --plimo PLOUM le fait bugguer un peu:
        #on peut passer n'importe quel suffixe ici, il ne se fait pas autocompléter
        puts v
        options.plimo = v
      end

      opts.on(:NONE, "--none REQUIRED") do |v| #:NONE est plus fort ici
        options.none= v
      end

      #optional argument qui doit valoir "plim" si spécifié
      opts.on("--opt [OPTIONAL]", [:plim]) do |v|
        options.opt= v
      end
      #other way to speciry optional argument:
      opts.on("--opt2", "=[OPTIONAL]") do |v|
        options.opt2= v
      end
      #opts.on("-o[OPT]") marche aussi

      #this give an error: incompatible argument styles
      #opts.on("-oMANDATORY", "--optdef [OPTIONAL]")

      #this specify a -s option that need a 'hort' argument
      opts.on("-short", "false short option") do |v|
        options.short=v
      end
      #this specify a -s option that need a 'hort' argument
      #so the help message will prit '-s --short2hort2'
      opts.on("-short2", "--short2", "another false short option") do |v|
        options.short2=v
      end

      opts.on("-a","--aa", "short aa")
      #this erase the preceding -a short opt
      opts.on("-a","--ab", "short ab")

      opts.on("-b","--bb", "short bb")
      #this erase the preceding --bb short opt
      opts.on("-c","--bb", "short cc")

      opts.on("-d","--dd", "first dd")
      #this erase the full previous "first dd"
      opts.on("-d","--dd", "second dd")

      #hash as options don't work
      #opts.on("--hash HASH", Hash, "hash option") do |v|
      #  options.hash = v
      #end
    end

    opts.parse!(args)
    options
  end  # parse()

end  # class OptparseExample

options = OptparseExample.parse(ARGV)
pp options
