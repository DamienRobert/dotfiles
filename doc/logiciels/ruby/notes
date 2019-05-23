# vim: foldmethod=marker ft=markdownlight
- For a pretty complete spec of ruby, see the one on core ruby by Rubinius here:
https://github.com/rubinius/rubinius/tree/master/spec/ruby
- Style guide: https://github.com/bbatsov/ruby-style-guide#no-explicit-return
- ruby keywords: http://ruby-doc.org/docs/keywords/1.9/
  BEGIN   END   __ENCODING__   __END__   __FILE__   __LINE__   alias   and
  begin   break   case   class   def   defined?   do   else   elsif   end
  ensure  false   for   if   in   module   next   nil   not   or   redo
  rescue  retry   return   self   super   then   true   undef   unless
  until   when    while   yield

# Ruby scripts:
# Verbose output in ruby {{{1

Problem: #!/usr/bin/env ruby -w
does not work because env tries to launch 'ruby -w'.
Solution: #!/usr/bin/env ruby
BEGIN {$VERBOSE=true}
ou
# #!/bin/sh
exec ruby -x "$0" "$@"
#!ruby -w
... ruby script goes here
# Begin/End/Data {{{1
Un programme ruby peut avoir des blocks
BEGIN{} et END{} qui sont executés au lancement dans l'ordre (resp à la fin
du programme dans l'ordre inverse). Enfin après __END__ la constante DATA
pointe à ce qu'il y a (c'est juste un seek de __FILE__)

at_exit(&block): is exectued when the program exit
the blocks are exectued in the reverse order of registration
ie at_exit est comme END{}, mais c'est un END dynamique; et les at_exit et
END sont interleavés dans l'ordre inverse de leur définition

~~~ ruby
class Ploum
def <<(n)
  @a+=n
  return self
end

Ploum.new(0)<<1<<2<<3

File.open("ploum") do |file|
end
Or
File.foreach("ploum") do |line|
end

Block comments:
=begin
=end

BEGIN {
begin code
}

END {
end code
}

cat << EOF
cat << 'EOF'
cat <<- EOF

__END__
Everything after is stored in DATA
About DATA… I just discovered that it is just a File associated with the
current script opened for reading and “seeked” after __END__.
~~~

Exit a program:
exit #process the at_exit block. Simply raises a SystemExit exception
exit(1) #exit return code
exit! #exit immediatly
abort "Nooo" #print the message to STDERR and exit
raise "foo" / fail "foo" #simply raise an uncatached exception
(note: fail is an alias to raise, but is used to show that we explicitely
don't expect the exception to be caught)

# require/load/autoload {{{1
see: https://practicingruby.com/articles/ways-to-load-code
autoload :Command, 'module_to_load/command' #will do a require when Command is first invoked
load "file.rb" vs require "file" #requires only load once

Note: load/require load the file with an empty Module.nesting and self=main
even inside a function or a module. So constants, global variables and main
instances variables are propagated, but not local variables
But for load you can do load("file.rb",true) and it will wrap the loaded
file in an anonymous module:
~~~ ruby
def fake_load(file,bool=false)
#note unlike load, fake_load propagates local variables
  if bool
    Module.new.module_eval(File.read(file))
  else
    eval File.read(file)
  end
  true
end
~~~
With load "file.rb", true, then we only get side effects, the defined
functions are lost in the anonymous module

Finally, when using 'require' (not 'load'), ruby put the required file in
$LOADED_FEATURES (only after the file has been required, the required file
won't see its name in $LOADED_FEATURES)

On require_relative: http://stackoverflow.com/questions/3672586/what-is-the-difference-between-require-relative-and-require-in-ruby
(note to explicitely require a relative file, require './foo' works too)

Exemple pour récupérer les fonctions d'un fichier ruby dans un module:
m=Module.new
m.singleton_class.module_eval(File.read("config.rb"))

# LOAD_PATH: {{{1
~~~ ruby
load_path_to_add="#{ENV['HOME']}/mine/ruby/lib"
$LOAD_PATH << load_path_to_add unless $LOAD_PATH.include?(load_path_to_add)
~~~
#}}}1

# Basic syntax:
# local variables and methods {{{1
In ruby, 'ploum' means the method 'ploum' (ie self.ploum) except if there
is a local variable that was set (this is syntaxic). If there is both
a local variable and a method, to get the method use 'ploum()'.
~~~ ruby
def foo; "in foo"; end
foo=0 if nil
foo #=>nil, because the ruby parser see the 'foo=' so creates the local variable foo=nil, even if the 'foo=0' is never executed, as shown by Kernel#local_variables
#In particular this explain the following:
zorglub=zorblug #=> nil
~~~
'ploum=foo' always set a local variable, to get access to a setter one
needs to do 'self.ploum=foo'

Instances variables and global variables are automatically set to nil if
they were not set
@foo, $foo => nil
While unset local variables, class variables or constants gives an error

Inline method definition:
def foo; "foo"; end
def foo; "foo" end
def foo() "foo" end

Rem: since ruby 2.1, def foo; plam; end is an expression that returns :foo.
This allows to do things like method_modifier def foo...
where method_modifier takes a symbol to replace a method!
# Unused variables {{{1
In ruby starting a local variable with _ is a hint that it won't be used.
~~~ ruby
l=->(x,x) {x}
SyntaxError: (eval):2: duplicated argument name
l=->(_x,_x) {_x}
l.call(2,3) #=>2
~~~
Usually unused variables are juste called '_', but we may want to explain
what they are :'_foo'
http://stackoverflow.com/questions/9559561/where-and-how-is-the-underscore-variable-specified

# public/protected/private/module_function {{{1
In a Module/Class, can be called in its own to change all future def, or
just to change locally:
~~~ ruby
module_function
def foo...

module_function def foo ...

def foo..
module_function :foo
~~~

- public: by default
- private: a private method foo can only be called without an explicit
identifier (obj.foo, self.foo => error, foo => ok). At thus it can only be
called from inside the class (or a subclass) without an identifier (on go
through the superclass chain)
There is an exception for a setter, which can be called with self.setter=
This is a hack because without a self ruby would think we set a local
variable
~~~ ruby
class Foo
  private def foo=(a) @foo=a; end
  def foo() @foo; end
  def bar(a) self.foo=a; end
end
foo=Foo.new; foo.bar(2); foo.foo
~~~
- protected: in obj.protected, the call only works if 'self' (before being
set to 'obj' is of the same class (or a subclass) of 'obj'). So a protected
method can be called inside the class (or a subclass) with an explicit
identifier, but not outside
See http://stackoverflow.com/questions/3534449/why-does-ruby-have-both-private-and-protected-methods
If a method is protected in Ruby, then it can be called implicitly by both the defining class and its subclasses. Additionally they can also be called by an explicit receiver as long as the receiver is self or of same class (or subclass) as that of self
~~~ ruby
class Foo
  def bar; foo; end
  protected def foo; p "foo called from #{self.class}"; end
end
Foo.new.bar #=> "foo called from Foo"
Foo.new.foo #=> error protected method `foo' called for #<Foo:>
class Bar < Foo
  def baz; foo; end
end
Bar.new.baz #=> "foo called from Bar"
class Baz < Foo
  def afoo; Baz.new.foo end
  def bfoo; Bar.new.foo end
end
Baz.new.afoo #=> "foo called from Baz"
Baz.new.bfoo #=> "foo called from Bar"
~~~

module_function: copy the method in the singleton_class, and make the
method in the current class private
# do/end vs {} {{{1
method1 method2 do block end
-> method1(method2, &block)
method1 method2 { block }
-> method1(method2(&block))
# Assignement {{{1
Splat:
a, *b, c = 1, *[2,3,4]
a,b,* = 1,2,3,4
a,b=b,a
a,(b,c)=1,[2,3] #recursive

Formally:
An assignment expression may have one or more lvalues and one or more rvalues.
This section explains how Ruby handles assignment with different combinations
of arguments:
1. If any rvalue is prefixed with an asterisk and implements to_a, the rvalue
is replaced with the elements returned by to_a, with each element forming its
own rvalue.
2. If the assignment contains one lvalue and multiple rvalues, the rvalues are
converted to an array and assigned to that lvalue.
3. If the assignment contains multiple lvalues and one rvalue, the rvalue is
expanded if possible into a set of rvalues as described in (1).
4. Successive rvalues are assigned to the lvalues. This assignment effectively
happens in parallel, so that (for example) a,b=b,a swaps the values in a and b.
5. If there are more lvalues than rvalues, the excess will have nil assigned to
them.
6. If there are more rvalues than lvalues, the excess will be ignored.
7. At most one lvalue can be prefixed by an asterisk. This lvalue will end up
being an array and will contain as many rvalues as possible. If there are
lvalues to the right of the starred lvalue, these will be assigned from the
trailing rvalues, and whatever rvalues are left will be assigned to the splat
lvalue.
8. If an lvalue contains a parenthesized list, the list is treated as a nested
assignment statement, and then it is assigned from the corresponding rvalue as
described by these rules.

a,b=1,2 #a=1, b=2
a,b=1,2,3 #a=1, b=2
a,b=[1,2,3] #a=1, b=2
a,*b=1,2,3 #a=1, b=[2,3]
a,b=2,[1,2,3],5 #a=2, b=[1,2,3]

Note on the splat operator (rhs or method call):
*foo uses to_a on foo (if the method exist), otherwise it returns [foo]
It can also be used to flatten arrays:
[1,*[3,4]]=>[1,3,4]
(indeed [...] can be seen as a method call to construct an array)
See https://endofline.wordpress.com/2011/01/21/the-strange-ruby-splat/

# Keywords {{{1
Note on argument passing, in
~~~ ruby
def ploum(foo=self, bar: self); end
~~~
The 'self' refer to the self calling 'ploum' (ie the same that lives inside
the method); not to the class (ie obj.foo => self is obj). The same is true
for 'define_method', because it it instance_evaled, so the self inside is
not the enclosing self.

ploum(:a => 2, :b => 3) collect the elements in a hash
(shorter form for symbols:
ploum(a:2,b:3)

Examples:
~~~ ruby
a=Proc.new do |ploum| ploum end => #<Proc:0xb369614@(pry):49>
a.arity => 1
a.parameters => [[:opt, :ploum]]
a.call("ploum") => "ploum"
a.call("ploum","plam") => "ploum"
a.call() => nil

a=lambda do |ploum,plim="lal",*plam| ploum end
=> #<Proc:0xb22d534@(pry):41 (lambda)>
a.arity => -2
a.parameters => [[:req, :ploum], [:opt, :plim], [:rest, :plam]]
~~~

For keywords the algorithm seems to be, for |*args,**keywords|:
we construct args as before, putting things like 'a: 2' or '1=>3' in an
hash as usual. If the last argument is a hash, then take all symbol in the
hash to go in **keywords, the rest is appended in *args

a.call("ploum","plim", d:3, e:4, "plim" => 5, "plam"=> 2, :ploum =>2, 2=>7)
["ploum", "plim", {"plim"=>5, "plam"=>2, 2=>7}] #args
{:d=>3, :e=>4, :ploum=>2} #keywords
a.call({"plim"=>"plam", ploum: 0})
[{"plim"=>"plam"}]
{:ploum=>0}

Note: This behaviour is only triggered if there is a keyword in the definition:
ll=lambda {|*args| p args}
ll.call(foo: "foo") #=> [{:foo=>"foo"}]
ll.call(**{foo: "plim", :ploim=>"plam"}) #=> [{:foo=>"plim", :ploim=>"plam"}]
ll.call("ploum","plim", d:3, e:4, "plim" => 5, "plam"=> 2, :ploum =>2, 2=>7)
["ploum", "plim", {:d=>3, :e=>4, "plim"=>5, "plam"=>2, :ploum=>2, 2=>7}]

Remark: once we put individual hash like elements, we can't switch back to
normal elements
a.call(ploum: 1, 0)
SyntaxError: unexpected ')', expecting =>

The same for function definition:
a=lambda do |ploum,plam="lal",*plim,plom:"lul",**plum| p [ploum, plam,plim,plom,plum] end
we need to put ploum: "lul", after *plim

[50] pry(main)> a.arity
=> -2
[51] pry(main)> a.parameters
=> [[:req, :ploum],
 [:opt, :plam],
 [:rest, :plim],
 [:key, :plom],
 [:keyrest, :plum]]

When calling a function, *args expand the array args into arguments, and
**opts expand the hash opts into keywords (an error is raised if a key in
opts is not a symbol):
def f(**keys) p keys end
a={ploum: "plam", plim: "plom"}
f(a) # => {:ploum=>"plam", :plim=>"plom"}
f(**a) # => {:ploum=>"plam", :plim=>"plom"}

Keywords fun
Splats make a copy of their arguments:
~~~ ruby
a=[1,2]
opts={foo: "bar"}
def foo(a,b); a[0]=0; b[:plim]="plom"; end
foo(a,opts)
#=> a = [0, 2]; opts = {:foo=>"bar", :plim=>"plom"}
a=[1,2]
opts={foo: "bar"}
def foo(*a,**b); a[0]=0; b[:plim]="plom"; end
foo(*a,**opts) #a and opts are unchanged
~~~

Because in **opts, ruby only puts the keywords symbols of the last
argument, a wrapper that intercepts a keyword may change the arguments:
~~~ ruby
def foo(*args,verbose:true,**opts); bar(*args,**opts); end
def bar(*args); p args; end
foo({0=>1, plim:"plom"})
#[{0=>1}, {:plim=>"plom"}]
~~~
(Also as of ruby 2.2, **{} gives {} rather than empty keywords, so
before passing **opts to bar we would need to check that it is not empty,
but I have made a bugreport)
The solution is to do as before keywords:
def foo(*args); (verbose=args.last.delete[:verbose] if args.last.kind_of?(Hash)) or default; bar(*args); end

Also be careful that keywords have less priority than required args but
more than optional args:
~~~ ruby
def foo(*args,ploum: "plim"); p args; end
def bar(arg="arg",ploum: "plim"); p arg; end
def baz(arg,ploum: "plim"); p arg; end
foo({foo: :bar}) #=> ArgumentError: unknown keyword: foo
bar({foo: :bar}) #=> ArgumentError: unknown keyword: foo
baz({:foo=>:bar})# => {:foo=>:bar}
baz({:ploum=>:bar})# => {:ploum=>:bar} (and ploum is still "plim")
~~~

Finally a keyword can be empty:
~~~ ruby
def foo(key:); p key; end;
foo #=> ArgumentError: missing keyword: key
~~~
}}}
# begin/end, exceptions, throw/catch {{{1
begin
end while false
execute le begin une fois quand même

