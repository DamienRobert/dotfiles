vim: foldmethod=expr ft=markdownlight
A very exhaustive list: http://awesome-ruby.com/
Another exhaustive list, gems and books and blogs: https://github.com/dreikanter/ruby-bookmarks
Ruby compilers/lint list: https://github.com/planetruby/awesome-rubies

# Concurrency
+ https://github.com/ruby-concurrency/concurrent-ruby
   Modern concurrency tools for Ruby. Inspired by Erlang, Clojure, Scala, Haskell, F#, C#, Java, and classic concurrency patterns. 
   +Atomic updates
  Note: thread_safe, atomic was merged into concurrent-ruby
+ https://github.com/socketry/async
  A lightweight celluloid; used by rubydns
  falcon — A rack compatible server built on top of async-http.
- Promises: https://github.com/lgierth/promise.rb
  Lightweight implementations of promises following the spec https://promisesaplus.com/
  Nice to see the code
- https://github.com/celluloid/celluloid
  Heavier than concurrent-ruby, but more integrated to the ruby object
  model (can call methods directly rather than pass messages)
- https://github.com/eventmachine/eventmachine
  Older than celluloid
  https://github.com/igrigorik/em-synchrony
  Event machine+fibers, cf https://www.igvita.com/2010/03/22/untangling-evented-code-with-ruby-fibers/
+ https://github.com/hamstergem/hamster
  Efficient, *Immutable*, Thread-Safe Collection classes for Ruby
- https://github.com/grosser/parallel
  Ruby: parallel processing made simple and fast

