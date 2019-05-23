#!/usr/bin/env ruby
# vim: fdm=marker

# Sample Code: {{{1
require 'optparse'
#define how to parse 'Time'
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
  # From the documentation {{{2
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
      #./optparse.rb '--*-completion-bash' '--c'
      #=> --code --convert2 --convert3 --convert4


      # Tests de l'expansion {{{2
      opts.separator ""
      opts.separator "Je fais joujou"
      opts.on("ploumifie", "--ploum PLOUM", "l'argument est obligatoire", [:ploum, :plam], ["plim"], {"un" => :plim }) do |v|
        #the arguments can be 'ploum', 'plam', 'plim' or the alias 'un'
        #(with autocompletion)
        # ploum/plam will give :ploum/:plam, while plim will give "plim"
        puts v
        options.ploum = v
      end
      opts.on("plaifie", "--plam PLOUM", [:ploum, :plam, :plim], {"un" => :plim }) do |v|
        puts v
        options.plam = v
      end
      opts.on("plimifie", "--plim PLOUM", {"un" => :plim, "deux" => :plam }) do |v|
      	#The arguments can be 'un' or 'deux' (which are then aliased), but
      	#not 'plim' or 'plam'!
        puts v
        options.plim = v
      end
      opts.on("plumifie", "--plum PLOUM", [1,:deux, "trois"]) do |v|
        #1 n'est pas accepté, deux donne :deux et trois donne "trois"
        #l'expansion marche
        puts v
        options.plum = v
      end

      # Tests de Required/Optional/None {{{2
      opts.on(:REQUIRED, "plimoifie", "--plimo", ["deux", "trois", "quatre","cinq"]) do |v|
        #passer le REQUIRED sans --plimo PLOUM le fait bugguer un peu:
        #on peut passer n'importe quel suffixe ici, il ne se fait pas autocompléter
        #d'après https://bugs.ruby-lang.org/issues/7498
        #"Option name string has to come first. Put :REQUIRED after "--bug"."
        #En fait si on regarde le code, ça marche presque, le Hash est bien
        #dans pattern, qui a précédence sur le default_pattern qui est
        #défini quand on parse "--plimo", par contre le 'conv' est overridé
        puts v
        options.plimo = v
      end

      opts.on(:NONE, "--none REQUIRED") do |v| #:NONE est plus fort ici
        options.none= v
      end

			# Placed + NilClass
      #'$0 --optional foo' consider 'foo' as an option
      #'$0 --optional=foo' works too
      opts.on("--optional [OPTIONAL]") do |v|
        options.optional= v
      end

			# Placed + NilClass avec complétion:
      #Placed argument qui doit valoir "plim" (ou un préfixe) si spécifié
      #sinon vaut nil
      opts.on("--opt [OPTIONAL]", [:plim]) do |v|
        options.opt= v
      end

      #Optional argument + Object:
      #si l'argument optionel (à passer via opt2=foo) est non spécifié, alors vaut 'true' (car ici klass=Object et pas NilClass)
      #this differs from '--optional2' below where klass is NilClass so no value yields nil
      opts.on("--opt2", "=[OPTIONAL]") do |v|
        options.opt2= v
      end

			#Optional argument + NilClass
      #here '$0 --optional2 foo' considers 'foo' as an argument
      #only '$0 --optional2=foo' works
      #'$0 --optional2' set optional2 to nil
      #the [=OPTIONAL] could be [OPTIONAL] or =[OPTIONAL]
      #putting a space before the [] gives a Placed argument
      # opts.on("-o[OPT]") marche aussi
      opts.on("--optional2[=OPTIONAL]") do |v| 
        options.optional2= v
      end

			# Required + Object
      opts.on("--mandatory", "=MANDATORY") do |v|
      	options.mandatory=v
      end

			# Required + NilClass (mais pas vraiment possible car l'argument est nécessaire)
      #for mandatory arguments even this form accepts $0 --mandatory2 foo
      opts.on("--mandatory2=MANDATORY") do |v|
      	options.mandatory2=v
      end

      #In summary:
      #  "=Required" => Required + Object
      #  "=[Opt] => Optional + Object
      #  "--foo ploum" => Required + NilClass
      #  "--foo [ploum]" => Placed + NilClass
      #  "--foo[ploum]", "--foo=[ploum]"  => Optional + NilClass
      #  "--foo=[ploum]"  => Optional + NilClass


      ## --no*options {{{2
			opts.on("--[no-]value VALUE") do |v|
				options.value=v
			end

			#the only difference with this version is that the help show
			#'--no-value2", but only --value2 can take an argument
			#passing --no-value2 set value2 to false
			opts.on("--no-value2 VALUE") do |v|
				options.value2=v
			end

			#here there is no --value3 dual option, only --no-value3
			opts.on("--no-value3") do |v|
				options.value3=v
			end

			#Here '--value4' sets value4 to true, --no-value4 to false
			#but one can also use '--value4=foo' to set v=foo
			opts.on("--[no-]value4[=VALUE]") do |v|
				options.value4=v
			end

			#--value5 needs a mandatory arg, but '--no-value5' set value5 to false
			#Here class is Object
			opts.on("--[no-]value5=VALUE") do |v|
				options.value5=v
			end

			#force to pass an argument
			#--convert define Klass to be TrueClass, "=VALUE" set it to Object,
			#so we repass TrueClass to only be able to pass yes/no values:
			#$0 --convert=d => 'invalid argument'
			# We could also do: opts.on("--[no-]convert=VALUE", TrueClass) do |v|
			opts.on("--[no-]convert", "=VALUE", TrueClass) do |v|
				options.convert=v
			end

			## accept klass {{{2
			#$0 --regexp /foo/
			opts.on("--regexp REG", Regexp) do |v|
				p v.class
				options.regexp=v
			end

			#Only accept options machin /foo.*/ (note that it seems like the
			#Regexp is anchored so /foo/ only matches 'foo')
			opts.on("--match STRING", /foo.*/) do |v|
				options.match=v
			end

			#accepts 12, -12, 0b10101, 0xAEF0, 012, 1.23, 1e23, 2/3
			opts.on("--convert2 numeric", Numeric) do |v|
				options.convert2=v
			end
			#accepts only DecimalInteger
			opts.on("--convert3 decimal integer", OptParse::Acceptables::DecimalInteger) do |v|
				options.convert3=v
			end
			#accepts only OctalInteger ('10'='010')
			opts.on("--convert4 octal integer", OptParse::Acceptables::OctalInteger) do |v|
				options.convert4=v
			end

			## Abuse the syntax {{{2
      #this give an error: incompatible argument styles
      #opts.on("-oMANDATORY", "--optdef [OPTIONAL]")

      #this specify a -s option that need a 'hort' argument
      opts.on("-short", "false short option") do |v|
        options.short=v
      end
      #this specify a -s option that need a 'hort2' argument
      #so the help message will prit '-s --short2hort2'
      opts.on("-short2", "--short2", "another false short option") do |v|
        options.short2=v
      end

      opts.on("-a","--aa", "short aa")
      #this erase the preceding -a short opt
      opts.on("-a","--ab", "short ab")

      opts.on("-b","--bb", "short bb")
      #this erase the preceding --bb long opt
      opts.on("-c","--bb", "short cc")

      opts.on("-d","--dd", "first dd")
      #this erase the full previous "first dd"
      opts.on("-d","--dd", "second dd")

			## Divers {{{2
			opts.on("--terminate", "terminate option processing") do
				opts.terminate
			end

      #hash as options don't work
      #opts.on("--hash HASH", Hash, "hash option") do |v|
      #  options.hash = v
      #end

			## parsing {{{2
    end

    opts.parse!(args)
    options
  end  # parse()