Exception:
begin
  ploum
  raise "foo" #RuntimeError: foo
  raise StandardError.new("ploum")
  raise ArgumentError, "bar"
rescue ArgumentError
  p "ArgumentError"
rescue StandardError => e
  p "Standard Error", e
rescue plim #StandardError => plim
else plam #pas d'exception
ensure plouf #execute quoi qu'il arrive
end

ex rescue RuntimeError, SystemExit, Interrupt, StandardError, Exception...
Create a new exception 'class Foo < Exception; end'
or Foo=Class.new(StandardError).


rescue => e #by defaut we rescue StandardError
rescuing Exception is a bad idea:
- https://robots.thoughtbot.com/rescue-standarderror-not-exception
- http://stackoverflow.com/questions/10048173/why-is-it-bad-style-to-rescue-exception-e-in-ruby
Rem: to rescue all Errno Errors, just catch SystemCallError
- http://stackoverflow.com/questions/11457795/how-to-rescue-all-exceptions-under-a-certain-namespace
(Errno::EACCES.ancestors => [Errno::EACCES, SystemCallError, StandardError, Exception, Object, Kernel, BasicObject])

retry: If retry appears in rescue clause of begin expression, restart from the beginning of the begin body.

def provides its own begin/end scope:
~~~ ruby
def divide(x)
  a=1/x
  rescue Exception => plim
    p plim
  else
    puts "No exception: #{a}"
  ensure
    puts "ensure"
end
divide 1 #=>No exception: 1 ensure
divide 0 #=> #<ZeroDivisionError: divided by 0> ensure
~~~

Inline rescue: expr1 rescue expr2
1/0 rescue 2

throw/catch:
~~~ruby
throw(:ploum,"ahah")
...
a=catch(:ploum) # a=>"ahah"
~~~
throw, like exception, go up the stack. But they are used mainly for loop
flow control (since they are lighter) whereas exceptions are for handling
exceptions, see
- http://stackoverflow.com/questions/51021/what-is-the-difference-between-raising-exceptions-vs-throwing-exceptions-in-ruby
- http://stackoverflow.com/questions/3716801/what-is-catch-and-throw-used-for-in-ruby/

The matching is done on object identity, so its better to throw a symbol.
Also throw can have a second argument, which will be the value of the catch
block (which otherwise returns nil)
~~~ ruby
def foo(i)
  p i
  throw(:done,"found") if i==2 
end
catch :done do
  [1,2,3].each {|i| foo(i) }
  puts "I'm done."
end #prints 1,2 and return "found"
~~~

# case/when {{{1
case ploum
when String
  puts "String"
when 1, 2
  puts "1 or 2"
when /ab/
  ...
else
  ...
end

Matcher deux valeurs en même temps: le pb est que Array#=== ne fait pas ===
récursivement, mais fait juste Array#==
Donc
case [1,2]
when [1,2] #ok
when [Numeric, 2] #pas ok

  #Monkey patch:
class Array
  def ===(other)
    return false if (other.size != self.size)

    other_dup = other.dup
    all? do |e|
      e === other_dup.shift
    end
  end
end
# loops {{{1
http://www.tutorialspoint.com/ruby/ruby_loops.htm
Inline: if ploum then plam else plim end
if ploum #then is optional
  plam
else
  plim
end
ploum if plam
(similar for unless)

The same for while/until/for:
while ploum do plim end
while ploum #do optional
  plim
end
ploum while plim
begin
  ploum
end while plim

Ex:
for i,j in [[1,2],[3,4]] do p i+j; end
#=> 3, 7

Rem: loop is a method and not a keyword

Loop control:
- break Terminates the most internal loop.
block form: Terminates a method with an associated block if called within the block
Passing an argument to break gives the return value of the loop:
for i in 1..5; break "yes" if i==3; end #=> "yes"
(break without an argument returns nil)
- next Jumps to next iteration of the most internal loop
block form: Terminates execution of a block if called within a block
- redo Restarts this iteration of the most internal loop, without checking loop condition.
block form: Restarts yield or call if called within a block.
- If retry appears in the iterator, the block, or the body of the for expression, restarts the invocation of the iterator call. Arguments to the iterator is reevaluated.
This behaviour was for ruby 1.8, it does not work anymore in ruby 1.9,
retry can only be used in rescue clauses
~~~ ruby
(0..5).each do |i|
  puts "Value: #{i}"
  retry if i > 2
end
~~~

Behaviours for block summary:
So break terminates the method associated to the block/lambda (it is not
available on Proc, because the break exit the Proc.new and not the method
where it is called, see http://stackoverflow.com/questions/8888958/why-does-the-break-statement-in-ruby-behave-differently-when-using-proc-new-v-t)
next terminates the block associated to the block/lambda/proc
return is like break for a block or a proc and like next for a lambda

Note that when a lambda/Proc is converted to a block via foo(&bar), the
lambda/proc like difference is conserved:
~~~ ruby
def foo; yield; end
foo(& ->{return 2})
#=> 2
foo(& Proc.new {return 2})
#=> LocalJumpError: unexpected return
~~~
#}}}1
# Threads {{{1
https://ruby-doc.org/core-2.4.0/Thread.html

~~~ ruby
thr = Thread.new { puts "Whats the big deal" }
thr.join #=> "Whats the big deal"

thr = Thread.new { sleep }
thr.status # => "sleep"
thr.exit
thr.status # => false
~~~

https://ruby-doc.org/stdlib-2.1.2/libdoc/monitor/rdoc/Monitor.html
Use the Monitor class when you want to have a lock object for blocks with mutual exclusion.

Example: https://gist.github.com/jemminger/1060484
Make any Ruby method asynchronous (using thread)

https://ruby-doc.org/core-2.2.0/Queue.html
This class provides a way to synchronize communication between threads.
}}}1
# Block shortcuts {{{1
collection.map(&foo) -> &foo will call foo.to_proc

:upcase.to_proc => %w(foo bar).map(&:upcase)
Essentiellement implémenté via:
def to_proc
  lambda do |main, *args|
    main.send(self, *args)
  end
end

%(foo bar).map(& method(:puts)) #puts est une méthode de main
[1,2].map(& 5.method(:+)) => [6,7]

Rappel: foo.method(:bar) retourne la méthode foo.bar vue comme une closure
La classe Method comprend to_proc; malheureusement une UnboundMethod (que
l'on obtient via Foo.instance_method(:bar)) non.
Astuce: pour spécifier une unary method: 42.method(:-@)
  42.method(:-).call(5) #37
  42.method(:-@).call() #-42

drain ajoute to_proc pour les UnboundMethod et les Array.

ruby 2.7 introduit les raccourcis suivants:
foo.map {@1+@2} #numbered parameters
foo&:bar #raccourci pour foo.method(:bar)

}}}1

# Basic Types
# Booleans {{{1
||, && (||=, &&=)
or, and #very small precedence:
a=foo or bar => (a=foo) or (bar)
&, |: bitwise operators, but can be used as eager (rather than lazy like
the above) boolean operators:
http://blog.tdg5.com/eager-boolean-operators-a-pattern-to-continue-never-using/
# Strings {{{1
Encoding: https://ruby-doc.org/core-2.2.0/Encoding.html
"some string".encoding
"some string".encode "ISO-8859-1"
string.force_encoding(Encoding::UTF_8)
string = string.encode!(Encoding::ISO_8859_1)

Encoding in the ruby script: # encoding: ISO-8859-1 (default to utf-8)
Encoding.locale_charmap #'UTF-8': encoding of the environment
Encoding.find('filesystem') #'UTF-8': encoding of the file names

Encoding.default_external #set by ruby -E ...; the default encoding when writing to a file 
  (By default configured by the locale)
Encoding.default_internal #set by ruby -E ...; the default encoding when reading from a file
  (By default set to nil, which means no transcoding, ie use default_external)
IO#set_encoding #to change from default_external

#set external encoding to latin-1
open("transcoded.txt", "w:ISO-8859-1") do |io|
  io.write(string) #string is transcoded to latin1
#set external encoding to latin1 and the internal to utf-8
open("transcoded.txt", "r:ISO-8859-1:UTF-8") do |io|
  io.read #transcoded from latin-1 to utf-8

IO.binread("testfile") # Similar to opening via with mode 'rb:ASCII-8BIT' and reading.

String#valid_encoding?
String#encode: https://ruby-doc.org/core-2.4.0/String.html#method-i-encode
 Options: invalid: :replace, undef: :replace
          replace: replacement_string, fallback: hash/method
          xml: :text/:attr (xml quoting)
          cr_newline, crlf_newline, universal_newline:w

Exemples: 
- convert every new line (whatever the type) to \r\n
  c=c.encode(universal_newline:true).encode(crlf_newline: true)

