vim: ft=markdownlight

http://www.rubydoc.info/gems/yard/file/docs/GettingStarted.md
- Reference Tags: any docstring (or tag) that begins with "(see OTHEROBJECT)" will implicitly link the docstring or tag to the "OTHEROBJECT", copying any data from that docstring/tag into your current object.
Ex:
  # (see #ploum)
  # @note plam is better than ploum!
  def plim...

  # @param (see #clean)
  # @example
  #  activate("dams","Feanor")
  def activate(user, host, time = Time.now) end
- Linking Objects {...}
To link another "object" (class, method, module, etc.), use the format:
  {ObjectName#method OPTIONAL_TITLE}
  {Class::CONSTANT My constant's title}
  {#method_inside_current_namespace}
  {http://example.com Optional Title}
  {mailto:email@example.com}
  {file:docs/GettingStarted.md Getting Started}
  {file:mypage.html Name#anchor}
If you want to use a Hash, prefix the first { with "!": # !{ :some_key => 'value' }
- Embedding Docstrings {include:...}
  We saw the (see ...) syntax above, which allowed us to link an entire
  docstring with another. Sometimes, however, we just want to copy
  docstring text without tags. Using the same {...} syntax, but using the
  include: prefix, we can embed a docstring (minus tags) at a specific
  point in the text.
  # Here is an example of a highlighted Ruby file:
  # {include:file:examples/test.rb}
- Rendering Objects {render:...}
  = igLatinPay!
  This library adds pig latin methods to the string class, allowing you
  to transform sentences into pig latin.
  {render:String#pig_latin}
  You can also un-pig-latin-ify a word or sentence:
  {render:String#de_pig_latin}

http://www.rubydoc.info/gems/yard/file/docs/Tags.md#taglist

 @abstract description
 @api description
 @author description
 @deprecated description
 @example Optional title
   Code block
 @note description 
 @option name [Types] option_key (default_value) description 
 @overload method_signature(parameters)
   Indented docstring for overload method 
 @param name [Types] description 
 @raise [Types] description 
 @return [Types] description 
 @see name description 
 @since description 
 @todo description 
 @version description 
 @yield [parameters] description 
 @yieldparam name [Types] description 
 @yieldreturn [Types] description 
 @private
  Note: This method is not recommended for hiding undocumented or “unimportant” methods. This tag should only be used to mark objects private when Ruby visibility rules cannot do so. In Ruby 1.9.3, you can use private_constant to declare constants (like classes or modules) as private, and should be used instead of @private.

Directives:
 @!attribute [r | w | rw] attribute_name
   Indented attribute docstring 
 @!group description 
 @!endgroup 
 @!macro [attach | new] optional_name
   Optional macro expansion data 
 @!method method_signature(parameters)
   Indented method docstring 
 @!parse [language] code 
 @!scope class | instance 
 @!visibility public | protected | private 

============================================================
- yard doc [options] [source_files [- extra_files]]
-> .yardopts: #add these options automatically
--markup markdown -M kramdown --title "~rubylib Documentation" --protected --private --output-dir yardoc
-> The extra files can be provided by .document:
  - 
  ChangeLog.md
  LICENSE.txt

-M/--markup-provider: by default yard look at (in order)
redcarpet/rdiscount/kramdown/bluecloth/Mauku/rpeg-markdown/rdoc

- yard graph | dot -Tpng > graph.png
- yardoc #shortcut for yard doc
- yard diff #diff gems

In Rakefile:
require 'yard'
YARD::Rake::YardocTask.new do |y|
  y.options.push "-o", "yardoc"
  y.options.push "--markup-provider", "kramdown"
  y.options << '--legacy' #prevents this bug in ruby 2.2: https://bugs.ruby-lang.org/issues/10693
end
task :doc => :yard
#but using yardopts is better since it works with yardoc and not only rake doc

- yard gems thor #=> set up yard ri cache (binary yri):
cat ~/.yard/yri_cache (cache of yri calls done)
Thor /home/dams/opt/pkgmgr/gems/gems/thor-0.19.1/.yardoc
[there is currently no way to ask for the yard doc to be built too, use the
server for that]

- yard documentation for gem:
yard config --gem-install-yri / --gem-install-yard
will configure ~/.gemrc to have the option
    gem: "--document=yri/yard"
(yard includes yri)
You can also add the following to your .gemspec to have YARD document your gem
on install:
    spec.metadata["yard.run"] = "yri" # use "yard" to build full HTML docs.
=> 'gem install --document true ploum' will run yri
=> 'gem install --document rdoc ploum' will run yri+rdoc
=> 'gem install --document yard ploum' will run yri+yard

yard server --gems
  Launch a web server that will autogenerate the documentation when clicking on a gem
  The documentation is in ~gemsdoc (=~gemsdir/doc)
  (the server only generates the .yardoc cache, the html files seems to be
  generated dynamically).

  From the source code: if the gem folder is not writable, YARD will write the yardoc file to `~/.yard/gem_index/NAME-VERSION.yardoc. Yard also looks at ~gems/name/.yardoc, not only at ~gemsdoc/name/.yardoc

- rdoc:
rdoc --ri to generate ri output in ~/.rdoc
rdoc -o rdoc #outputs to rdoc/ rather than doc/
-> firefox rdoc/index.html
ri Pathname #access ri information about Pathname
yri Pathname #yard ri

Generate ri on all gems (add --rdoc to generate rdoc too):
gem rdoc --all
gem rdoc --all --overwrite

- options:
as a gem hook (cf rubygems/hook.rb) if '.yardopts' do not exist, then yard
adds '@spec.require_paths - @spec.extra_rdoc_files' to the command line.
In all case, yard also looks at .yardopts and .document

Files
-----
~/.yard/yri_cache
yard gems -> .yardoc in the gem folder
More precisely yri looks at 
~/.yard/gem_index/gem_names.yardoc #in case the ~gems folder is not user writable
~/.yard/gem_index/gem_names/.yardoc
~gemsdir/doc/gem_names/.yardoc
~gems/gem_names/.yardoc
