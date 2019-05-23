# vim: foldmethod=marker ft=markdownlight

# call from code

require 'pry'
binding.pry #see http://kyrylo.org/posts/so-what-is-binding-pry-exactly
(see also pry-rescue below)

# Navigating objects

cd #go in an object
ls #list methods
whereami #in which object I am
nesting #hierarchy of objects I am

cd ploum
exit (return ploum)
cd .. (don't return ploum)
exit-all: exit the pry session (differ from !!! if pry was called from a program)
exit-program, !!!: exit completly

# historique

hist
hist --replay

# Editer

amend-line line: amend the line
edit: edit the last line
edit -t: starts with an empty file
edit -ex: edit the file that generated the last exception
edit -i line: edit line

cat -i line: see line
play -i line: replay line

# shell

.ls #{dir}
shell-mode (see the current dir rather than the current object)
cat file
save-file #save history to a file

# Exceptions:

pyr-backtrace: the backtrace of the current pry session
wtf? show last stack trace
cat -ex: show the code responsible for the exception (use -n up to go up the backtrace)

# Documentation

find-method
find-method -c (grep in the source)
edit-method
show-method (alias: show-source, $)
show-method (-a to get all matching source)
show-doc (alias: ?)
(_file_ and _dir_ then give the file and dir where the method was found)

# Divers
gem-cd
gem-install
gem-list

gist

simple-prompt #small prompt

# Plugins:
? https://github.com/ConradIrwin/pry-syntax-hacks
(allow access to instance variables, call private methods and access to the
methods of an object, pry-self looks better)

- pry-editline
https://github.com/tpope/pry-editline
Invoke editor via C-x+C-e

- pry-doc
Pry Doc extends two core Pry commands: show-doc and show-source (aliased as ? and $ respectively).

- pry-self
  https://github.com/ConradIrwin/self
  When you are inside pry, you can use the self method on any object to
  access its instance variables and private methods

- pry-byebug (replace pry-debugger for ruby-2+)
  https://github.com/deivid-rodriguez/pry-byebug
next,step (the difference is that step goes inside functions but next see a
function as an atom)
finish,continue (finish finish the current frame, continue resume the program)
break
backtrace, frame
(Usage: dans un programme, mettre binding.pry)

- pry-stack_explorer
https://github.com/pry/pry-stack_explorer
up, down, frame (to go to frame number n), show-stack

- pry-rescue (replace pry-exception_explorer)
https://github.com/ConradIrwin/pry-rescue

  -> cd-cause: go to the line causing the exception (can use 'cat -ex' to see it)
     try-again
  cf http://cirw.in/blog/pry-to-the-rescue

  -> Minitest: require 'pry-rescue/minitest'

  -> Wrapper autour d'un code: use 'rescue ploum.rb' plutôt que 'ruby ploum.rb'

  -> Wrapper autour d'un bout de code:
        Pry.rescue do
          raise ploum
        end
     the exception ploum will launch a pry session

     Finally. If you're doing your own exception handling, you can ask Pry
     to open on an exception that you've caught. For this to work you must
     be inside a Pry::rescue{ } block.
        def test
          raise "foo"
          rescue => e
            Pry::rescued(e)
        end
        Pry::rescue{ test }

  -> Peeking:
     Sometimes bugs in your program don't cause exceptions. Instead your
     program just gets stuck. Examples include infinite loops, slow network
     calls, or tests that take a surprisingly long time to run. In this
     case it's useful to be able to open a Pry console when you notice that
     your program is not going anywhere. To do this, send your process a
     SIGQUIT using <ctrl+\>.
     (cf github page for more details)