- convert to utf8
  s.encode('UTF-8' :invalid => :replace, :undef => :replace,
                 :fallback => Proc.new { |bytes| '<'+bytes.unpack('H*')[0]+'>' }
  Note: unpack('H*') use hex encoding for all bytes

- fix invalid characters
String#scrub: If the string is invalid byte sequence then replace invalid bytes with given replacement character, else returns self. If block is given, replace invalid bytes with returned value of the block.
  s.scrub {|bytes| '<'+bytes.unpack('H*')[0]+'>' }
  "abc\u3042\xE3\x80".scrub!{|bytes| '<'+bytes.unpack('H*')[0]+'>' } #=> "abcあ<e380>"

# Array and Hashes {{{1
Array.new(0) pour initialiser les éléments vides à 0 plutôt qu'à nil,
pareil pour Hash.new()
Array.new(5) {|i| i*i} #=>[0,1,4,9,16]
~~~ ruby
#Hash.new
h = Hash.new("Go Fish")
# The following alters the single default object
h["c"].upcase!   #=> "GO FISH"
h["d"]           #=> "GO FISH"
# While this creates a new default object each time
h = Hash.new { |hash, key| hash[key] = "Go Fish: #{key}" }
a=[1,2,3]

#Hash#fetch
h.fetch(key,fallback)

#Arrays []
a[5]=[7,8] => [1, 2, 3, nil, nil, [7, 8]]
a[0,0]=[-1,-2] => [-1, -2, 1, 2, 3, nil, nil, [7, 8]]
a=[1,2,3]; a[0..1]=['a','b','c'] => ["a", "b", "c", 3]
a[0..2]=0 => [0,3]
~~~

# Regexps {{{1

s[/regexp/] #return the matching portion
s[/(regexp)/,1] #get the numbered match
s.match(/(regexp)/) {|m| m[1]} #ditto
s.scan(/regexp/) #construct an array of matches
s.scan(/regexp/) {} #pass the matches to the block
 if the regexp has groups then the elements in the array or passed to the
 block are themselves arrays:
 "cruel world".scan(/(...)/)      #=> [["cru"], ["el "], ["wor"]]

For more complex string scanning, cf class StringScanner

http://ruby-doc.org/core-2.1.1/Regexp.html
## Character classes: {{{2
    /./ - Any character except a newline.
    /./m - Any character (the m modifier enables multiline mode)
    /\w/ - A word character ([a-zA-Z0-9_])
    /\W/ - A non-word character ([^a-zA-Z0-9_]).
    /\d/ - A digit character ([0-9])
    /\D/ - A non-digit character ([^0-9])
    /\h/ - A hexdigit character ([0-9a-fA-F])
    /\H/ - A non-hexdigit character ([^0-9a-fA-F])
    /\s/ - A whitespace character: /[ \t\r\n\f]/
    /\S/ - A non-whitespace character: /[^ \t\r\n\f]/

POSIX bracket expressions are also similar to character classes. They provide a portable alternative to the above, with the added benefit that they encompass non-ASCII characters. For instance, /\d/ matches only the ASCII decimal digits (0-9); whereas /[[:digit:]]/ matches any character in the Unicode Nd category.
    /[[:alnum:]]/ - Alphabetic and numeric character
    /[[:alpha:]]/ - Alphabetic character
    /[[:blank:]]/ - Space or tab
    /[[:cntrl:]]/ - Control character
    /[[:digit:]]/ - Digit
    /[[:graph:]]/ - Non-blank character (excludes spaces, control characters, and similar)
    /[[:lower:]]/ - Lowercase alphabetical character
    /[[:print:]]/ - Like [:graph:], but includes the space character
    /[[:punct:]]/ - Punctuation character
    /[[:space:]]/ - Whitespace character ([:blank:], newline, carriage return, etc.)
    /[[:upper:]]/ - Uppercase alphabetical
    /[[:xdigit:]]/ - Digit allowed in a hexadecimal number (i.e., 0-9a-fA-F)
Ruby also supports the following non-POSIX character classes:
    /[[:word:]]/ - A character in one of the following Unicode general categories Letter, Mark, Number, Connector_Punctuation
    /[[:ascii:]]/ - A character in the ASCII character set

The \p{} construct matches characters with the named property, much like POSIX bracket classes.
    /\p{Alnum}/ - Alphabetic and numeric character
    /\p{Alpha}/ - Alphabetic character
    /\p{Blank}/ - Space or tab
    /\p{Cntrl}/ - Control character
    /\p{Digit}/ - Digit
    /\p{Graph}/ - Non-blank character (excludes spaces, control characters, and similar)
    /\p{Lower}/ - Lowercase alphabetical character
    /\p{Print}/ - Like \p{Graph}, but includes the space character
    /\p{Punct}/ - Punctuation character
    /\p{Space}/ - Whitespace character ([:blank:], newline, carriage return, etc.)
    /\p{Upper}/ - Uppercase alphabetical
    /\p{XDigit}/ - Digit allowed in a hexadecimal number (i.e., 0-9a-fA-F)
    /\p{Word}/ - A member of one of the following Unicode general category Letter, Mark, Number, Connector_Punctuation
    /\p{ASCII}/ - A character in the ASCII character set
    /\p{Any}/ - Any Unicode character (including unassigned characters)
    /\p{Assigned}/ - An assigned character
A Unicode character’s General Category value can also be matched with \p{Ab} where Ab is the category’s abbreviation as described below:
    /\p{L}/ - 'Letter'
    /\p{Ll}/ - 'Letter: Lowercase'
    /\p{Lm}/ - 'Letter: Mark'
    /\p{Lo}/ - 'Letter: Other'
    /\p{Lt}/ - 'Letter: Titlecase'
    /\p{Lu}/ - 'Letter: Uppercase
    /\p{Lo}/ - 'Letter: Other'
    /\p{M}/ - 'Mark'
    /\p{Mn}/ - 'Mark: Nonspacing'
    /\p{Mc}/ - 'Mark: Spacing Combining'
    /\p{Me}/ - 'Mark: Enclosing'
    /\p{N}/ - 'Number'
    /\p{Nd}/ - 'Number: Decimal Digit'
    /\p{Nl}/ - 'Number: Letter'
    /\p{No}/ - 'Number: Other'
    /\p{P}/ - 'Punctuation'
    /\p{Pc}/ - 'Punctuation: Connector'
    /\p{Pd}/ - 'Punctuation: Dash'
    /\p{Ps}/ - 'Punctuation: Open'
    /\p{Pe}/ - 'Punctuation: Close'
    /\p{Pi}/ - 'Punctuation: Initial Quote'
    /\p{Pf}/ - 'Punctuation: Final Quote'
    /\p{Po}/ - 'Punctuation: Other'
    /\p{S}/ - 'Symbol'
    /\p{Sm}/ - 'Symbol: Math'
    /\p{Sc}/ - 'Symbol: Currency'
    /\p{Sc}/ - 'Symbol: Currency'
    /\p{Sk}/ - 'Symbol: Modifier'
    /\p{So}/ - 'Symbol: Other'
    /\p{Z}/ - 'Separator'
    /\p{Zs}/ - 'Separator: Space'
    /\p{Zl}/ - 'Separator: Line'
    /\p{Zp}/ - 'Separator: Paragraph'
    /\p{C}/ - 'Other'
    /\p{Cc}/ - 'Other: Control'
    /\p{Cf}/ - 'Other: Format'
    /\p{Cn}/ - 'Other: Not Assigned'
    /\p{Co}/ - 'Other: Private Use'
    /\p{Cs}/ - 'Other: Surrogate'
Lastly, \p{} matches a character’s Unicode script.
}}}2

## Anchors
Anchors are metacharacter that match the zero-width positions between characters, anchoring the match to a specific position.
    ^ - Matches beginning of line
    $ - Matches end of line
    \A - Matches beginning of string.
    \Z - Matches end of string. If string ends with a newline, it matches just before newline
    \z - Matches end of string
    \G - Matches point where last match finished
    \b - Matches word boundaries when outside brackets; backspace (0x08) when inside brackets
    \B - Matches non-word boundaries
    (?=pat) - Positive lookahead assertion: ensures that the following characters match pat, but doesn't include those characters in the matched text
    (?!pat) - Negative lookahead assertion: ensures that the following characters do not match pat, but doesn't include those characters in the matched text
    (?<=pat) - Positive lookbehind assertion: ensures that the preceding characters match pat, but doesn't include those characters in the matched text
    (?<!pat) - Negative lookbehind assertion: ensures that the preceding characters do not match pat, but doesn't include those characters in the matched text

## Repetition
    * - Zero or more times
    + - One or more times
    ? - Zero or one times (optional)
    {n} - Exactly n times
    {n,} - n or more times
    {,m} - m or less times
    {n,m} - At least n and at most m times
    | - alternation
Greedy by default. A greedy metacharacter can be made lazy by following it with ?.

## Groups
Capture group can be referred via \1, \2,...

Capture groups can also be referred to by name when defined with the (?<name>)
or (?'name') constructs.
    /\$(?<dollars>\d+)\.(?<cents>\d+)/.match("$3.67")
    => #<MatchData "$3.67" dollars:"3" cents:"67">
    /\$(?<dollars>\d+)\.(?<cents>\d+)/.match("$3.67")[:dollars] #=> "3"
Named groups can be backreferenced with \k<name>, where name is the group name.
    /(?<vowel>[aeiou]).\k<vowel>.\k<vowel>/.match('ototomy')
        #=> #<MatchData "ototo" vowel:"o">

- The (?:…) construct provides grouping without capturing.
- Grouping can be made atomic with (?>pat).
  = don't backtrack in the group once we matched once
  https://www.regular-expressions.info/atomic.html
- \g<name> syntax matches the previous subexpression named name, which can be
a group name or number, again. This differs from backreferences in that it
re-executes the group rather than simply trying to re-match the same text.

https://news.ycombinator.com/item?id=13939046
The New ‘Absent Operator’ in Ruby’s Regular Expressions "(?~foo)"

# Idiomatisme pour construire une liste: {{{1
~~~ ruby
ploum.each do |plam|
  (r||=[]) << plam
end #le pb c'est que r reste local au block ici...
r=nil; s="abc".each_char do |c| (r||=[]) << c end; p r, s
#-> ["a", "b", "c"] "abc"
#on voit que la valeur de retour de each_char est "abc"
~~~
# List comprehension {{{1
=================
~~~ ruby

#http://stackoverflow.com/questions/4769004/learning-python-from-ruby-differences-and-similarities
values=[1,16,2,17]
values.select {|v| v > 15}.map {|v| v * v}
#more idiomatic:
values.map{|v| v*v if v > 15}.compact

#http://stackoverflow.com/questions/310426/list-comprehension-in-ruby
class Array
  def lc(&block)
    return self if block.nil?
    self.collect(&block).compact
  end
end
[1,2,3].lc{|d| ['a','b'].lc{|ch| d.to_s+ch if ch =='a'} if d>=2} #=> [["2a"], ["3a"]]

#http://c2.com/cgi/wiki?PythonVsRubyCodeExamples
module Enumerable
   def compact_map( comp=nil )
     inject( [] ) do |ary,item|
       t = yield item
       ( ary << t unless t == comp ) || ary
     end
   end
end
values.compact_map { |v| v*v if v > 15} #=> [256, 289]
values.compact_map(256) { |v| v*v if v > 15} #=> [nil, nil, 289]

#Une version plus plate et plus puissante
module Enumerable
  def comprehend(args = [], result=[], &block)
    if empty? then
      r = yield *args
      result << r if r
    else
      (self[0]||[]).each { |e|
         self[1..-1].comprehend( args + [e], result, &block) }
    end
    result
  end
end
[values].comprehend { |v| v*v if v > 15}
[0..2,0..2,0..2].comprehend { | *x | x if x.uniq.count == x.count  }
#=> [[0, 1, 2], [0, 2, 1], [1, 0, 2], [1, 2, 0], [2, 0, 1], [2, 1, 0]]

#Comparaison:
  [0..2,0..2,0..2].comprehend { |x,y,z| [x,y,z] if x != y && y != z }
#=> [[0, 1, 0], [0, 1, 2], [0, 2, 0], [0, 2, 1], [1, 0, 1], [1, 0, 2], [1, 2, 0], [1, 2, 1], [2, 0, 1], [2, 0, 2], [2, 1, 0], [2, 1, 2]]
  (0..2).to_a.lc {|x| (0..2).to_a.lc {|y| [x,y] if x != y }}
# => [[[0, 1], [0, 2]], [[1, 0], [1, 2]], [[2, 0], [2, 1]]]

  [0..2,0..2].comprehend { |x,y| x+y if x != y}
#=> [1, 2, 1, 3, 2, 3]
  (0..2).to_a.lc {|x| (0..2).to_a.lc {|y| x+y if x != y }}
# => [[1, 2], [1, 3], [2, 3]] (so we must use result.flatten to get the correct result)
~~~

Si on veut juste de la comprehension:
http://rosettacode.org/wiki/List_comprehensions#Ruby
(Joli mais si on veut autre chose que la liste, il faut faire un map derrière)
~~~ ruby
#select Pythagorean triplets
r = ((1..n).flat_map { |x|
       (x..n).flat_map { |y|
                (y..n).flat_map { |z|
                           [[x, y, z]].keep_if { x * x + y * y == z * z }
                           }
                }
        })
~~~
- flat_map concatène des arrays
- array#keep_if is an alternative to Enumerable#select that modifies the
original array. (We avoid Array#select! because it might not return the
array [it returns nil if no changes were made].)
Ils sont définis dans ruby1.9:
~~~ ruby
unless Enumerable.method_defined? :flat_map
  module Enumerable
    def flat_map
      inject([]) { |a, x| a.concat yield(x) }
    end
  end
end
unless Array.method_defined? :keep_if
  class Array
    def keep_if
      delete_if { |x| not yield(x) }
    end
  end
end
~~~