end  # class OptparseExample

options = OptparseExample.parse(ARGV)
pp options, ARGV

=begin

# opt.on arguments: {{{1

Optional argument, default to true:
	opts.on("--[no-]myopt[=value]") do |v|
		options.value=v
	end

Creates an OptionParser::Switch from the parameters. The parsed argument
value is passed to the given block, where it can be processed.

+opts+ can include the following elements:
[Argument style:]
  One of the following:
    :NONE, :REQUIRED, :OPTIONAL

[Argument pattern:]
  Acceptable option argument format, must be pre-defined with
  OptionParser.accept or OptionParser#accept, or Regexp. This can appear
  once or assigned as String if not present, otherwise causes an
  ArgumentError. Examples:
    Float, Time, Array

[Possible argument values:]
  Hash or Array.
    [:text, :binary, :auto]
    %w[iso-2022-jp shift_jis euc-jp utf8 binary]
    { "jis" => "iso-2022-jp", "sjis" => "shift_jis" }

[Long style switch:]
  Specifies a long style switch which takes a mandatory, optional or no
  argument. It's a string of the following form:
    "--switch=MANDATORY" or "--switch MANDATORY"
    "--switch[=OPTIONAL]"
    "--switch"

[Short style switch:]
  Specifies short style switch which takes a mandatory, optional or no
  argument. It's a string of the following form:
    "-xMANDATORY"
    "-x[OPTIONAL]"
    "-x"
  There is also a special form which matches character range (not full
  set of regular expression):
    "-[a-z]MANDATORY"
    "-[a-z][OPTIONAL]"
    "-[a-z]"