# Développement
- https://github.com/ffi/ffi
  Ruby-FFI is a ruby extension for programmatically loading dynamic libraries, binding functions within them, and calling those functions from Ruby code.
  [but see also dl in the standard library:
  http://www.ruby-doc.org/stdlib-2.0/libdoc/dl/rdoc/DL.html
  For ruby 2.0+ dl is deprecated for fiddle, a wrapper around libffi:
  http://www.ruby-doc.org/stdlib-2.0/libdoc/fiddle/rdoc/Fiddle.html]
- backport: https://github.com/marcandre/backports
  backport newer ruby features to older rubies
- https://github.com/mvz/gir_ffi
  Auto-generate bindings for GObject based libraries at run time using FFI http://wiki.github.com/mvz/gir_ffi

# Debugging
+ pry: pry pry-doc pry-editline
       pry-byebug pry-rescue pry-stack_explorer pry-self
- https://github.com/ko1/pretty_backtrace
  Pretty your exception backtrace.
- https://github.com/banister/binding_of_caller
  Retrieve the binding of a method's caller in MRI 1.9.2+
  (used by byebug)
- http://rubular.com/
  Rational expression editor
+ https://github.com/ruby-prof/ruby-prof
  Ruby profiler compiled as a C extension. Faster and with more features
  than the standard profiler (which can be invoked via
  ruby -rprofile example.rb, cf
  https://ruby-doc.org/stdlib-2.4.0/libdoc/profiler/rdoc/Profiler__.html)
- https://github.com/jeremyevans/ruby-warning
  Add custom processing for warnings

List of profilers/tracers:
https://jvns.ca/blog/2017/12/17/how-do-ruby---python-profilers-work-/
- https://github.com/tmm1/rbtrace like strace, but for ruby code
- ruby-prof
- https://github.com/tmm1/stackprof a sampling call-stack profiler for ruby
- rbspy https://rbspy.github.io/: sampling call-stack profiler; difference
  with stack prof is that it is used via the command line rather than by
  adding ruby code, and can attach to a running pid

# Docs
+ rdoc, yard
- sdoc (generate searchable html from rdoc)
Web documentation:
- http://ruby-doc.org/ #official documentation
- https://www.omniref.com/
  Ex: https://www.omniref.com/ruby/2.2.0/files/vm_args.c?#annotation=4088663&line=471 (Why blocks make Ruby methods 439% slower)
- http://apidock.com/
- http://devdocs.io/ruby/

# Style
- https://github.com/bbatsov/rubocop
  RuboCop is a Ruby static code analyzer. Out of the box it will enforce many of the guidelines outlined in the community Ruby Style Guide.
- A gem to detect slow idioms: https://github.com/DamirSvrtan/fasterer
  Inspired by how to write fast ruby: https://github.com/JuanitoFatas/fast-ruby

# Testing
Minitest
--------
- http://blog.arvidandersson.se/2012/03/28/minimalicous-testing-in-ruby-1-9
Minitest remplace 'test-unit'

Minitest Plugins
----------------
! https://github.com/CapnKernul/minitest-reporters
Pour avoir plus de formats de sortie
+ https://github.com/grosser/maxitest
Minitest + all the features you always wanted.
mtest test/ploum.rb:10
- https://github.com/davetron5000/clean_test
Un micro dsl pour minitest (est-ce nécessaire vu qu'on a minitest/spec?)
-> Given, When, Then
- https://github.com/rizzatti/minitest-ansi
Colorize your minitest output [not working with minitest 5]
- https://github.com/splattael/minitest-around
Around block for minitest.
- https://github.com/sobrinho/minitest-colorize
Colorize MiniTest output and show failing tests instantly
(Older than minitest-ansi)
- https://github.com/seattlerb/minitest-debugger
Wraps assert so failed assertions drop into the ruby debugger
(I prefer to use pry-rescue)
- https://github.com/stefanozanella/minitest-filesystem
Minitest extension for testing filesystem contents
- https://github.com/mceachen/minitest-great_expectations
Generally useful additions to minitest's expectations
+ https://github.com/mptre/minitest-implicit-subject
Implicit declaration of the test subject.
    describe Object do
      it 'defines the subject implicitly' do
        subject.must_equal Object
      end
    end
- https://github.com/wojtekmach/minitest-metadata
Annotate tests with metadata (key-value)
- https://github.com/adammck/minitest-stub-const
Stub constants for the duration of a block in MiniTest.
- mini_backtrace
MiniBacktrace allows you to take advantage of the Rails.backtrace_cleaner when using MiniTest.

Others
------
rspec: rspec-core rspec-expectations rspec-mocks
cucumber, aruba #tests en langage naturel (Aruba is Cucumber extension for testing command line applications)

minispec: https://github.com/sleewoo/minispec
 nice spec like assertions

# Ruby Parsers
- https://github.com/seattlerb/ruby_parser
  ruby_parser (RP) is a ruby parser written in pure ruby (outputs sexp)
- https://github.com/seattlerb/ruby2ruby
  ruby2ruby provides a means of generating pure ruby code easily from RubyParser compatible Sexps.
- https://github.com/quix/live_ast
  LiveAST enables a program to find the ASTs of objects created by dynamically generated code
  RubyParser is the default parsing engine. To replace it with Ripper, gem install live_ast_ripper and then require 'live_ast_ripper'
  The advantage of RubyParser is that it gives the traditional ParseTree sexps used by tools such as ruby2ruby. The disadvantage is that the newer Ruby 1.9 syntax is not supported. However the 1.8 syntax restriction only applies to files from which ASTs are actually requested. All other files may use 1.9 syntax.
=> Example of usage in
https://github.com/leemachin/node_module
where one can transform a method as the 'private/public' keywords:
  node_module :meaning_of_life #after method definition
  node_module; def foo...; def bar ...; #change all subsequent methods
  node_module def method # stuff end #change one method
- https://github.com/ngty/sourcify
  Workarounds before ruby-core officially supports Proc#to_source (& friends)
  (ParseTree is great, it accesses the runtime AST (abstract syntax tree) and makes it possible to convert any object to ruby code & S-expression, BUT ParseTree doesn't work for 1.9.* & JRuby.
  RubyParser is great, and it works for any rubies (of course, not 100% compatible for 1.8.7 & 1.9.* syntax yet), BUT it works only with static code.
  => Sourcify, a unified solution to extract proc code. When ParseTree is available, it simply works as a thin wrapper round it, otherwise, it uses a home-baked ragel-generated scanner to extract the proc code.)
- http://ruby-doc.org/stdlib-2.0/libdoc/ripper/rdoc/Ripper.html
  Ripper to access the ruby parser directly from ruby
- http://rubystuff.org/ruby-internal/
  Ruby-internal is Ruby module that provides direct access to Ruby's (MRI or YARV) internal data structures. 

# Other rubies
- rubinius http://rubini.us/
- jruby
- mruby
- opal (ruby to javascript, used by Volt [Volt is an exciting new Ruby
  framework that runs on the front and back end]), rubyfire (for writting
  frontends in ruby). cf http://astonj.com/tech/ruby-is-about-to-get-red-hot-again/
- http://ruboto.org/
  Ruby on android
- mruby: http://matt.aimonetti.net/posts/2012/04/25/getting-started-with-mruby/
  -> https://github.com/xxuejie/webruby
     This project brings mruby to the browser. It uses emscripten to compile the mruby source code into JavaScript and runs in the browser.
  -> http://kripken.github.io/emscripten-site/
     Emscripten is an LLVM-based project that compiles C and C++ into highly-optimizable JavaScript in asm.js format.
  -> http://asmjs.org/faq.html
- https://github.com/topazproject/topaz
  ruby in python
# Extension libraries
## Core extensions
+ Active Support (from rails)
  https://github.com/rails/rails/tree/master/activesupport
  cf: hash deep_merge, timezone in Time
  http://blog.arkency.com/2015/02/my-favorite-activesupport-features/
+ Facets
  https://github.com/rubyworks/facets
  cf: memoization, lazy support
+ https://github.com/flori/tins
  des mini trucs
- https://github.com/jirutka/corefines
  A collection of refinements for Ruby core classes with a compatibility mode for older Rubies and a convenient syntactic sugar.
  (How to replace refinements by include for other rubies, may be interesting for my own refinements)
- https://github.com/bbatsov/powerpack
  Some useful extensions to the core Ruby classes
- https://github.com/irongaze/iron-extensions
  Des extensions

## DSL
- https://github.com/irongaze/iron-dsl
  Gem providing better tools for DSL creation in Ruby
  Une class DSLProxy qui permet de faire des trucs comme
  ploum.instance_eval mais où on peut appeler les méthodes (et variables)
  du self originel, pas seulement celles de ploum
- https://github.com/ms-ati/docile
  Docile keeps your Ruby DSLs tame and well-behaved

## C extensions
- https://github.com/banister/include_complete
  Des rajouts dans le modèle objet de ruby
  (genre include_complete pour rajouter les singleton methods
  + cf les liens pour d'autres extensions comme local_eval, gen_eval,
    dup_eval qui permettent aussi d'évaluer les méthodes du self originel
  - Object2module is one of a series of experimental libraries that mess with the internals of Ruby to bring new and interesting functionality to the language, see also:
  - Remix - Makes ancestor chains read/write
  - Include Complete - Brings in module singleton classes during an include. No more ugly ClassMethods and included() hook hacks.
  - Prepend - Prepends modules in front of a class; so method lookup starts with the module
  - GenEval - A strange new breed of instance_eval
  - LocalEval - instance_eval without changing self)

## Dynamic extensions
- https://github.com/ConradIrwin/lspace
  Dynamic scoping
- https://github.com/saturnflyer/casting
   Add behavior to your objects without using extend
   (ça marche comme un delegate:
    To use proper delegation, your approach should preserve self as a reference to the original object receiving a method. When the object receiving the forwarded message has its own and separate notion of self, you're working with a wrapper (also called consultation) and not using delegation.
    En pratique ça utilise le fait que dans ruby2.0 on peut appliquer une unbound method d'un module à n'importe quel objet, d'où la possibilité de faire un vrai delegate en appliquant les objets de la classe déléguée au self actuel)
- https://github.com/txus/traitor
  Traits in ruby2.0 using refinements
- https://github.com/nicknovitski/modifiers
  https://github.com/michaelfairley/method_decorators
  Method decorators a la python
- https://github.com/akitaonrails/chainable_methods
  The most complete implementation of an Elixir/F#-like "Pipe" for Ruby in the form of "chainable methods"
  ~~~ ruby
  include Nokogiri
CM("foo bar http://github.com/akitaonrails/chainable_methods foo bar")
  .URI.extract
  .first
  .URI.parse
  .HTTParty.get
  .HTML.parse
  .css("H1")
  .text
  .unwrap
  ~~~

## Langage Extensions
- Easy way to add hooks (ie callback)
  https://github.com/apotonick/hooks
- Easy way to add aliases:
  http://tagaholic.me/alias/ -> http://tagaholic.me/alias/doc/index.html
  gem install alias
- https://github.com/egonSchiele/contracts.ruby
  Type Annotations
- Pattern matching:
  https://github.com/katafrakt/noaidi
  https://github.com/k-tsj/pattern-match
- @python decorations
  https://gist.github.com/wycats/144883 cf http://yehudakatz.com/2009/07/11/python-decorators-in-ruby/
  https://gist.github.com/yugui/1724
  https://github.com/michaelfairley/method_decorators
- https://github.com/vizvamitra/patme
  Elixir-style pattern matching for ruby methods
- concerns: http://api.rubyonrails.org/classes/ActiveSupport/Concern.html
  included hooks for modules
- https://github.com/bolshakov/fear
  Ruby port of some Scala's monads [+see the links for other monads implem]
- https://github.com/k-tsj/pattern-match
  Pattern matching (similar to ml pattern matching)
  See: https://code.google.com/p/tokland/wiki/RubyTextProcessing
+ https://github.com/dry-rb/dry-monads/
  => Use continuations to have a do notation: https://dry-rb.org/gems/dry-monads/do-notation/

## RubyWorks
En plus de facets, cf les modules suivants qui étaient dans facets 2.0:
- https://github.com/rubyworks/hashery
  Facets Hashery Collection of Hash-based classes
- https://github.com/rubyworks/mixers
  Ruby Mixers is collection mixin modules for the Ruby programming language.
Autres modules:
- https://github.com/rubyworks/yard-notes
  Add ALL-CAPS tags to your doumentation. For example:
    @TODO Need to refactor this code.
  The use yard as usual but add the --plugin notes command line option.
- https://github.com/rubyworks/reusing
  Reusing allows for the use of refinements directly from an extension file.
+ https://github.com/rubyworks/ansi
  Set of ANSI Code based classes for Ruby
- https://github.com/rubyworks/clik
  CLI.K stands for Command Line Interface in the Kernel. It provides a very simple cli method for parsing command line options.
- https://github.com/rubyworks/autoreload
  Automatic Library Reloading
+ https://github.com/rubyworks/yaml_command
  YAML Command is a command line tool for working with YAML files.
- https://github.com/rubyworks/platypus
  Platypus provides a generalized type conversion system, method overloading and pseudo-classes for the Ruby programming language.
- https://github.com/rubyworks/ostruct2
  OStruct2 is a reimplementation of Ruby's standard ostruct.rb library. This new OpenStruct class addresses issues the original has with conflicting member names and cloning.
- https://github.com/rubyworks/instance
  Slick Object Instance API 
  Similar to the 'self' gem: https://github.com/ConradIrwin/self
- https://github.com/rubyworks/proutils
  ProUtils is a set of utility methods design primarily for project development.
+ https://github.com/rubyworks/erbside
  Inline ERB templating tool

## Janlelis
- https://github.com/janlelis/sugar_refinery (was zucker)
  Collection of Ruby Refinements
- https://github.com/janlelis/debugging
  Improve your Print Debugging
- https://github.com/janlelis/procstar
  This gem provides to_proc implementations for other Ruby classes than just Symbol.
- https://github.com/janlelis/ruby_info
  RubyInfo | Better than SCRIPT_LINES__ (define accessors for all ruby info constants)
- https://github.com/janlelis/ruby_version
  RubyVersion | Better than RUBY_VERSION
- https://github.com/janlelis/ruby_engine
  RubyEngine | Better than RUBY_ENGINE

# Collections
+ Hashie: https://github.com/intridea/hashie
  Nice improvements to Hash
- https://github.com/danielsdeleo/deep_merge
    Deep Merge is a simple set of utility functions for Hash. It permits you to merge elements inside a hash together recursively. The manner by which it does this is somewhat arbitrary (since there is no defining standard for this) but it should end up being pretty intuitive and do what you expect.
    (Très complet)
+ https://github.com/hamstergem/hamster
  Efficient, Immutable, Thread-Safe Collection classes for Ruby
- https://github.com/pitr-ch/algebrick
  Typed structs on steroids based on algebraic types and pattern matching.
- https://github.com/evolve75/RubyTree
  A General Purpose Tree Data Structure for Ruby
- https://github.com/dgopstein/deep_enumerable
 A library for manipulating nested collections in Ruby

# Files
- Pathname, FileUtils (in stdlib)
- http://www.ruby-doc.org/stdlib-2.0.0/libdoc/mkmf/rdoc/MakeMakefile.html#method-i-find_executable
- https://github.com/djberg96/ptools
  The ptools (power tools) library is an additional set of commands for the
  File class based on Unix command line tools.
  File.which("ruby")         # '/usr/local/bin/ruby'
  File.whereis("ruby")       # ['/usr/local/bin/ruby','/opt/bin/ruby']
  File.head("myfile")        # Returns first 10 lines of 'myfile'
  File.tail("myfile",3)      # Returns last 3 lines of 'myfile'
  File.wc("myfile",'words')  # Returns the number of words in 'myfile'
  File.touch("newfile")      # "newfile" now exists
  File.null                  # '/dev/null' on Unix, 'NUL' on Windows
  File.binary?('some_file')  # true or false
  File.sparse?('some_file')  # true or false
  File.nl_convert("myfile", "newfile", "dos") # Creates a copy of 'myfile' called 'newfile', in DOS format

- https://github.com/guard/guard
  Guard is a command line tool to easily handle events on file system modifications (Ex: running tests on file change)

# Input/Output
+ unicode gems for true unicode normalisation, capitalisation, etc
  (ruby String#capitalize only capitalize ascii letters)
  See also https://bibwild.wordpress.com/2013/11/19/benchmarking-ruby-unicode-normalization-alternatives/
  for other unicode gems

Template:
+ kramdown
+ https://github.com/jeremyevans/erubi
  (More modern version of erubis)
+ https://github.com/genki/erubis
- https://github.com/soveran/mote
  Minimum Operational Template, similar to mustache
- https://github.com/rtomayko/tilt
  Generic interface to multiple Ruby template engines

Color:
+ https://github.com/janlelis/paint
  Pour la couleur dans les strings
- https://github.com/sickill/rainbow
- https://github.com/flori/term-ansicolor

Tty utils: https://piotrmurach.github.io/tty/
eg: https://github.com/piotrmurach/tty-prompt
    A beautiful and powerful interactive command line prompt.

Table output:
+ https://github.com/cldwalker/hirb
- https://github.com/arches/table_print
- https://github.com/visionmedia/terminal-table

Reporting output:
- https://github.com/wbailey/command_line_reporter
- https://github.com/JEG2/highline (ask and say)
- [There is also input/output support in Thor]

Syntax highlighting: rouge (compatible with python's pygments, should
contains all of CodeRay features), CodeRay [more up to date than the 'syntax' gem]
Curses: https://github.com/ruby/curses (formerly part of ruby stdlib)

Pdf: 
+ https://github.com/gettalong/hexapdf
  HexaPDF is a pure Ruby library with an accompanying application for working with PDF files.
- prawn http://www.yoniweisbrod.com/generating-complex-pdf-documents-in-rails-with-prawn/ [or use kramdown's prawn output to generate pdf]
- http://fullscreen.github.io/squid/: Ruby library to plot charts in PDF files

- rb-readline: ruby implementation of readline
  Tutorial: http://bogojoker.com/readline/
- rawline: readline in ruby with more features

# Multimedia
- https://rubygems.org/gems/mini_magick
  A ruby wrapper for ImageMagick or GraphicsMagick command line.
- exifr: read exif data

# Spawning process

Stdlib: Process.spawn (alias spawn), IO.popen (alias open |), IO.pipe,
Open3.capture3

Docs:
- http://zhangxh.net/programming/ruby/6-ways-to-run-shell-commands-in-ruby/
- http://www.shanison.com/2010/09/01/ruby-capture-output-in-realtime/
- http://ku1ik.com/2010/09/18/open3-and-the-pid-of-the-spawn.html
- http://stackoverflow.com/questions/12189904/fork-child-process-with-timeout-and-capture-output

Gems:
+ https://github.com/thoughtbot/cocaine
  Un équivalent de system("ploum") mais avec des strings qui peuvent être
  interpolés, avec escape pour que ça se passe bien
  Utilise https://github.com/thoughtbot/climate_control
  pour changer une variable d'environnement dans un block
- https://github.com/jarib/childprocess
  ChildProcess est un wrapper pour lancer des process
  ~~~ ruby
  r, w = IO.pipe
  proc = ChildProcess.build("cat", "foo")
  proc.io.stdout = proc.io.stderr = w
  proc.start
  proc.wait
  w.close
  p r.read #=> "test\n"
  ~~~
- https://github.com/rtomayko/posix-spawn
  pour une implémentation qui utilise posix-spawn
- https://github.com/ahoward/systemu
  comme open3 mais sans pipe ou thread
- https://github.com/opscode/mixlib-shellout
  un moyen facile de récupérer stdout/stderr, qqs support de stdin (mais moins puissant que popen)

# Configuration Files

+ cf Hashie below (in particular Hashie::Mash)

+ https://github.com/mbklein/confstruct
  Confstruct is yet another configuration gem. Definable and configurable
  by hash, struct, or block, confstruct aims to provide the flexibility to
  do things your way, while keeping things simple and intuitive.

- https://github.com/binarylogic/settingslogic
  Settingslogic is a simple configuration / settings solution that uses an
  ERB enabled YAML file

- https://github.com/infochimps-labs/configliere
  Wise, discreet configuration for ruby scripts: integrate config files,
  environment variables and command line with no fuss

- http://planetruby.github.io/gems/props.html
  Read INI files

- nenv: nice DSL wrapper around ENV

# Options and commands
Refs: http://www.awesomecommandlineapps.com/gems.html
http://blog.excelwithcode.com/build-commandline-apps.html
http://www.ict4g.net/adolfo/notes/2015/01/05/ruby-command-line-parsers.html

Ont l'air intéressant:
+ https://github.com/gettalong/cmdparse
+ https://github.com/cldwalker/boson
+ https://github.com/davetron5000/methadone
+ https://github.com/davetron5000/gli
+ https://github.com/injekt/slop
Notes: cmdparse and gli both accepts subcommands.
  - cmdparse has a saner api (do not wrap optparse too much) but a command
  can not have both a subcommand and an action block. Likewise a default
  subcommand is called only if there are no arguments remaining.
  - gli does not have these problems, however the help info does not print
    the subcommand (and is much less nice)

- https://github.com/ahoward/main/

Pas mal utilisés
- http://trollop.rubyforge.org/
- https://github.com/wycats/thor

Facile à comprendre:
- https://github.com/florianpilz/micro-optparse
- commander [does not support subcommands], trollop [inactive]
- https://github.com/janlelis/rationalist
  require 'rationalist'
  argv = Rationalist.parse(ARGV)
  p argv
  
  $ ruby example/parse.rb -a beep -b boop
  {:_=>[], :a=>"beep", :b=>"boop"}

Nice concept (Uses http://docopt.org/ to infer the options from the help
message):
- https://github.com/DannyBen/runfile

- https://github.com/Roman2K/metacli
  get command and options directly from the class methods

# Deployment
- https://github.com/nadarei/mina
- capistrano: http://capistranorb.com/2013/06/01/release-announcement.html

# Interaction and binaries
+ https://github.com/minad/iruby
  iruby notebook, like the similar ipython notebook that run on a navigator
  cf: http://google-opensource.blogspot.fr/2015/01/google-summer-of-code-wrap-up-sciruby.html
  http://nbviewer.ipython.org/github/minad/iruby/blob/master/IRuby-Example.ipynb
  https://github.com/sciruby-jp/rubydown pure-Ruby R Markdown clone
- https://github.com/ConradIrwin/showterm
  Showterm lets your record a terminal session exactly as you experience it, right down to the syntax highlighting.
+ https://github.com/tombenner/ru
  Ruby in your shell!
+ see yaml_command above

# Web
See web/applications for web frameworks

+ http.rb: https://github.com/httprb/http
  Much better than Net::HTTP https://twin.github.io/httprb-is-great/
+ https://github.com/lostisland/faraday
  Simple, but flexible HTTP client library, with support for multiple backends.
  [has more features than httparty]
+ https://github.com/ioquatix/rubydns
  Ruby DNS server
  [For a Ruby DNS resolver, see http://ruby-doc.org//stdlib-2.0/libdoc/resolv/rdoc/Resolv/DNS.html
  https://www.omniref.com/ruby/2.1.1/symbols/Resolv
  Cf: https://coderrr.wordpress.com/2007/12/06/backgrounding-tasks-in-rails-with-threads-and-using-resolv-replace-to-make-them-faster/]
+ https://github.com/allcentury/classy_json
  Turns a json response to an object
+ https://github.com/ipaddress-gem/ipaddress
  A library to handle IP (both IPv4 and IPv6) addresses in a modern and productive way.
- https://github.com/rafalchmiel/crib
  A dynamic way of exploring and packaging REST APIs.
- http://taylor.fausak.me/2015/02/19/announcing-stoplight-a-ruby-circuit-breaker/
- https://github.com/savonrb/savon
  SOAP client

# Web api
- https://github.com/huydx/facy
  command line power tool for facebook
- https://github.com/gmailgem/gmail
  A Rubyesque interface to Gmail, with all the tools you'll need.
- https://github.com/kenpratt/wikipedia-client
  Ruby client for the Wikipedia API

# Graphs
- Ruby gnuplot bindings: https://github.com/rdp/ruby_gnuplot
- Nyaplot (from sciruby): https://github.com/domitry/nyaplot
- Gruff (graphing library): https://github.com/topfunky/gruff
- Rubyvis (visualisation toolkit): https://github.com/clbustos/rubyvis
? https://github.com/dcadenas/depgraph
  A Ruby tool to create dependency graph images from any kind of file

# Multimedia
- https://github.com/streamio/streamio-ffmpeg
  Simple yet powerful ruby ffmpeg wrapper for reading metadata and transcoding movies
- https://github.com/d-theus/vncrec-ruby
  VNCRec is a gem that provides you tools to record VNC session.
- https://github.com/jedcn/reveal-ck
  a command line tool that helps you author reveal.js presentations.
- https://github.com/ConradIrwin/showterm
  The rubygem to upload to http://showterm.io

# File formats
- docx:
  https://github.com/chrahunt/docx
  a ruby library/gem for interacting with .docx files
  https://github.com/trade-informatics/caracal/
  Caracal is a ruby library for dynamically creating professional-quality Microsoft Word documents (.docx). [Note: caracal is write only]
- https://github.com/ConradIrwin/gpg-decoder
  A port of the awesome ASN.1 Javascript Decoder for GPG messages
- https://github.com/joshbuddy/jsonpath
  Ruby implementation of http://goessner.net/articles/JsonPath/

# Api
+ ruby-dbus: Ruby D-Bus is a pure Ruby library for writing clients and services for D-Bus.
+ https://github.com/splattael/libnotify
  Ruby bindings for libnotify using FFI.
- https://github.com/sosodev/kinchan
  Composable browser automation with Ruby (wrapper around selenium)

# Divers
- https://github.com/ruport/ruport
  Ruby Reports : Making your reporting life suck less, through Ruby

# Scientific

+ https://github.com/jekyll/classifier-reborn
A general classifier module to allow Bayesian and other types of classifications. A fork of cardmagic/classifier. https://www.classifier-reborn.com
+ Scientific ruby: http://sciruby.com/
- tensorflow: https://github.com/somaticio/tensorflow.rb
  https://medium.com/@Arafat./introducing-tensorflow-ruby-api-e77a477ff16e
- https://github.com/jedld/tensor_stream
  A ground-up and standalone reimplementation of TensorFlow for ruby. Comes with a pure ruby and OpenCL opcode evaluator