Cf aussi:
https://gist.github.com/3356675 #haskell like madness
https://github.com/postmodern/combinatorics
# Range {{{1
Rappel: 1..3 (inclusive [1,2,3]) vs 1...3 (exclusive [1,2])
(1..5).step(2).to_a #=> [1, 3, 5]
But step can't be negative; the solution is to use Numeric#step:
10.step(1,-2).to_a
or with keywords: 10.step(to: 1,by: -2).to_a #=> [10, 8, 6, 4, 2]

## Range conditions:
[Range conditions] turn on when the condition in the first part of the
range becomes true, and turn off when the condition in the second part
becomes true.

#this version print 'start' to 'end' (included)
while line = gets
  puts line if line =~ /start/ .. line =~ /end/
end
Rem: la version inclusive matche les deux conditions sur la même ligne, ce
qui fait que une ligne 'start ploum end' sera affichée, et l'automate sera
à nouveau en position false. Pour éviter ça utiliser la version exclusive:
while line = gets
  puts line if line =~ /start/ ... line =~ /end/
end
après 'start ploum end', la condition est à true
# each and for {{{1
for a in b  est équivalent à b.each do |a| (sauf pour le scope:
dans un block les nouvelles variables locales restent internes au scope,
alors que dans if/for/while/until elles se propagent)

# Enumerator {{{1
~~~ ruby
fib = Enumerator.new do |y|
  a = b = 1
  loop do
    y << a #alias for y.yield(a)
    a, b = b, a + b
  end
end
~~~
Here y is an Enumerator::Yielder
y=Enumerator::Yielder.new {|x| x}

## to_enum {{{2
http://ruby-doc.org/core-1.9.3/Enumerator.html
An Enumerator can be created by the following methods.
    Kernel#to_enum
    Kernel#enum_for
    ::new

By default, to_enum use the :each method
Ex: to_enum(__method__, *args) #aka current method
Then each time the method yields an object, this object is passed to the Enumerator

Most methods have two forms: a block form where the contents are evaluated
for each item in the enumeration, and a non-block form which returns a new
Enumerator wrapping the iteration.

~~~ ruby
enumerator = %w(one two three).each
puts enumerator.class # => Enumerator
enumerator.each_with_object("foo") do |item,obj|
  puts "#{obj}: #{item}"
end
# foo: one
# foo: two
# foo: three
enum_with_obj = enumerator.each_with_object("foo")
puts enum_with_obj.class # => Enumerator
enum_with_obj.each do |item,obj|
  puts "#{obj: #{item}"
end
# foo: one
# foo: two
# foo: three

module Enumerable
  # a generic method to repeat the values of any enumerable
  def repeat(n)
    raise ArgumentError, "#{n} is negative!" if n < 0
    unless block_given?
      return to_enum(__method__, n) do # __method__ is :repeat here
        sz = size     # Call size and multiply by n...
        sz * n if sz  # but return nil if size itself is nil
      end
    end
    each do |*val|
      n.times { yield *val }
    end
  end
end
%i[hello world].repeat(2) { |w| puts w }
  # => Prints 'hello', 'hello', 'world', 'world'
enum = (1..14).repeat(3)
  # => returns an Enumerator when called without a block
enum.first(4) # => [1, 1, 1, 2]
enum.size # => 42

obj=Object.new()
def obj.each
  yield(1)
  yield(2)
end
obj.to_enum.next #=> 1
~~~

This allows you to chain Enumerators together. For example, you can map a list's elements to strings containing the index and the element as a string via:
~~~ ruby
puts %w[foo bar baz].map.with_index {|w,i| "#{i}:#{w}" }
# => ["0:foo", "1:bar", "2:baz"]
~~~

## Enumarator as external iterator {{{2

An Enumerator can also be used as an external iterator. For example, #next returns the next value of the iterator or raises StopIteration if the Enumerator is at the end.
~~~ ruby
e = [1,2,3].each   # returns an enumerator object.
puts e.next   # => 1
puts e.next   # => 2
puts e.next   # => 3
puts e.next   # raises StopIteration
~~~

See also Enumerator#feed to specify a value to return to the nil after e.next
Implem note: if we see enumerators as fibers, in 'x=yield' the execution
stops after the yield and so one just need to call feed before the
following next.
~~~ ruby
  # Array#map passes the array's elements to "yield" and collects the
  # results of "yield" as an array.
  # Following example shows that "next" returns the passed elements and
  # values passed to "feed" are collected as an array which can be
  # obtained by StopIteration#result.
  e = [1,2,3].map
  p e.next           #=> 1
  e.feed "a"
  p e.next           #=> 2
  e.feed "b"
  p e.next           #=> 3
  e.feed "c"
  begin
    e.next
  rescue StopIteration
    p $!.result      #=> ["a", "b", "c"]
  end

  o = Object.new
  def o.each
    p "1"
    x = yield         # (2) blocks
    p "2"
    p x               # (5) => "foo"
    p "3"
    x = yield         # (6) blocks
    p "4"
    p x               # (8) => nil
    p "5"
    x = yield         # (9) blocks
    p "6"
    p x               # not reached w/o another e.next
    p "7"
  end

  e = o.to_enum
  e.next              # (1) #=>"1"
  e.feed "foo"        # (3)
  e.next              # (4) #=>"2", "foo", "3"
  e.next              # (7) #=>"4", nil, "5"
  e.next              # => "6", nil, "7", StopIteration
~~~

Enumerator.new do |y| y.yield 1 end
is essentially the same as 
e=Enumerator::Generator.new do |y| y.yield 1 end
e.to_enum
and y is a Enumerator::Yielder

## Lazy enumerators {{{2
Enumerator and lazy:
http://patshaughnessy.net/2013/4/3/ruby-2-0-works-hard-so-you-can-be-lazy
http://www.sitepoint.com/implementing-lazy-enumerables-in-ruby/

~~~ ruby
e=Enumerator::Lazy.new([1,2]) do |yielder,values|
  yielder << values
end
e.next #=>1
e.next #=>2
~~~

Essentially while Enumerator#map comes from Enumerable#map and returns an
array, Enumerator::Lazy#map returns an Enumrator::Lazy

See below for the implementation in rubinius, here is a toy implem
~~~ ruby
module Enumerable
  def lax
    Lax.new(self)
  end
end
class Lax < Enumerator
  def initialize(receiver)
    super() do |yielder|
      begin
        receiver.each do |val|
          if block_given? 
            yield(yielder, val)
          else
            #convenience, normally Enumerator::Lazy needs a block
            yielder << val
          end
        end
      rescue StopIteration
      end
    end
  end
  def map(&block)
    Lax.new(self) do |yielder, val|
      yielder << block.call(val)
    end
  end
  def take(n)
    taken = 0
    Lax.new(self) do |yielder, val|
      if taken < n
        yielder << val
        taken += 1 
      else
        raise StopIteration
      end
    end
  end
end
~~~

## Implementations {{{2
Enumerator:
http://emboss.github.io/blog/2012/10/01/how-are-enumerators-for-arbitrary-objects-implemented/
https://practicingruby.com/articles/building-enumerable-and-enumerator

http://stackoverflow.com/questions/1436037/how-do-enumerators-work-in-ruby-1-9-1/1437678#1437678
~~~ ruby
#minimalist implementation using fibers
class MyEnumerator
  include Enumerable

  def initialize(obj, iterator_method)
    @f = Fiber.new do
      obj.send(iterator_method) do |*args|
        Fiber.yield(*args)
      end
      raise StopIteration
    end
  end

  def next
    @f.resume
  end

  def each
    loop do
      yield self.next
    end
  rescue StopIteration
    self
  end
end

>> enum = MyEnumerator.new([1,2,3,4], :each_with_index)
=> #<MyEnumerator:0x9d184f0 @f=#<Fiber:0x9d184dc>
>> enum.next
=> [1, 0]
>> enum.next
=> [2, 1]
>> enum.to_a
=> [[3, 2], [4, 3]]
~~~

Implementation in rubinius: https://github.com/rubinius/rubinius/blob/master/core/enumerator.rb

=> Enumerator::Yielder(&b) just wraps the block so that we can call '<<' on it
   Enumerator::Generator(&b) wraps the block and set a trivial Yielder as the first argument of this block
~~~ ruby
class Yielder
  def initialize(&block)
    raise LocalJumpError, "Expected a block to be given" unless block_given?
    @proc = block
    self
  end
  def yield(*args)
    @proc.call *args
  end
  def <<(*args)
    self.yield(*args)
    self
  end
end
class Generator
  include Enumerable
  def initialize(&block)
    raise LocalJumpError, "Expected a block to be given" unless block_given?
    @proc = block
    self
  end
  def each(*args)
    enclosed_yield = Proc.new { |*enclosed_args| yield *enclosed_args }
    @proc.call Yielder.new(&enclosed_yield), *args
  end
end

class Enumerator
  include Enumerable

  attr_writer :args
  attr_writer :size
  def initialize_enumerator(receiver, size, method_name, *method_args)
    @object = receiver
    @size = size
    @iter = method_name
    @args = method_args
    @generator = nil
    @lookahead = []
    @feedvalue = nil
    self
  end

  #either we pass a block, on an object
  def initialize(receiver_or_size=undefined, method_name=:each, *method_args, &block)
    size = nil
    if block_given?
      unless undefined.equal? receiver_or_size
        size = receiver_or_size
      end
      receiver = Generator.new(&block)
    else
      if undefined.equal? receiver_or_size
        raise ArgumentError, "Enumerator#initialize requires a block when called without arguments"
      end
      receiver = receiver_or_size
    end
    initialize_enumerator receiver, size, method_name, *method_args
    self
  end

  def each(*args)
    enumerator = self
    unless args.empty?
      enumerator = dup
      enumerator.args = @args.empty? ? args : (@args + args)
    end
    if block_given?
      enumerator.each_with_block do |*yield_args|
        yield(*yield_args)
      end
    else
      enumerator
    end
  end

  def each_with_block
    @object.__send__ @iter, *@args do |*args|
      ret = yield(*args)
      unless @feedvalue.nil?
        ret = @feedvalue
        @feedvalue = nil
      end
      ret
    end
  end

  def next
    return @lookahead.shift unless @lookahead.empty?
    unless @generator
      # Allow #to_generator to return nil, indicating it has none for
      # this method.
      if @object.respond_to? :to_generator
        @generator = @object.to_generator(@iter)
      end
      if !@generator and gen = FiberGenerator
        @generator = gen.new(self)
      else
        @generator = ThreadGenerator.new(self, @object, @iter, @args)
      end
    end

    begin
      return @generator.next if @generator.next?
    rescue StopIteration
    end
    exception = StopIteration.new "iteration reached end"
    exception.result = @generator.result
    raise exception
  end

  def next_values
    Array(self.next)
  end

  def peek
    return @lookahead.first unless @lookahead.empty?
    item = self.next
    @lookahead << item
    item
  end

  def peek_values
    Array(self.peek)
  end

  def rewind
    @object.rewind if @object.respond_to? :rewind
    @generator.rewind if @generator
    @lookahead = []
    @feedvalue = nil
    self
  end

  def size
    @size.respond_to?(:call) ? @size.call : @size
  end

  def each_with_index
    return to_enum(:each_with_index) { size } unless block_given?
    idx = 0
    each do |o|
      val = yield(o, idx)
      idx += 1
      val
    end
  end

  def with_index(offset=0)
    return to_enum(:with_index, offset) { size } unless block_given?
    each do |o|
      val = yield(o, offset)
      offset += 1
      val
    end
  end

  def feed(val)
    raise TypeError, "Feed value already set" unless @feedvalue.nil?
    @feedvalue = val
    nil
  end
end

class FiberGenerator
  attr_reader :result
  def initialize(obj)
    @object = obj
    rewind
  end
  def next?
    !@done
  end
  def next
    reset unless @fiber
    val = @fiber.resume
    raise StopIteration, "iteration has ended" if @done
    return val
  end
  def rewind
    @fiber = nil
    @done = false
  end
  def reset
    @done = false
    @fiber = Rubinius::Fiber.new(0) do
      obj = @object
      @result = obj.each do |*val|
        Rubinius::Fiber.yield *val
      end
      @done = true
    end
  end
end