[Argument style and description:]
  Instead of specifying mandatory or optional arguments directly in the
  switch parameter, this separate parameter can be used.
    "=MANDATORY"
    "=[OPTIONAL]"

[Description:]
  Description string for the option.
    "Run verbosely"

[Handler:]
  Handler for the parsed argument value. Either give a block or pass a
  Proc or Method as an argument.

Remark:
Due to the way options are parsed, description can be everywhere, but
'-s' and '--long' options should be before specific Klass or :REQUIRED
settings


# Object relationship diagram: {{{1

  +--------------+
  | OptionParser |<>-----+
  +--------------+       |                      +--------+
                         |                    ,-| Switch |
       on_head -------->+---------------+    /  +--------+
       accept/reject -->| List          |<|>-
                        |               |<|>-  +----------+
       on ------------->+---------------+    `-| argument |
                          :           :        |  class   |
                        +---------------+      |==========|
       on_tail -------->|               |      |pattern   |
                        +---------------+      |----------|
  OptionParser.accept ->| DefaultList   |      |converter |
               reject   |(shared between|      +----------+
                        | all instances)|
                        +---------------+
Note: accept adds new converters, reject destroy existing ones

Objects:
Switch => NoArgument, RequiredArgument, OptionalArgument, PlacedArgument
List: @atype: pattern and conversion
      @short, @long: OptionMap
      @list: Array of all switches and summary string
      .accept(type, pat, &block) [note: use pat#convert if block not provided]

OptionParser: 
  @stack=[DefaultList, List.new, List.new] (note that .base is @stack[1]; this is where Officious commands are added, cf add_officious)
  @program_name
  @banner, @summary_{width,indent}
  @default_argv=ARGV

  Stack: When we use OptionParser.new, the @stack contains three list: The
  default list (where we can add new accept pattern via
  OptionParser.accept/reject), the bottom list (#base) affected by on_tail
  [add at the end] and which also contains the Officious Commands, the top
  list (#top) affected by on [add at the end], on_top [add at the
  beginning] and #accept, reject

  Officious switches:
  => DefaultList ["--"]
  => Officious Commands: [--help, --*-completion-bash=WORD, --*-completion-zsh=NAME:FILE, --version]

Note that officious switches are not added to :list, only to :long (and :short). :list is only used for
- documentation/completion: List#summarize, List#add_banner, List#compsys, OptionParser#candidate
- parsing via each_option which iterates on the list and is used to
  - in parse_in_order for match_nonswitch?

OptionParser: {{{1

  Error messages: .abort, .warn
  Documentation: .banner, .separator, .summarize, .help, .to_a
    .ver [use @program_name, @version, @release], .version, .release, .program_name
  Accept: .accept, .reject
  Completion: .candidate, .compsys
  Switches: .define*, .on*, order, permute, parse
  Misc: .load: parse a filename, each name representing an argument
        .environment: parse ENV[basename of the program]
        .new/.remove (manipulates the @stack)

  Documentation: 
    #to_s=#help. #help=(#banner+#summarize);
    #separator adds a doc string to the list (like opt.on("description")
    would do).

  Completion:
    .complete (private): calls List#complete which calls the sublist#complete
      Utilisé pour compléter les long options et short options dans
      parse_in_order
    .candidate: show candidates options (and even candidate arguments if the opt pattern is a CompletingHash). Calls Switch#candidate
      Utilisé pour --*-completion-bash
    .compsys: calls List#compsys which calls the 'list' sublist#compsys.
      Utilisé pour --*-completion-zsh

  Private Helpers (parcours du @stack): visit, search

List methods:
  accessors: list, long, short, atype, each_option
  delegation to a sublist: search, each_option,
    doc: .summarize, .add_banner (delegates to each #list switches)
    completion: .complete, .compsys (idem)
  .accept/.reject, .append/.prepend

Switch doc helpers: add_banner, summarize, switch_name, desc, compsys

OptionMap methods: (this is a CompletingHash)
- candidate, complete, convert
Note CompletingHash is the same except it has the #match method added

Code for #visit and #search:

  # Traverses @stack, sending each element method +id+ with +args+ and
  # +block+.
  def visit(id, *args, &block)
    @stack.reverse_each do |el|
      el.send(id, *args, &block)
    end
    nil
  end

  # Searches +key+ in @stack for +id+ hash and returns or yields the result.
  def search(id, key)
    block_given = block_given?
    visit(:search, id, key) do |k|
      return block_given ? yield(k) : k
    end
  end

  # Where List#search is:
    def search(id, key)
      if list = __send__(id)
        val = list.fetch(key) {return nil}
        block_given? ? yield(val) : val
      end
    end

OptionParser#accept:
  @stack = [DefaultList] #here @stack is the class variable for OptionParser!
  def self.top() DefaultList end

  def accept(*args, &blk) top.accept(*args, &blk) end
  def self.accept(*args, &blk) top.accept(*args, &blk) end
  def reject(*args, &blk) top.reject(*args, &blk) end

  def List#accept(t, pat = /.*/m, &block)
      if pat
        pat.respond_to?(:match) or
          raise TypeError, "has no `match'", ParseError.filter_backtrace(caller(2))
      else
        pat = t if t.respond_to?(:match)
      end
      unless block
        block = pat.method(:convert).to_proc if pat.respond_to?(:convert)
      end
      @atype[t] = [pat, block]
    end

  def List#reject(t)
    @atype.delete(t)
  end