class Lazy < self
  class StopLazyError < Exception; end

  def initialize(receiver, size=nil)
    raise ArgumentError, "Lazy#initialize requires a block" unless block_given?
    super(size) do |yielder, *each_args|
      #the each_args can be set by doing Enumerator#each(*each_args)
      #cf the implementation of Enumerator above
      begin
        receiver.each(*each_args) do |*args|
          yield yielder, *args
        end
      rescue Exception
        nil
      end
    end
    self
  end

  def to_enum(method_name=:each, *method_args, &block)
    size = block_given? ? block : nil
    ret = Lazy.allocate
    ret.initialize_enumerator self, size, method_name, *method_args
    ret
  end
  alias_method :enum_for, :to_enum

  def lazy
    self
  end

  alias_method :force, :to_a

  def take(n)
    raise ArgumentError, "attempt to take negative size" if n < 0

    current_size = enumerator_size
    set_size = if current_size.kind_of?(Numeric)
      n < current_size ? n : current_size
    else
      current_size
    end
    return to_enum(:cycle, 0).lazy if n.zero?

    taken = 0
    Lazy.new(self, set_size) do |yielder, *args|
      if taken < n
        yielder.yield(*args)
        taken += 1
        raise StopLazyError unless taken < n
      else
        raise StopLazyError
      end
    end
  end

  def select
    raise ArgumentError, 'Lazy#{select,find_all} requires a block' unless block_given?
    Lazy.new(self, nil) do |yielder, *args|
      val = args.length >= 2 ? args : args.first
      yielder.yield(*args) if yield(val)
    end
  end

  def map
    raise ArgumentError, 'Lazy#{map,collect} requires a block' unless block_given?
    Lazy.new(self, enumerator_size) do |yielder, *args|
      yielder.yield yield(*args)
    end
  end
end

class Enumerable
  def lazy
    Enumerator::Lazy.new(self, enumerator_size) do |yielder, *args|
      yielder.<<(*args)
    end
  end
end
~~~

# Fibers {{{1

http://pragdave.me/blog/2007/12/30/pipelines-using-fibers-in-ruby-19/
http://www.ruby-doc.org/core-2.2.0/Fiber.html
-  yield(args, ...)
  Yields control back to the context that resumed the fiber, passing along
  any arguments that were passed to it. The fiber will resume processing at
  this point when resume is called next. Any arguments passed to the next
  resume will be the value that this Fiber.yield expression evaluates to.
- resume(args, ...)
  Resumes the fiber from the point at which the last Fiber.yield was called, or starts running it if it is the first call to resume. Arguments passed to resume will be the value of the Fiber.yield expression or will be passed as block parameters to the fiber’s block if this is the first resume.
  Alternatively, when resume is called it evaluates to the arguments passed to the next Fiber.yield statement inside the fiber’s block or to the block value if it runs to completion without any Fiber.yield
-  transfer(args, ...)
  Transfer control to another fiber, resuming it from where it last stopped or starting it if it was not resumed before. The calling fiber will be suspended much like in a call to Fiber.yield. You need to require 'fiber' before using this method.
  The fiber which receives the transfer call is treats it much like a resume call. Arguments passed to transfer are treated like those passed to resume.
  You cannot resume a fiber that transferred control to another one. This will cause a double resume error. You need to transfer control back to this fiber before it can yield and resume.

~~~ ruby
fiber = Fiber.new do |first|
  second = Fiber.yield first + 2
end
puts fiber.resume 10 #=> 12
puts fiber.resume 14 #=> 14
puts fiber.resume 18 #=> FiberError: dead fiber called

#Fibers as Enumerators
#http://stackoverflow.com/questions/9052621/why-do-we-need-fibers
fib = Fiber.new do
  x, y = 0, 1
  loop do
    Fiber.yield y
    x,y = y,x+y
  end
end
10.times { puts fib.resume }

fiber1 = Fiber.new do
  puts "In Fiber 1"
  Fiber.yield
end
fiber2 = Fiber.new do
  puts "In Fiber 2"
  fiber1.transfer
  puts "Never see this message"
end
fiber3 = Fiber.new do
  puts "In Fiber 3"
end
fiber2.resume
fiber3.resume
#=> In fiber 2; In fiber 1; In fiber 3

#}}}1

# Basic Methods
# new {{{1
Class#new:
  Calls allocate to create a new object of class's class, then invokes that
  object's initialize method, passing it args. This is the method that ends
  up getting called whenever an object is constructed using .new.
See http://stackoverflow.com/questions/11074175/how-to-return-new-instance-of-subclass-while-initializing-parent-class

# super {{{1
~~~ ruby
class Foo
  def foo(*args,&b)
    p args,b
  end
  def bar(*args,&b)
    p args,b
  end
end
class Bar <Foo
  def foo(*args)
    super #pass all arguments, and the block
    super("ploum") #pass ploum as argument, but also the block!
    #trick not to pass the block: super("ploum",&nil)
  end
  define_method :bar do |*args|
    super(*args) #don't pass the block
  end
end
Bar.new.foo("ploum","plam") {|x| x+1}
Bar.new.bar("ploum","plam") {|x| x+1}
#=> ["ploum", "plam"], #<Proc:0x00000003a53d88@(pry):48>, 
#=> ["ploum"], #<Proc:0x00000003a53d88@(pry):48>
#=> ["ploum", "plam"], nil
~~~
Note: with 'define_method', we can't use 'super' as a keyword, we need to
explicitly pass the arguments: super(ploum)

~~~ ruby
#super and options behave as expected
class Foo
  def foo(first="first",*args,opt: true, foo: :foo, **opts)
    p first,args,opt,foo,opts
  end
end
class Bar <Foo
  def foo(*args,opt: false, **opts)
    super
  end
end
Bar.new.foo #=>  ["first", [], false, :foo, {}]
Bar.new.foo(plim: :plom, foo: :bar) #=> ["first", [], false, :bar, {:plim=>:plom}]
~~~

# instance_{eval,exec} {{{1
Rappel: obj.instance_eval
-> self=obj, klass=obj.singleton_class
mod.module_eval
-> self=mod, klass=mod

obj.instance_eval(&block)
passe 'obj' en argument à block (en plus de changer self à block)
  3.instance_eval {|x| x} #=> 3
alors que instance_exec(*args,&block) passe args à block:
  3.instance_exec(5) {|x| x} #=>5

Remarque: Module#define_method use instance_eval to pass the block to the
object calling. But if the block comes from a bound method, this does not
change the 'self' inside this bound method:
  m="foo".method(:length)
  a="ploum"
  a.singleton_class.send :define_method, :foo,&m
  a.foo #=>3
La solution est de rebinder m:
  a.singleton_class.send(:define_method, :foo) { m.unbind.bind(self).call }
  a.foo #=>5

Module.new(&b) and Class.new(&b) pass the created module to the block via
module_eval
#}}}
# alias and Module#alias_method {{{1
http://blog.bigbinary.com/2012/01/08/alias-vs-alias-method.html
  alias orig_method method #define a new method `orig_method`
  alias_method :orig_method, :method
alias_method works on self, alias on klass (like define_method vs def)
# clone vs dup {{{1
http://stackoverflow.com/questions/10183370/whats-the-difference-between-rubys-dup-and-clone-methods

En gros clone copie exactement l'objet (y compris les singleton methods et
l'aspect frozen), alors que dup copie plutôt les données.
# tap/itself {{{1

They are essentially defined as
def tap
  yield self
  self
end

def itself #in ruby 2.2 it is just implemented as 'def itself; self; end' :-(
  if block_given?
    yield self
  else
    self
  end
end

# Binary and unary operators {{{1
http://www.rubyinside.com/rubys-unary-operators-and-how-to-redefine-their-functionality-5610.html

def +@ #+ as a unary operator
-@, ~, ! #if ! is defined, not foo is aliased to !
[Note: one can also use ~@ and !@ instead of ~ and !]
~~~ ruby
s="ploum"
def s.!
  self.reverse
end
!s #=> muolp
not s #=> muolp
s.! #=> muolp
~~~

http://phrogz.net/ProgrammingRuby/language.html#operatorexpressions
[] []=          Element reference, element set
**              Exponentiation
! ~ + -         Not, complement, unary plus and minus
* / %           Multiply, divide, and modulo
+ -             Plus and minus
>> <<           Right and left shift
&               Bitwise `and'
^ |             Bitwise exclusive `or' and regular `or'
<= < > >=       Comparison operators
<=> == ===
!= =~ !~        Equality and pattern match operators
&&              Logical `and'
||              Logical `or'
.. ...          Range (inclusive and exclusive)
? :             Ternary if-then-else
= %= /= -= += *=
|= &= >>= <<=
&&= ||= **=     Assignment
defined?        Check if symbol defined
not             Logical negation
or and          Logical composition
if unless
while until     Expression modifiers
begin/end       Block expression

Methods (that can thus be overridden):
[] []= ** ! ~ + - * / % >> << & ^ | <= < > >= <=> == === =~
(+@ -@ for unary + and -, != and !~ are automatically defined as not ==, =~)
Summary:
- pre-unary: ! ~ +@ -@
- operators: [] []= ** + - * / % >> << & ^ | <= < > >= <=> == === =~
  (note: the Comparable mixin uses <=> to implement the conventional comparison operators (<, <=, ==, >=, and >) and the method between?.)
Rem: one can define pre-unary * and & as a hack by implementing to_a and
to_proc respectively

Assignement like:
anObj = A.new anObj.value = "hello" # equivalent to anObj.value=("hello")

Array shortcuts:
anObj[] = "one"                 anObj.[]=("one")
anObj[1] = "two"                anObj.[]=(1, "two")
anObj["a", /^cat/] = "three"    anObj.[]=("a", /^cat/, "three")

For a method operator:
expr1 postop => (expr1).postop
unary expr1 => (expr1).unary
expr1 operator expr2 => (expr1).operator(expr2)
~~~ ruby
s="ploum"
def s.[](*args) args; end
s [2] #=> [2]
s[] #=> []
~~~
# }}}1

# Variables
# Variable assignment {{{1
ploum.plam=plim est équivalent à ploum.plam=(plim) sauf que dans
a=ploum.plam=plim, la valeur de a c'est plim, pas ce que retourne
plam=(plim).

~~~ ruby
class Ploum
  def initialize(n) @a=n end
  def a=(n) @a=n; return 10; end
end
p=Ploum.new(5)
p.a=2 #=> 2
p.a=(2) #=> 2
p.send(:'a=', 2) #=> 10
~~~
(Note amusante, ça marche aussi pour a.[]=(4,5) dans ce cas on a la valeur
de retour)
# Remove variables {{{1
remove_instance_variable
remove_class_variable
remove_const
undef method
(rien pour les variables locales (mais r=nil suffit en gal))
# Class variables {{{1
Class variables belong to the innermost enclosing class or module. Class
variables used at the top level are defined in Object and behave like global
variables. Class variables defined within singleton methods belong to the top
level (although this usage is deprecated and generates a warning). In Ruby 1.9,
class variables are private to the defining class:

~~~ ruby
class Holder
  @@var = 99
  def Holder.var=(val)
    @@var = val
  end
  def var
    @@var
  end
end
a = Holder.new
a.var # => "top level variable"
Holder.var = 123
a.var # => 123
# This references the top-level object
@@var = "top level variable"
a.var #=>"top level variable" (because Holder is a subclass of Object it inherites @@var from main)
def a.get_var
  @@var
end
a.get_var # => "top level variable" (unlike a.var, would not have worked before defining @@var in Object)
~~~

Class variables are inherited by children but are unique across children:

~~~ ruby
class Top
  @@A = 1
  @@B = 1
  def dump
    puts values
  end
  def values
    "#{self.class.name}: @@A = #@@A, @@B = #@@B"
  end
end
class MiddleOne < Top
  @@B = 2
  @@C = 2
  def values
    super + ", @@C = #@@C"
  end
end
class MiddleTwo < Top
  @@B = 3
  @@C = 3
  def values
    super + ", @@C = #@@C"
  end
end
class BottomOne < MiddleOne; end
class BottomTwo < MiddleTwo; end
Top.new.dump
MiddleOne.new.dump
MiddleTwo.new.dump
BottomOne.new.dump
BottomTwo.new.dump
produces:
Top: @@A =1, @@B=3
MiddleOne: @@A =1, @@B=3, @@C=2
MiddleTwo: @@A =1, @@B=3, @@C=3
BottomOne: @@A =1, @@B=3, @@C=2
BottomTwo: @@A =1, @@B=3, @@C=3
~~~

# Binding and eval {{{1
http://ruby-doc.org/core-2.2.2/Binding.html
Objects of class Binding encapsulate the execution context at some particular place in the code and retain this context for future use. The variables, methods, value of self, and possibly an iterator block that can be accessed in this context are all retained. Binding objects can be created using Kernel#binding, and are made available to the callback of Kernel#set_trace_func.
[For illustrations of each of these, cf
http://stackoverflow.com/questions/15630715/need-help-on-binding-objects]

Kernel#binding creates a binding representing the current binding, while
TOP_LEVEL_BINDING refer to the top level binding (the binding of 'main')

These binding objects can be passed as the second argument of the Kernel#eval method, establishing an environment for the evaluation.
~~~ ruby
class Demo
  def initialize(n)
    @secret = n
  end
  def get_binding
    return binding()
  end
end

k1 = Demo.new(99)
b1 = k1.get_binding
k2 = Demo.new(-3)
b2 = k2.get_binding

eval("@secret", b1)   #=> 99
eval("@secret", b2)   #=> -3
eval("@secret")       #=> nil
~~~

If a variable 'foo' is available in the binding, evaluating 'foo="bar"'
will also update the original foo (because variables are pointers). But
evaluating 'foo2="bar"' creates foo2 only in the binding.
Defining method affect klass (so propagates to the original klass), and
constants and global variables are also propagated globally.

In term of encapsulation:
- eval(string): affects everything in the binding (which is created from
  the current binding by default). So 'eval "new_var_name=2"' will not
  propagate 'new_var_name' to the global binding
- p=eval("Proc.new { #{string} }"): this creates a proc that can then be
  called or used via 'context.instance_eval(&p)' to provide a different
  'self' to the evaluated string.
  [Remember that instance_eval will also pass self as a parameter to the
  proc, so one could access the contect via
  p=eval("Proc.new { |_context| #{string} }"]
  If using p.call directly, then this pass the current self and klass to
  the block.

  Note: There is not much value to wrap into a proc, since
  instance_eval("string") and instance_eval(&_proc) seems to have
  the same effect on binding. Essentially, it allows to:
  - pass _context to _src (but we have 'self' already)
  - to set up block local $SAFE level
  - to use break while this is not possible with a string

- eval "Module.new { #{string} }": the methods defined in string only
  affect the anonymous module. By contrast with the previous
  'instance_eval' method they would affect the singleton_class of context.

Block local variables: |block_variables... ; local_variables...|

# Global Symbol variables in ruby {{{1
$!      ->      $ERROR_INFO
    The exception object passed to raise.
$@      ->      $ERROR_POSITION
    The stack backtrace generated by the last exception. See Kernel.caller for details. Thread local.
$;      ->      $FS
    The default separator pattern used by String.split. May be set from the command line using the -F flag.
$;      ->      $FIELD_SEPARATOR
    The default separator pattern used by String.split. May be set from the command line using the -F flag.
$,      ->      $OFS
    The separator string output between the parameters to methods such as Kernel.print and Array.join. Defaults to nil, which adds no text.
$,      ->      $OUTPUT_FIELD_SEPARATOR
    The separator string output between the parameters to methods such as Kernel.print and Array.join. Defaults to nil, which adds no text.
$/      ->      $RS
    The input record separator (newline by default). This is the value that routines such as Kernel.gets use to determine record boundaries. If set to nil, gets will read the entire file.
$/      ->      $INPUT_RECORD_SEPARATOR
    The input record separator (newline by default). This is the value that routines such as Kernel.gets use to determine record boundaries. If set to nil, gets will read the entire file.
$\      ->      $ORS
    The string appended to the output of every call to methods such as Kernel.print and IO.write. The default value is nil.
$\      ->      $OUTPUT_RECORD_SEPARATOR
    The string appended to the output of every call to methods such as Kernel.print and IO.write. The default value is nil.
$.      ->      $INPUT_LINE_NUMBER
    The number of the last line read from the current input file.
$.      ->      $NR
    The number of the last line read from the current input file.
`$_      ->      $LAST_READ_LINE`
    The last line read by Kernel.gets or Kernel.readline. Many string-related functions in the Kernel module operate on $_ by default. The variable is local to the current scope. Thread local.
$>      ->      $DEFAULT_OUTPUT
    The destination of output for Kernel.print and Kernel.printf. The default value is $stdout.
$<      ->      $DEFAULT_INPUT
    An object that provides access to the concatenation of the contents of all the files given as command-line arguments, or $stdin (in the case where there are no arguments). $< supports methods similar to a File object: inmode, close, closed?, each, each_byte, each_line, eof, eof?, file, filename, fileno, getc, gets, lineno, lineno=, path, pos, pos=, read, readchar, readline, readlines, rewind, seek, skip, tell, to_a, to_i, to_io, to_s, along with the methods in Enumerable. The method file returns a File object for the file currently being read. This may change as $< reads through the files on the command line. Read only.
$$      ->      $PID
    The process number of the program being executed. Read only.
$$      ->      $PROCESS_ID
    The process number of the program being executed. Read only.
$?      ->      $CHILD_STATUS
    The exit status of the last child process to terminate. Read only. Thread local.
$~      ->      $LAST_MATCH_INFO
    A MatchData object that encapsulates the results of a successful pattern match. The variables $&, $`, $’, and $1 to $9 are all derived from $~. Assigning to $~ changes the values of these derived variables. This variable is local to the current scope. Thread local.
$=      ->      $IGNORECASE
    If set to any value apart from nil or false, all pattern matches will be case insensitive, string comparisons will ignore case, and string hash values will be case insensitive. Deprecated
`$*      ->      $ARGV`
    An array of strings containing the command-line options from the invocation of the program. Options used by the Ruby interpreter will have been removed. Read only. Also known simply as ARGV.
$&      ->      $MATCH
    The string matched by the last successful pattern match. This variable is local to the current scope. Read only. Thread local.
$`      ->      $PREMATCH
    The string preceding the match in the last successful pattern match. This variable is local to the current scope. Read only. Thread local.
$'      ->      $POSTMATCH
    The string following the match in the last successful pattern match. This variable is local to the current scope. Read only. Thread local.
$+      ->      $LAST_PAREN_MATCH
    The contents of the highest-numbered group matched in the last successful pattern match. Thus, in "cat" =~ /(c|a)(t|z)/, $+ will be set to "t". This variable is local to the current scope. Read only. Thread local.

Exception Information
=====================

$! Exception The exception object passed to raise. [thread]
$@ Array The stack backtrace generated by the last exception. See Kernel#caller on page 567 for details. [thread]

https://stackoverflow.com/questions/3829157/how-to-get-a-stack-trace-object-in-ruby
backtrace: Kernel#caller # Array of strings
           Kernel#caller_locations # Array of Thread::Backtrace::Location objects => more precise locations

For an exception e: e.backtrace, e.backtrace_locations

Pattern Matching Variables
=========================
These variables (except $=) are set to nil after an unsuccessful pattern match.

$& String The string matched (following a successful pattern match). This
variable is local to the current scope. [r/o, thread]

$+ String The contents of the highest-numbered group matched following a
successful pattern match. Thus, in "cat" =~/(c|a)(t|z)/, $+ will be set to “t.”
This variable is local to the current scope. [r/o, thread]

$` String The string preceding the match in a successful pattern match. This
variable is local to the current scope. [r/o, thread]

$' String The string following the match in a successful pattern match. This
variable is local to the current scope. [r/o, thread]

$1. . . $n String The contents of successive groups matched in a successful
pattern match. In "cat" =~/(c|a)(t|z)/, $1 will be set to “a” and $2 to “t.”
This variable is local to the current scope. [r/o, thread]

$~ MatchData An object that encapsulates the results of a successful pattern
match. The variables $&, $`, $', and $1 to $9 are all derived from $~.
Assigning to $~ changes the values of these derived variables. This variable is
local to the current scope. [thread] The variable $=, which previously
controlled case-insensitive matches, has been removed from Ruby 1.9.

Input/Output Variables
=====================

$/ String The input record separator (newline by default). This is the value
that routines such as Kernel#gets use to determine record boundaries. If set to
nil, gets will read the entire file.

$-0 String Synonym for $/.

$\ String The string appended to the output of every call to methods such as
Kernel#print and IO#write. The default value is nil.

$, String The separator string output between the parameters to methods such as
Kernel#print and Array#join. Defaults to nil, which adds no text.

$. Fixnum The number of the last line read from the current input file.

$; String The default separator pattern used by String#split. May be set from
the command line using the -F flag.

$< Object An object that provides access to the concatenation of the contents
of all the files given as command-line arguments or $stdin (in the case where
there are no argu- ments). $< supports methods similar to a File object:
binmode, close, closed?, each, each_byte, each_line, eof, eof?, file, filename,
fileno, getc, gets, lineno, lineno=, path, pos, pos=, read, readchar, readline,
readlines, rewind, seek, skip, tell, to_a, to_i, to_io, to_s, along with the
methods in Enumerable. The method file returns a File object for the file
currently being read. This may change as $< reads through the files on the
command line. [r/o]

$> IO The destination of output for Kernel#print and Kernel#printf. The default
value is $stdout.

$_ String The last line read by Kernel#gets or Kernel#readline. Many
string-related functions in the Kernel module operate on $_ by default. The
variable is local to the current scope. [thread]

$-F String Synonym for $;.

$stderr IO The current standard error output.

$stdin IO The current standard input.

$stdout IO The current standard output. Assignment to $stdout is not permitted:
use $stdout.reopen instead.
The variables $defout and $deferr have been removed from Ruby 1.9.

Execution Environment Variables
===============================

$0 String The name of the top-level Ruby program being executed. Typically this
will be the program’s filename. On some operating systems, assigning to this
variable will change the name of the process reported (for example) by the
ps(1) command.

$* Array An array of strings containing the command-line options from the
invocation of the program. Options used by the Ruby interpreter will have been
removed. [r/o]

$" Array An array containing the filenames of modules loaded by require. [r/o]

$$ Fixnum The process number of the program being executed. [r/o]

$? Process::Status The exit status of the last child process to terminate.
[r/o, thread]

$: Array An array of strings, where each string specifies a directory to be
searched for Ruby scripts and binary extensions used by the load and require
methods. The initial value is the value of the arguments passed via the -I
command-line option, followed by an installation-defined standard library
location, followed by the current directory (“.”). This variable may be set
from within a program to alter the default search path; typically, programs use

$: << dir to append dir to the path. [r/o]

$-a Object True if the -a option is specified on the command line. [r/o] _
_callee_ _ Symbol The name of the lexically enclosing method.

$-d Object Synonym for $DEBUG.

$DEBUG Object Set to true if the -d command-line option is specified.

__ENCODING__ String The encoding of the current source file. [r/o]

__FILE__ String The name of the current source file. [r/o]

$F Array The array that receives the split input line if the -a command-line option is used.

$FILENAME String The name of the current input file. Equivalent to $<.filename.
[r/o]

$-i String If in-place edit mode is enabled (perhaps using the -i command-line
option), $-i holds the extension used when creating the backup file. If you set
a value into $-i, enables in-place edit mode. See page 235.

$-I Array Synonym for $:. [r/o]

$-l Object Set to true if the -l option (which enables line-end processing) is present on the command line. See page 235. [r/o]

__LINE__ String The current line number in the source file. [r/o]

$LOAD_PATH Array A synonym for $:. [r/o]

$LOADED_FEATURES Array Synonym for $". [r/o]

__method__ Symbol The name of the lexically enclosing method.

$PROGRAM_NAME String Alias for $0.

$-p Object Set to true if the -p option (which puts an implicit while gets . .
. end loop around your program) is present on the command line. See page 235.
[r/o]

$SAFE Fixnum The current safe level (see page 437). This variable’s value may never be reduced by assignment. [thread]

$VERBOSE Object Set to true if the -v, --version, -W, or -w option is specified
on the command line. Set to false if no option, or -W1 is given. Set to nil if
-W0 was specified. Setting this option to true causes the interpreter and some
library routines to report additional information. Setting to nil suppresses
all warnings (including the output of Kernel.warn).
$-v Object Synonym for $VERBOSE.
$-w Object Synonym for $VERBOSE.

$-W Object Return the value set by the -W command-line option.

Standard Objects
================

ARGF Object A synonym for $<. #http://ruby-doc.org/core-1.9.3/ARGF.html
#ie concatenate ARGV arguments (as files) or use STDIN

ARGV Array A synonym for $*.

ENV Object A hash-like object containing the program’s environment variables.
An instance of class Object, ENV implements the full set of Hash methods. Used
to query and set the value of an environment variable, as in ENV["PATH"] and
ENV["term"]="ansi".

false FalseClass Singleton instance of class FalseClass. [r/o]

nil NilClass The singleton instance of class NilClass. The value of
uninitialized instance and global variables. [r/o]

self Object The receiver (object) of the current method. [r/o]

true TrueClass Singleton instance of class TrueClass. [r/o]

Global Constants
================

The following constants are defined by the Ruby interpreter.

DATA IO
If the main program file contains the directive __END__, then the con-
stant DATA will be initialized so that reading from it will return lines
following __END__ from the source file.

FALSE FalseClass Constant containing reference to false.

NIL NilClass Constant containing reference to nil.

RUBY_COPYRIGHT String The interpreter copyright.

RUBY_DESCRIPTION String Version number and architecture of the interpreter.

RUBY_ENGINE String The name of the Ruby interpreter. Returns ruby for Matz’s
version. Other interpreters include macruby, ironruby, jruby, and rubinius.

RUBY_PATCHLEVEL String The patch level of the interpreter.

RUBY_PLATFORM String The identifier of the platform running this program. This
string is in the same form as the platform identifier used by the GNU configure
utility (which is not a coincidence).

RUBY_RELEASE_DATE String The date of this release.

RUBY_REVISION String The revision of the interpreter.

RUBY_VERSION String The version number of the interpreter.

STDERR IO The actual standard error stream for the program. The initial value
of $stderr.

STDIN IO The actual standard input stream for the program. The initial value of
        $stdin.

STDOUT IO The actual standard output stream for the program. The initial value
of $stdout.

SCRIPT_LINES_ _ Hash If a constant SCRIPT_LINES__ is defined and references a
Hash, Ruby will store an entry containing the contents of each file it parses,
with the file’s name as the key and an array of strings as the value. See Ker-
nel.require on page 576 for an example.

TOPLEVEL_BINDING Binding A Binding object representing the binding at Ruby’s
top level—the level where programs are initially executed. (ie the binding
of 'main')

TRUE TrueClass A reference to the object true.

The constant _ _FILE_ _ and the variable $0 are often used together to run code
only if it appears in the file run directly by the user. For example, library
writers often use this toinclude tests in their libraries that will be run if
the library source is run directly, but not if the source is required into
another program.
~~~ ruby
# library code
# ...
if __FILE__ == $0
# tests...
end
~~~
#}}}1

# Objects, Class and Modules
# Test the class type {{{1
obj.is_a?(klass) #equivalent: obj.kind_of?(klass), test if self is an instance of klass (or a subclass)
klass === obj #not equivalent to obj === klass, === is only defined in Module in general to test for class appartenance

instance_of?(klass) test if self is an instance of klass

Equality: ===, ==, eql? (usually synonymous to ==), equal?

# Removing methods {{{1
Class#remove_method vs Class#undefine_method:
undefine_method =>
  Prevents the current class from responding to calls to the named
  method. Contrast this with remove_method, which deletes
  the method from the particular class; Ruby will still search
  superclasses and mixed-in modules for a possible receiver.
  String arguments are converted to symbols.

~~~ ruby
   class Parent
     def hello
       puts "In parent"
     end
   end
   class Child < Parent
     def hello
       puts "In child"
     end
   end
   c = Child.new
   c.hello
   #=> In child

   class Child
     remove_method :hello  # remove from child, still in parent
   end
   c.hello
   #=> In parent

   class Child
     undef_method :hello   # prevent any calls to 'hello'
   end
   c.hello
   #=> prog.rb:23: undefined method `hello' for #<Child:0x401b3bb4> (NoMethodError)
~~~

# Metaprogramming methods {{{1
Small overview: http://www.shopify.com/technology/17370004-theres-more-to-ruby-debugging-than-puts

Module
------
Module Instance methods:
ancestors, class_eval(=module_eval), {class,module}_exec (comme class_eval
mais prend seulement un block alors que class_eval peut prendre un string)
class_variable_{defined?,get,set}(symbol), class_variables, remove_class_variable
const_{defined?,get,missing,set}, constants, remove_const
include?, included_modules
extended, included
{private,protected,public,}_{class,instance}_method{,s,_defined?}(symbol),

Module private instance method:
alias_method, attr_accessor, extend_object (callback called by Object#extend)
define_method, {remove,undef}_method module_function (copy a
module function into an instance method of its singleton class)
extended,included,include,method_{added,removed,undefined},
private,public,protected

Class
-----
Class methods: constants, nesting

Class private instance methods: inherited

BasicObject
-----------
BasicObject public instance methods: instance_{eval,exec}, object_id, send,
__send__

BasicObject private instance methods: method_missing,
singleton_method_{added,removed,undefined}

Object
------
Object public instance method: define_singleton_method, extend,
instance_variable{_defined?, _get, _set, s}, {public_,}method, public_send, send, respond_to?, respond_to_missing (called by respond_to? when the method is missing)
singleton_class, singleton_methods,

Object private instance method: remove_instance_variable

Kernel
------
Kernel public instance methods: global_variables, local_variables, method

# Examples {{{2
- instance_eval(string [, filename [, lineno]] ) => obj
  instance_eval {| | block } => obj

  Evaluates a string containing Ruby source code, or the given block,
  within the context of the receiver (obj). In order to set the context,
  the variable self is set to obj while the code is executing, giving the
  code access to obj’s instance variables. In the version of instance_eval
  that takes a String, the optional second and third parameters supply a
  filename and starting line number that are used when reporting
  compilation errors.
  
  ~~~ ruby
  class Klass
    def initialize
      @secret = 99
    end
  end
  k = Klass.new
  k.instance_eval { @secret }   #=> 99
  ~~~

- method(sym)

  Looks up the named method as a receiver in obj, returning a Method object
  (or raising NameError). The Method object acts as a closure in obj’s object
  instance, so instance variables and the value of self remain available.

  ~~~ ruby
  s="foo"
  class << s
    def foo; p self; end
  end  
  m=s.method(:foo) # => #<Method: "foo".foo>
  m.call #=> "foo"
  ~~~

- send(symbol [, args...]) => obj click to toggle source
  __send__(symbol [, args...]) => obj

  Invokes the method identified by symbol, passing it any arguments
  specified. You can use __send__ if the name send clashes with an existing
  method in obj.
#}}}1
# Hooks {{{1
see: http://stackoverflow.com/questions/5127819/is-this-a-comprehensive-list-of-ruby-hook-methods

Method-related hooks
--------------------
method_missing
method_added
singleton_method_added
method_removed
singleton_method_removed
method_undefined
singleton_method_undefined

Class & Module Hooks
--------------------
inherited
append_features
included
extend_object
extended
initialize_copy
const_missing

Marshalling Hooks
-----------------
marshal_dump
marshal_load

Coercion Hooks
--------------
coerce
induced_from
to_xxx

Divers
------
respond_to_missing?
Kernel.trace_var
# Refinements {{{1
http://timelessrepo.com/refinements-in-ruby
http://ruby-doc.org//core-2.2.0/doc/syntax/refinements_rdoc.html
https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/RefinementsSpec

~~~ ruby
class C
  def foo
    puts "C#foo"
  end
end

refined=module M
  refine C do
    def foo
      puts "C#foo in M"
    end
  end
end
refined # <refinement:C@M>
refined.ancestors #[#<refinement:C@M>, C, Object, Kernel, BasicObject]

using M
x = C.new
c.foo #=> C#foo in M
~~~
refine: private method of Module: Module#refine(klass, &block)
klass has to be a Class
in the block, the passed parameter is an anonymous module (with a special
flag to indicate it is a refinement module). If the same class is refined
several time, the same anonymous module is given in each block (so
older definitions are kept). refine returns the refined module

using: singleton method of 'main', so can only be used at the top level.
Refinements are then in effect until the end of the file (it does not
propagates to load or require).
(exception with eval "string", if string contains a 'using', the refinement
is activated until the end of the string.)
Since ruby 2.2, You may also activate refinements in a class or module definition, in which case the refinements are activated from the point where using is called to the end of the class or module definition.

Refinements activated after using are lexical, ie only affects C#foo
calls after using:
~~~ ruby
def call_foo(x)
  x.foo
end
using M
x=C.new
x.foo #=> "C#foo in M"
call_foo(x) #=> "C#foo"
~~~
If a method is defined in a scope where a refinement is active the refinement will be active when the method is called.

Also refinements are active inside the refine block itself:
when defining multiple refinements in the same module, inside a refine block all refinements from the same module are active when a refined method is called.

-> Method Lookup:
When looking up a method for an instance of class C Ruby checks:
- If refinements are active for C, in the reverse order they were activated:
  - The prepended modules from the refinement for C
  - The refinement for C
  - The included modules from the refinement for C
- The prepended modules of C
- C
- The included modules of C
- If no method was found at any point this repeats with the superclass of C.

Note that methods in a subclass have priority over refinements in a superclass.

-> super:
When super is invoked method lookup checks:
- The included modules of the current class. Note that the current class may be a refinement.
- If the current class is a refinement, the method lookup proceeds as in the Method Lookup section above.
- If the current class has a direct superclass, the method proceeds as in the Method Lookup section above using the superclass.

Note that super in a method of a refinement invokes the method in the refined class even if there is another refinement which has been activated in the same context.
ie all happen (cf the source code) as if the refinement module had the original class as the superclass

Restrictions:
- refine accept only a block, not a proc, ie refine(klass,&b) will not work
(but see below about using module_eval to sidestep the problem).
- using can only be used in a class scope, not inside a method
- only since ruby 2.4 does send and method_defined? honor refinements

Refinements hacks:
- https://www.new-bamboo.co.uk/blog/2014/02/05/refinements-under-the-knife/
- http://stackoverflow.com/questions/18551058/better-way-to-turn-a-ruby-s-into-a-module-than-using-refinements
  (use the module returned by refine do... to 'convert' a class into a module)
  See meta_ext.rb
- http://stackoverflow.com/questions/28649472/ruby-refinements-subtleties

using is orthogonal to include; with 'include module' we include all
the instance methods of module, while with 'using module' we activate all
refinements defined in module.
We could of course include a refinement module direcly (rather than the module
containing the refinement module), but we could not 'use' it directly ('using'
activate all refinements in the refinement table of the enclosing module)
~~~ ruby
#From meta_ext.rb:
#From http://stackoverflow.com/questions/18551058/better-way-to-turn-a-ruby-s-into-a-module-than-using-refinements
#See http://stackoverflow.com/questions/28649472/ruby-refinements-subtleties
#for an explanation on why we use module_eval instead of yield: yield
#does not change 'self' and 'klass' so the methods defined in the block
#would be on the receiver, not the anonymous module
#
#convert a class into a module using refinements
#ex: (Class.new { include Meta.refined_module(String) { def length; super+5; end } }).new("foo").length #=> 8

def refined_module(klass,&b)
  klass=klass.singleton_class unless Module===klass
  Module.new do
    #note: we could use 'return refine' instead of 'include refine'
    #this would still work with 'include', but not with 'using' (which require an enclosing module on the refinement module, cf the spec)
    include refine(klass) {
      module_eval(&b) if block_given?
    }
  end
end

class Base
  def foo
    "foo"
  end
end
class Receiver
  include refined_module(Base) {
    def foo
      "refined " + super
    end
  }
end
Receiver.new.foo #=> "refined foo"
Receiver.ancestors #=> [Receiver, #<refinement:Base@#<Module:0x00000004437048>>, Base, Object, BasicObject, Object, Kernel, BasicObject]

class RefinedString
  using refined_module(String) {
    def to_thing
      self+"foo"
    end
  }

  def foo(str)
    str.to_thing
  end
end
RefinedString.new.foo("test") #=> testfoo
RefinedString.ancestors #[RefinedString, Object, Kernel, BasicObject]
#using does not change the ancestors of RefinedString
~~~
# }}}1

# Functional:
# yield {{{1

~~~ ruby
def Class.run
  yield
end
Class.run { def foo; "foo"; end }
~~~

Inside the yield, the context (self, klass, binding and cref) are those of
the block (because it is a closure). So in the yield 'self=main,
klass=Object' and foo is defined on the toplevel.

# proc vs lambda {{{1
lambda {|x| ...} #lambda
->x{...}
Proc.new {|x| ...} #proc
proc {|x| ...}

Différence entre blocks et lambda
---------------------------------

Les variables des blocks sont optionelles, on peut en passer autant qu'on
veut, alors que les lambda se comportent comme les méthodes, ie il faut que
le nombre de variable match l'arity.
De plus bien sûr 'return' dans un proc fait un vrai return dans la méthode,
alors que dans un lambda ça ne return que dans le lambda.
Ex: pr=Proc.new {|x,y| p x,y}
pr.call(2) #=> 2, nil
pr.call(2,3,4) #=> 2, 3

http://stackoverflow.com/questions/1435743/why-does-explicit-return-make-a-difference-in-a-proc
Ruby has three keywords which return from something:
- return - returns from the method or lambda in which it is written
  [return sort de la méthode dans un block ou un proc, et du lambda dans un lambda]
- next - returns from the block/proc/lambda it is in
- break - returns from the method that yields to the block/invokes the proc/lambda it is in
  [break sort de la méthode dans un lambda ou un block, ne marche pas dans un proc: LocalJumpError: break from proc-closure]
next and break are named the way they are because they are most commonly used with methods like each where returning from the block will cause the iteration to resume with the next element of the collection and returning from each will cause you to break out of the loop.
Ex:
m=[1,2,3].map {|i| next 0 if i==2; i} #=>[1,0,3]
m=[1,2,3].map {|i| break 0 if i==2; i} #=>0
m=[1,4,3].map {|i| break 0 if i==2; i} #=>[1,4,3]
Résumé: 
- block#return=proc#return = block#break=lambda#break
- block#next=proc#next=lambda#next=lambda#return

proc(=Proc.new dans ruby>1.9) ne fait pas une cloture:
x=0; l=proc {|y| x+y}; x=1; l.call(3) #=>4
x=0; l=lambda {|y| x+y}; x=1; l.call(3) #=>3
[update: I now get 4 for the lambda too, wtf?]
et dans les deux cas:
x=0; l=lambda {|y| x=y}; l.call(2); x #=>2
il faut définir que x est une variable locale via |;...|:
x=0; l=proc {|y;x| x=y}; l.call(2); x #=>0
#}}}1
# Functional programming {{{1
- How to call a lambda:
l=->(x,y){[x,y]} #or l=lambda {|x,y| [x,y]}
l.call(1,2)
l[1,2]
l.(1,2) #since ruby 1.9
l::(1,2)

- Proc#curry: http://blog.khd.me/ruby/ruby-currying/
sum = lambda do |f,a,b|
  s = 0 ; a.upto(b){|n| s += f.(n) } ; s
end
sum_of_squares = sum.curry.(lambda{|x| x**2})
sum_of_squares.(1,5) #=> 55

l=->(x,y,z){[x,y,z]}
f=l.curry.(1).(2) #curryied functions can yield curryied functions
f.(3) #[1,2,3]

- Monades
[implems]
- https://github.com/tomstuart/monads
-> http://codon.com/refactoring-ruby-with-monads
- https://github.com/pzol/monadic
  https://github.com/pzol/deterministic
- https://github.com/ms-ati/rumonade
- https://github.com/txus/kleisli
  https://github.com/mushishi78/consequence

Ideas from the Maybe monad yield https://github.com/raganwald/andand
A better implementation of andand could be
~~~ ruby
class Object
  def andand(*args, method:nil)
    return self if self.nil?
    if method
      method.to_proc.call(*args)
    else
      yield(*args)
    end
  end
end
~~~
See also activesupport try:
https://github.com/rails/rails/blob/3b7d8351f66c7169242f38aed99f4c60f152562f/activesupport/lib/active_support/core_ext/object/try.rb#L71

- Y-Combinator
Recursive hash: http://www.sbf5.com/~cduan/technical/ruby/ycombinator.shtml
~~~ ruby
class AVHash < Hash
    def initialize
        super { |h,k| h[k] = AVHash.new }
    end
end
#or
hash = proc {|;make_hash|
    make_hash = proc {
        Hash.new { |h, k| h[k] = make_hash.call }
    }
    make_hash.call
}.call
#=> hash[2][3][:ploum] works!
#Simpler:
hash = Hash.new {|h,k| h[k] = h.class.new(&h.default_proc) }
#Hash.new(&proc): If a block is specified, it will be called with the hash object and the key, and should return the default value.
~~~
#}}}1

# Input/Output:
# Print/Read {{{1
1)
p ploum does puts ploum.inspect (ie for debugging)
puts ploum use ploum.to_s

2)
print outputs each argument (followed by $,) to $stdout (ending with $\.) It
is equivalent to args.join($,) + $\

puts sets both $, and $\ to "\n" and then does the same thing as print. The
key difference being that each argument is a new line with puts.

3) Same difference between file.write or file.print and file.puts
Rem: n=IO.write("ploum") give the number of char written
while IO.print("ploum","plam") can take several arguments but have no
return value