# Completion: {{{1

  # Map from option/keyword string to object with completion.
  # (used in @long, @short optionparser lists)
  class OptionMap < Hash
    include Completion
  end

  class CompletingHash < Hash
    include Completion

    # Completion for hash key.
    # => return key, *values
    def match(key)
      *values = fetch(key) {
        # NDR: ce code est tricky, à cause du 'return', le fetch (s'il
        # échoue car la clé n'existe pas), retourne le complété. Mais en
        # cas de throw :ambiguous, à cause du catch le return n'est pas
        # effectué, et donc le raise est lancé
        raise AmbiguousArgument, catch(:ambiguous) {return complete(key)}
      }
      return key, *values
    end
  end

Pour la complétion, le hash ou l'array peut avoir des valeurs Strings ou
Regexp.
Quand on complète key, si pat n'est pas donné, key est transformée en
regexp via pat=/\A#{quoted key}\w*/ et pat match les Strings de l'array; tandis
que les Regexps de l'array matchent key.
Ca donne les candidats, et ensuite donne le plus petit préfixe existant.
Ie si on complète 'b' et les candidats sont ["boo", "boobar"], donne "boo",
si les candidats sont ["boo", "boobar", "ba"] throw :ambiguous

    def self.regexp(key, icase)
      Regexp.new('\A' + Regexp.quote(key).gsub(/\w+\b/, '\&\w*'), icase)
    end
    def self.candidate(key, icase = false, pat = nil, &block)
      pat ||= Completion.regexp(key, icase)
      candidates = []
      block.call do |k, *v|
        (if Regexp === k
           kn = "".freeze
           k === key
         else
           kn = defined?(k.id2name) ? k.id2name : k
           pat === kn
         end) or next
        v << k if v.empty?
        candidates << [k, v, kn]
      end
      candidates
    end

    def candidate(key, icase = false, pat = nil)
      Completion.candidate(key, icase, pat, &method(:each))
    end

    # Return (or yield) the completing key and its associated value
    def complete(key, icase = false, pat = nil)
      candidates = candidate(key, icase, pat, &method(:each)).sort_by {|k, v, kn| kn.size}
      if candidates.size == 1
        canon, sw, * = candidates[0]
      elsif candidates.size > 1
        canon, sw, cn = candidates.shift
        candidates.each do |k, v, kn|
          next if sw == v
          if String === cn and String === kn
            if cn.rindex(kn, 0)
              canon, sw, cn = k, v, kn
              next
            elsif kn.rindex(cn, 0)
              next
            end
          end
          throw :ambiguous, key
        end
      end
      if canon
        block_given? or return key, *sw
        yield(key, *sw)
      end
    end

    # Note: CompletingHash#match returne key, *values
    # donc convert retourne la première valeur de *values
    def convert(opt = nil, val = nil, *)
      val
    end