4) Cf aussi display (public method of class Object) and inspect:

display(port=$>) => nil

 Prints obj on the given port (default $>). Equivalent to:
 def display(port=$>)
   port.write self
 end

inspect => string

  Returns a string containing a human-readable representation of obj. If
  not overridden, uses the to_s method to generate the string.

(la différence entre inspect et display sont le type de retour, ie un
string pour inspect vs effet de bord pour display)

So: port.write(obj) vs obj.display(port)

5) lines=IO.readlines(sep=$/): read lines in an array
   IO.read: read all of the file, IO.read(10) reads 10 char
   IO.gets(sep=$/): read next line (a line is given by the separator $/)
# Interpolating strings: {{{1
(% est un raccourci pour sprintf)

    mystring = "There are %<thing1>s and %<thing2>s here."
    => "There are %<thing1>s and %<thing2>s here."
    vars = {:thing1 => "trees", :thing2 => "houses"}
    => {:thing1=>"trees", :thing2=>"houses"}
    mystring % vars
    => "There are trees and houses here."

    "[%s]" % "same old drag" # => "[same old drag]"
     x = %w{p hello p}
     "<%s>%s</%s>" % x # => "<p>hello</p>"

    "%05d" % 123                              #=> "00123"
    "%-5s: %08x" % [ "ID", self.object_id ]   #=> "ID   : 200e14d6"
    "foo = %{foo}" % { :foo => 'bar' }        #=> "foo = bar"

    #%<name> support format string, but not %{name}
    sprintf("%<foo>d : %<bar>f", { :foo => 1, :bar => 2 }) #=> 1 : 2.000000
    sprintf("%{foo}f", { :foo => 1 }) #=> "1f

# Evaluating keyword arguments into instance variables: 
http://stackoverflow.com/questions/18876592/set-ruby-2-0-keyword-arguments-with-attr-accessor-on-initialize

~~~ ruby
def initialize(*args)
  args.each do |k,v|
    instance_variable_set("@#{k}", v) unless v.nil?
  end
end
#with keywords:
def initialize(keywords: nil, title: nil, url: nil, adsetting: nil)
  method(__method__).parameters.each do |type, k|
    next unless type == :key
    v = eval(k.to_s)
    instance_variable_set("@#{k}", v) unless v.nil?
  end
end
~~~

# Open modes {{{1
http://stackoverflow.com/questions/3682359/what-are-the-ruby-file-open-modes-and-options
Mode |  Meaning
-----+--------------------------------------------------------
"r"  |  Read-only, starts at beginning of file  (default mode).
-----+--------------------------------------------------------
"r+" |  Read-write, starts at beginning of file.
-----+--------------------------------------------------------
"w"  |  Write-only, truncates existing file
     |  to zero length or creates a new file for writing.
-----+--------------------------------------------------------
"w+" |  Read-write, truncates existing file to zero length
     |  or creates a new file for reading and writing.
-----+--------------------------------------------------------
"a"  |  Write-only, starts at end of file if file exists,
     |  otherwise creates a new file for writing.
-----+--------------------------------------------------------
"a+" |  Read-write, starts at end of file if file exists,
     |  otherwise creates a new file for reading and
     |  writing.
-----+--------------------------------------------------------
 "b" |  Binary file mode (may appear with
     |  any of the key letters listed above).
     |  Suppresses EOL <-> CRLF conversion on Windows. And
     |  sets external encoding to ASCII-8BIT unless explicitly
     |  specified.
-----+--------------------------------------------------------
 "t" |  Text file mode (may appear with
     |  any of the key letters listed above except "b").
# }}}1
# Taint / Trust {{{1

trust/untrust is deprecated since ruby 2.2 and are aliased to taint/untaint

taint/untaint: depends on the $SAFE level
http://stackoverflow.com/questions/12165664/what-are-the-rubys-objecttaint-and-objecttrust-methods
http://phrogz.net/ProgrammingRuby/taint.html (more details at the end of
the webpage):
$SAFE 	Constraints
0 	No checking of the use of externally supplied (tainted) data is performed. This is Ruby's default mode.
>= 1 	Ruby disallows the use of tainted data by potentially dangerous operations.
>= 2 	Ruby prohibits the loading of program files from globally writable locations.
>= 3 	All newly created objects are considered tainted.
>= 4 	Ruby effectively partitions the running program in two. Nontainted objects may not be modified. Typically, this will be used to create a sandbox: the program sets up an environment using a lower$SAFE level, then resets $SAFE to 4 to prevent subsequent changes to that environment.

# }}}1

# New in ruby {{{1
2.7.0:
foo.:bar #-> foo.method(:bar)
2.6.0:
- then as alias to yield_self
  "foo".tap {|s| s+"bar"} #foo
  "foo".then {|s| s+"bar"} #foobar
- endless ranges
- Enumerable#chain and Enumerator#+
- function composition operators << and >> to Proc and Method.
- Range#=== now use 'cover?' rather than 'include?'
  ('1.8.7'..'2.5').include?('2.3') #false
  ('1.8.7'..'2.5').cover?('2.3') #true
2.5.0:
- yield_self
  "foo".itself => return self
  "foo".tap {|b| ...} => discard the value of the block
  "foo".yield_self {|b| ...} => return the value of the block
- rescue/else/ensure are now allowed to be used directly with do/end blocks
2.3.0:
- .&foo (safe navigation operator)
2.2.0:
- Method#curry
  l=->(x,y,z) {x+y+z}; m=l.curry; m.(2).(3).(5); m.(2,3).(5)
2.1.0:
- Added suffixes for integer and float literals: 'r', 'i', and 'ri'.
- refinements
}}}1

# Options {{{1

-e command     Specify script from command line

-c             Causes Ruby to check the syntax of the script and exit
               without executing. If there are no syntax errors, Ruby
               will print “Syntax OK” to the standard output.


-w             Enables verbose mode without printing version message at
               the beginning.  It sets the $VERBOSE variable to true.

-l             (The lowercase letter “ell”.)  Enables automatic line-end‐
               ing processing, which means to firstly set $\ to the value
               of $/, and secondly chops every line read using chop!.

-n             Causes Ruby to assume the following loop around your
               script, which makes it iterate over file name arguments
               somewhat like sed -n or awk.

                     while gets
                       ...
                     end

-p             Acts mostly same as -n switch, but print the value of
               variable $_ at the each end of the loop.  For example:

                     % echo matz | ruby -p -e '$_.tr! "a-z", "A-Z"'
                     MATZ

-i extension   Specifies in-place-edit mode.  The extension, if speci‐
               fied, is added to old file name to make a backup copy.
               For example:

                     % echo matz > /tmp/junk
                     % cat /tmp/junk
                     matz
                     % ruby -p -i.bak -e '$_.upcase!' /tmp/junk
                     % cat /tmp/junk
                     MATZ
                     % cat /tmp/junk.bak
                     matz

-a             Turns on auto-split mode when used with -n or -p.  In
               auto-split mode, Ruby executes
                     $F = $_.split
               at beginning of each loop.

-F pattern     Specifies input field separator ($;).

-x[directory]  Tells Ruby that the script is embedded in a message.


Ruby in a awk like manner:
http://benoithamelin.tumblr.com/post/10945200630/text-processing-1liners-ruby-vs-awk
http://tomayko.com/writings/awkward-ruby

Launching webrick: ruby -run -ehttpd . -p8080
-> requires the un.rb library and launchs httpd
== Utilities to replace common UNIX commands in Makefiles etc
   ruby -run -e cp -- [OPTION] SOURCE DEST
   ruby -run -e ln -- [OPTION] TARGET LINK_NAME
   ruby -run -e mv -- [OPTION] SOURCE DEST
   ruby -run -e rm -- [OPTION] FILE
   ruby -run -e mkdir -- [OPTION] DIRS
   ruby -run -e rmdir -- [OPTION] DIRS
   ruby -run -e install -- [OPTION] SOURCE DEST
   ruby -run -e chmod -- [OPTION] OCTAL-MODE FILE
   ruby -run -e touch -- [OPTION] FILE
   ruby -run -e wait_writable -- [OPTION] FILE
   ruby -run -e mkmf -- [OPTION] EXTNAME [OPTION]
   ruby -run -e httpd -- [OPTION] DocumentRoot
   ruby -run -e help [COMMAND]

Ruby syntax check: ruby -c -w ...
#}}}1