Exemple:
h=OptParse::CompletingHash.new
h[:foo]="bar"
h[/b.*r/]="babar"
h["foobar"]=["ploum","plam"]
h.candidate(:foo)
=> [[:foo, ["bar"], "foo"], ["foobar", [["ploum", "plam"]], "foobar"]]
  (l'ordre est [matching key, matching values, canonical string name of matching key)
h.candidate("bar") => [[/b.*r/, ["babar"], ""]]
h.complete(:foo) => [:foo, "bar"]
h.complete("foo") => ["foo", "bar"]
h.complete("f") => ["foo", "bar"]

Note dans OptionParser, .complete appelle l.complete pour chacune des
listes du @stack (cf search et visit); qui appelle complete sur la
sous-liste :long ou :short suivant l'id.
Donc on a une complétion des options.
On a aussi .candidate qui montre les candidats de complétion (y compris pour les options de type --foo=bar); utilisé par --*-completion-bash=WORD

# Conversion: {{{1

cf OptionParser::List.atype (l1836) to see the regexps and conversion:
=> Object: return arg, or true if arg=nil
=> NilClass: return arg
=> TrueClass: Alias -/no/false to false, +/yes/true to true, and return the arg or true if arg=nil
=> FalseClass: Same as TrueClass except return false if arg=nil
=> Array: split on ','

In summary:
- Nil and Object accept everything, the difference is that
  Object converts 'nil' to 'true'. String accepts non empty strings.
  TrueClass and FalseClass accepts the same things, TrueClass gives 'true'
  if nothing is passed and FalseClass gives 'false'
- In the --[no-]foo/--no-foo option style, '--no-foo' has pattern
  FalseClass while --foo has pattern TrueClass (except if it accepts an
  argument in which case it has pattern Object). The other patterns have type
  NilClass by default.

Exemple:
require 'optparse/time' #see also 'optparse/{date,shellwords,uri}' for DateTime, ShellWords,URI
By default OptParse accepts the classes Object, NilClass, String, Integer,
Float, Numeric, TrueClass, FalseClass, Array, Regexp and the custom classes
(see OptionParser::Acceptable): DecimalInteger, OctalInteger,
DecimalNumeric (like numeric but don't accept rationals)

They specify a pattern to match and a conversion proc; but this can also
be an object which responds to :match and :convert => can be a 'CompletingHash'

# Switches: {{{1

attr_reader :pattern, :conv, :short, :long, :arg, :desc, :block
- pattern: regexp
- conv: fonction de conversion
- short: array de short option name
- long: array de long option name
- desc: description
- arg: arg name
- block: le block associé au switch

Doc helpers: add_banner, summarize, switch_name, desc, compsys
Parsing: match_nonswitch?

parse_arg(arg):
  Parses +arg+ avec @pattern and returns rest of +arg+ and matched portion
  (via match.to_a) to the argument pattern. Yields when the pattern doesn't
  match the whole arg.

def conv_arg(arg, val = [])
  # typically arg is the remaining argument, and val are the matches
  return arg, block, (conv || identite).call(*val)

Typiquement, un switch.parse(arg, argv) va faire
  [ici arg c'est le reste de l'option, par ex dans --foo=bar ça va être bar, et argv les arguments suivants]
        conv_arg(*parse_arg(arg, &method(:raise)))
qui va matcher arg avec le pattern, appliquer conv_arg sur
le match (ie match.to_a), et retourner dans l'ordre: reste de
l'argument, block du switch, résultat du conv_arg

NoArgument:
      def parse(arg, argv)
        yield(NeedlessArgument, arg) if arg
        conv_arg(arg)
      end
RequiredArgument:
      def parse(arg, argv)
        unless arg
          raise MissingArgument if argv.empty?
          arg = argv.shift
        end
        conv_arg(*parse_arg(arg, &method(:raise)))
      end
OptionalArgument:
      # Parses argument if given, or uses default value.
      def parse(arg, argv, &error)
        if arg
          conv_arg(*parse_arg(arg, &error))
        else
          conv_arg(arg)
        end
      end
    end
PlacedArgument:
      # Returns nil if argument is not present or begins with '-'.
      def parse(arg, argv, &error)
        # si il n'y a pas d'argument et que l'arg suivant est une option
        # retourne nil
        if !(val = arg) and (argv.empty? or /\A-/ =~ (val = argv[0]))
          return nil, block, nil
        end
        opt = (val = parse_arg(val, &error))[1]
        val = conv_arg(*val)
        if opt and !arg #on a matché le val=argv[0]
          argv.shift
        else
          # considère que le reste de l'argument est toujours 'nil'
          # (je ne comprends pas trop pourquoi)
          val[0] = nil
        end
        val
      end


## Switch types:
 OptParse::ArgumentStyle
 => {:NONE=>OptionParser::Switch::NoArgument,
  nil=>OptionParser::Switch::NoArgument,
  :REQUIRED=>OptionParser::Switch::RequiredArgument,
  true=>OptionParser::Switch::RequiredArgument,
  :OPTIONAL=>OptionParser::Switch::OptionalArgument,
  false=>OptionParser::Switch::OptionalArgument}

- NoArgument: raise exception if arg given => :NONE, nil
- RequiredArgument: raise exception if arg not given => '=foo', 'foo' (via guess), :REQUIRED, true
- PlacedArgument: take arg which does not begin with '-' => ' [foo]'
- OptionalArgument: can omit argument => '=[foo]' or '[foo]', :OPTIONAL, false
Note: default_style.guess("") retourne 'self'

## Guessing option style:
  def self.guess(arg)
    case arg
    when ""
      t = self
    when /\A=?\[/
      t = Switch::OptionalArgument
    when /\A\s+\[/
      t = Switch::PlacedArgument
    else
      t = Switch::RequiredArgument
    end
    self >= t or incompatible_argument_styles(arg, t)
    t
  end

Remarque: si self est une sous-classe de Switch, alors la méthode de classe
'self.pattern' est NilClass, sauf pour NoArgument où c'est Object.
Switch.pattern est utilisé dans make_switch pour déterminer le pattern par défaut:
    default_pattern, conv = search(:atype, default_style.pattern) unless default_pattern


# opt.on: {{{1

make_switch: {{{2
On part de default_style: NoArgument
opts.each do |o|
- si o est dans :atype, défini le default_pattern et conv à partir du atype[o]
  (ou le not_pattern, not_conf if not_style and not_style != Switch::NoArgument)
- si ce n'est pas un symbole ou un string, et a :match, considère ça comme un *pattern* et utilise conv=o.convert || SPLAT_PROC
  (SPLAT_PROC = proc {|*a| a.length <= 1 ? a.first : a})

- si o=Proc,Method => défini le block
- si o=Array, Hash => en fait un CompletingHash (ou update un CompletingHash déjà existant ce qui fait qu'on peut passer plusieurs Array/Hash) et le met dans *pattern*
- si o in ArgumentStyle.keys (ie :Required,...) => défini le *style* du switch
- si o de la forme '--foo bar'/'--foo=bar','--foo[bar]',"--foo [bar]':
        q, a = $1, $2 (dans la suite j'appelle 'a' l'argument)
        if a
          o = notwice(NilClass, klass, 'type')
          default_style = default_style.guess(arg = a)
          default_pattern, conv = search(:atype, o) unless default_pattern
        end
  => notation: klass=NilClass (définit default_pattern et conv), default_style=guess
- si o est de la forme '--[no-]foo bar'
  klass = argument? ? Object : TrueClass, default_style=guess
  not_style=NoArgument; not_klass=FalseClass

  Attention: en fait le TrueClass n'est jamais activé, car o=TrueClass si l'argument est nil, mais alors le code `if a; default_pattern, conv = search(:atype, o) unless default_pattern` n'est pas lancé.
- si o est de la forme '--no-foo bar'/'--no-foo=bar',...
  not_klass = argument? ? Object : TrueClass (=> not_pattern, not_conv ... unless not_style), not_style=guess,
  klass=FalseClass, default_style=NoArgument

  Attention, ici default_style c'est pour 'no-foo' et no_style c'est pour 'foo'
  du coup ça fait essentiellement la même chose  que --[no-]foo donc je ne
  vois pas trop l'intérêt.
  Update: en fait à cause du 
        not_style = (not_style || default_style).guess(arg = a) if a
  not_style est défini que si il y a un argument, ie `opt.on("--no-foo")
  only gives the '--no-foo' switch, while `opt.on("--no-foo=arg") gives
  both '--no-foo' and '--foo'.

- si o est de la forme /-[a-e]/ => si arg: Object, guess; sinon: has_arg=true
    utilise [a-e] comme short option regexp
- si o=~/^-(.)(.+)?/ => NilClass, guess
- si o=~/^=/ => Object, *style*=guess
- sinon on considère que o est une description

Puis fallback:
- default_pattern, conv ||<= default_style.pattern
- if !(short.empty? and long.empty?)
    if has_arg and default_style == Switch::NoArgument
      default_style = Switch::RequiredArgument
    end
    s = (style || default_style).new(pattern || default_pattern,
                                       conv, sdesc, ldesc, arg, desc, block)
- elsif !block
    if style or pattern => error
    sinon s = desc
- else
    short << pattern
    s = (style || default_style).new(pattern, conv, nil, nil, arg, desc, block)
=> return s, short, long,
      (not_style.new(not_pattern, not_conv, sdesc, ldesc, nil, desc, block) if not_style), nolong

In summary: {{{2
  "=Required" => Required + Object
  "=[Opt] => Optional + Object
  "--foo ploum", "--foo=ploum" => Required + NilClass
  "--foo [ploum]" => Placed + NilClass
  "--foo[ploum]", "--foo=[ploum]"  => Optional + NilClass
  "--foo" => NoArgument + NilClass
  "--[no-]foo..." => guess(...) + Object|TrueClass (not: NoArgument + FalseClass)
  "--no-foo..." => NoArgument + FalseClass (not: guess(...) + Object|TrueClass)
    [attention, ici default_style c'est pour '--no-foo' et not style pour '--foo']
  "-s..." => guess(...) + NilClass
Rappels:
  - Object|TrueClass c'est suivant qu'il y ait un argument au --[no-]foo=...
  - guess:
    "" => self
    /\A=?\[/ => Switch::OptionalArgument
    /\A\s+\[/ => Switch::PlacedArgument
    else => Switch::RequiredArgument

Exemples:
- o.on("-f", "--foo=foo", "foo bar", Integer)
  Accepte un pattern et une fonction de conversion (lié à Integer)

- opts.on(/foo/, "desc") {|m| p m}
  => adds a 'match_nonswitch?' switch type; the corresponding description will be added to the banner (unless it is non empty), cf add_banner:
  `puts o.banner` => "Usage: pry [options] [desc]..." (for this to work we may need to reinitialize @banner via  `o.banner=nil`)
  + opts.parse("foo") will launch the block;
    in this block we can throw(:prune) to prune the arg and continue parsing; cf 'parse_in_order' below
  [warning: this does not work with a CompletingHash, strangely with a CompletingHash h={"foo"=>"foo"}, h.match("foo") works but h=~"foo" (which is what is used in match_nonswitch? does not works]

# on*, define*: {{{2
  def define(*opts, &block)
    top.append(*(sw = make_switch(opts, block)))
    sw[0]
  end
  alias def_option define
  def on(*opts, &block)
    define(*opts, &block)
    self
  end
  Et pareil pour define_head (top.prepend), on_head, define_tail (base.append),
on_tail


# Parsing: {{{1

Note that order and permute both have a :into keyword with automatically
affect the options into this keyword. order also accepts a block which is
called for non options.

parse_in_order: {{{2
  def parse_in_order(argv = default_argv, setter = nil, &nonopt)  # :nodoc:
    nonopt ||= proc {|a| throw :terminate, a} #que faire si un argument n'est pas une option
    argv.unshift(arg) if arg = catch(:terminate) {
      while arg = argv.shift
        case arg
        when /\A--([^=]*)(?:=(.*))?/m # long option
          opt, rest = $1, $2
          sw, = complete(:long, opt, true)
          opt, cb, val = sw.parse(rest, argv) {|*exc| raise(*exc)}
          val = cb.call(val) if cb
          setter.call(sw.switch_name, val) if setter

        when /\A-(.)((=).*|.+)?/m # short option
          eq, rest, opt = $3, $2, $1
          has_arg, val = eq, rest
          sw, = search(:short, opt)
          unless sw
            begin
              sw, = complete(:short, opt)
              # short option matched.
              # NDR: dans ce cas sw vient d'une regexp, ie un switch de la
              # forme -[a-e]. Si arg='-afoo', l'argument passé est alors tout 'afoo' et pas simplement 'foo'.
              val = arg.sub(/\A-/, '')
              has_arg = true
            rescue InvalidOption
              # if no short options match, try completion with long options.
              sw, = complete(:long, opt)
              eq ||= !rest
            end
          end
          opt, cb, val = sw.parse(val, argv) {|*exc| raise(*exc) if eq}
          ## ce cas n'arrive que dans le cas d'une option de type '-[a-e]'
          ## où le pattern associé au switch n'a rien matché du tout.
          raise InvalidOption, arg if has_arg and !eq and arg == "-#{opt}"
          ## ceci permet de faire marcher la concaténation des short
          ## options. Par ex '-i12c' => le -i interprète à
          ## cause de son accept regexp jusqu'au 12, et on unshift '-c' dans
          ## l'argv.
          argv.unshift(opt) if opt and (!rest or (opt = opt.sub(/\A-*/, '-')) != '-')
          val = cb.call(val) if cb
          setter.call(sw.switch_name, val) if setter

        # non-option argument
        else
          catch(:prune) do
            visit(:each_option) do |sw0|
              sw = sw0
              sw.block.call(arg) if Switch === sw and sw.match_nonswitch?(arg)
            end
            nonopt.call(arg)
          end
        end
      end

      nil
    }

    visit(:search, :short, nil) {|sw| sw.block.call(*argv) if !sw.pattern}
    # Permet de faire des actions à la fin du parsing:
    # => opts.on("test de null") {|m| puts "in null switch"; p m}
    # => opts.parse("foo"):
    #    in null switch
    #    nil
    #    ["foo"]
    argv
  end


## order, permute, parse {{{2
  def order(*argv, into: nil, &nonopt)
    argv = argv[0].dup if argv.size == 1 and Array === argv[0]
    order!(argv, into: into, &nonopt)
  end

  # rem: default_argv is ARGV
  # de plus dans parse_in_order, le &nonopt par défaut termine la boucle si
  # on tombe sur une nonopt.
  def order!(argv = default_argv, into: nil, &nonopt)
    setter = ->(name, val) {into[name.to_sym] = val} if into
    parse_in_order(argv, setter, &nonopt)
  end

  def permute(*argv, into: nil)
    argv = argv[0].dup if argv.size == 1 and Array === argv[0]
    permute!(argv, into: into)
  end

  def permute!(argv = default_argv, into: nil)
    nonopts = []
    order!(argv, into: into, &nonopts.method(:<<))
    argv[0, 0] = nonopts
    argv
  end

  ### parse, parse!
  # Parses command line arguments +argv+ in order when environment variable
  # POSIXLY_CORRECT is set, and in permutation mode otherwise.
  def parse(*argv)
    argv = argv[0].dup if argv.size == 1 and Array === argv[0]
    parse!(argv)
  end
  # Same as #parse, but removes switches destructively.
  # Non-option arguments remain in +argv+.
  def parse!(argv = default_argv)
    if ENV.include?('POSIXLY_CORRECT')
      order!(argv)
    else
      permute!(argv)
    end
  end

# Divers: {{{1

## Autoconf like options {{{2
in optparse/ac.rb, class OptionParser::AC < OptionParser enables autoconf
like options: 
 def ac_arg_enable(name, help_string, &block) => "--enable-foo", "--disable-foo"
 def ac_arg_disable(name, help_string, &block) => "--disable-foo", "--enable-foo"
 def ac_arg_with(name, help_string, &block) => "--with-foo", "--without-foo"

## module Arguable
=> Extends command line arguments array (like ARGV) to parse itself.
ie
array.extend(Arguable) va rajouter
.options[=], .order!, .permute!, .parse!, getopts
Par ex: def order!(&blk) options.order!(self, &blk) end
Et de plus @optparse;default_argv=self (et plus ARGV)

Note: ARGV is arguable by OptionParser
ARGV.extend(OptionParser::Arguable)

## getopts {{{2
Raccourci à la 'getopts' pour définir des options
Exemple:
  params = ARGV.getopts("ab:", "foo", "bar:", "zot:Z;zot option")
  params["a"] = true   # -a
  params["b"] = "1"    # -b1 [b: => b prend un argument]
  params["foo"] = "1"  # --foo
  params["bar"] = "x"  # --bar x
  params["zot"] = "z"  # --zot Z ['zot option' est la description de l'option]
=> optparse.getopts(array_to_parse, single_options, *long_options)
  def getopts(*args)
    argv = Array === args.first ? args.shift : default_argv
    single_options, *long_options = *args
    result = {}
    single_options.scan(/(.)(:)?/) do |opt, val|
      if val
        result[opt] = nil
        define("-#{opt} VAL")
      else
        result[opt] = false
        define("-#{opt}")
      end
    end if single_options
    long_options.each do |arg|
      arg, desc = arg.split(';', 2)
      opt, val = arg.split(':', 2)
      if val
        result[opt] = val.empty? ? nil : val
        define("--#{opt}=#{result[opt] || "VAL"}", *[desc].compact)
      else
        result[opt] = false
        define("--#{opt}", *[desc].compact)
      end
    end
    parse_in_order(argv, result.method(:[]=))
    result
  end

=end
