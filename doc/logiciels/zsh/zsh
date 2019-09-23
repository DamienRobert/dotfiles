vim: ft=markdownlight fdm=expr

Glob
====

http://zsh.sourceforge.net/Doc/Release/Expansion.html
14.8 Filename Generation

echo {1..5} #expand in 1,2,...,5
echo {1..5..2} #expand in 1,3,5
echo {001..5} #expand in 001,002,...,005
ls <1-5> #glob on 1..5

echo **/*(DN) -> (N): no errors if no match, (D) add hidden files
Better than {**,.**}/{*,.*} which do not match .foo/bar/baz

http://unix.stackexchange.com/questions/62660/the-result-of-ls-ls-and-ls
  Now, as I said, different shells have different globbing operators. A few decades ago, zsh introduced the **/ operator¹ which means to match any level of subdirectories, short for (*/)# and ***/ which is the same except that it follows symlinks while descending the directories.
  Note: *** also follow symlinks

  *(/): match directories
  *(.): match files
  *(@): match symlinks

Redirections
============

http://zsh.sourceforge.net/Doc/Release/Expansion.html
14.2 Process Substitution

http://bolyai.cs.elte.hu/zsh-manual/zsh_7.html
http://zsh.sourceforge.net/Doc/Release/Redirection.html
http://chneukirchen.org/blog/archive/2008/02/10-zsh-tricks-you-may-not-know.html

  date >foo >bar
writes the date to two files, named ‘foo’ and ‘bar’. Note that a pipe is an
implicit redirection; thus
  date >foo | cat
writes the date to the file ‘foo’, and also pipes it to cat.

  zcat blabla.gz > >(commande1) > >(commande2) > >(commande3) > >(commande4)
Avec tee:
  zcat blabla.gz | tee -i >(commande1) >(commande2) >(commande3) | commande4

<(command) returns the filename (in /dev/fd if supported or as a FIFO) of
the pipe given by command for reading. (For example, use diff <(ruby
foo.rb) <(ruby-1.9 foo.rb) to compare two program outputs).

=(command) expands to a tempfile with the output of command that is deleted
after the line has finished. In effect, the same as <(command) but allows
applications to seek. E.g.: xpdf =(zcat foo.pdf.gz)

<<<<foo: Shortcut for `<<EOS foo EOS`
  cat <<<foo #foo

exec 5< <(printf 'foo\n')
cat <&5 #foo
exec {fd} < <(printf 'foo\n') #same but with a variable $fd
echo $fd #12 -> this assigne the fd #12
cat <&$fd #foo

Variables
=========

http://zsh.sourceforge.net/Doc/Release/Expansion.html
14.3 Parameter Expansion

- Test if VAR is set: if (($+VAR))
  or portably: if [ -n "${VAR+x}" ]
- Split a var: ${=VAR}
- Recursively evaluate:
  foo=bar; bar=baz
  ${(P)foo} -> baz

Note: "$@" is always automatically expanded (even in "foo $@"), while "$*"
is not.

Modifiers
---------
See man zshexpn
http://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html

i="foo/bar"
${i:t}: basename
${i:h}: dirname
${i:r}: remove extension
${i:t:r}: basename and remove extension

### PARAMETER EXPANSION

Definition:
${parameter:-word}
    If parameter is unset or null, the expansion of word is substituted. Otherwise, the value of parameter is substituted.
    [Note: ${parameter-word} only subst word when parameter is unset. If
    'parmeter='; then word is not substitued]
${parameter:=word}
    If parameter is unset or null, the expansion of word is assigned to parameter. The value of parameter is then substituted. Positional parameters and special parameters may not be assigned to in this way.
    [Note: likewise, ${parameter=word} only set word when parameter is unset]
${parameter:?word}
    If parameter is null or unset, the expansion of word (or a message to that effect if word is not present) is written to the standard error and the shell, if it is not interactive, exits. Otherwise, the value of parameter is substituted.
${parameter:+word}
    If parameter is null or unset, nothing is substituted, otherwise the expansion of word is substituted.

Replacement:
In the following expressions, when name is an array and  the  substitu‐
tion is not quoted, or if the `(@)' flag or the name[@] syntax is used,
matching and replacement is performed on each array element separately.
    ${PARAMETER#PATTERN} # remove from beginning
    ${PARAMETER##PATTERN} # remove from the beginning, greedy match
    ${PARAMETER%PATTERN} # remove from the end
    ${PARAMETER%%PATTERN} # remove from the end, greedy match
    ${PARAMETER/PATTERN} #remove pattern
    ${PARAMETER/#PATTERN} #remove pattern at the beginning
    ${PARAMETER/%PATTERN} #remove pattern at the end
    ${PARAMETER/#%PATTERN} #match full word
    ${PARAMETER/PATTERN/SUBST} #subst pattern

${name:#pattern}
       If the pattern matches the value of name,  then  substitute  the
       empty  string; otherwise, just substitute the value of name.  If
       name is an array the matching array elements  are  removed  (use
       the `(M)' flag to remove the non-matched elements).
${name:|arrayname}
       If  arrayname is the name (N.B., not contents) of an array vari‐
       able, then any elements contained in arrayname are removed  from
       the substitution of name.  If the substitution is scalar, either
       because name is a scalar variable or the expression  is  quoted,
       the  elements of arrayname are instead tested against the entire
       expression.
${name:*arrayname}
       Similar to the  preceding  substitution,  but  in  the  opposite
       sense, so that entries present in both the original substitution
       and as elements of arrayname are retained and others removed.

Misc:
${+name} If  name is the name of a set parameter `1' is substituted, otherwise `0' is substituted.
${name:^arrayname},${name:^^arrayname} => zip arrays

Modifiers:
${=spec} Perform  word splitting using the rules for SH_WORD_SPLIT
${~spec} Turn on the GLOB_SUBST option for the evaluation of spec (ie interpret $spec as a pattern)
${^spec} Turn  on  the RC_EXPAND_PARAM
${#spec} substitute the length

### PARAMETER EXPANSION Flags
(@), (o), (u): see Arrays
(0),(z),(f),(s:!:): split the result into words using \0, shell parsing, new line and ! respectively

Ex: list=(${(@f)"$(xrandr | sed -n '/ connected / {s/^\(.*\) connected.*/\1/p}')}")
=> split the result into an array on new lines (use (@) to preserve empty elements)
Warning: using $() rather than "$()" would further split into each space

Arrays
======
http://zshwiki.org/home/scripting/array
buffer=(a b c)
set -A buffer a b c

local -a buffer #local variable, asignment need to be done separately
buffer=(a b c)
typeset -A buffer #hash rather than array
buffer=(key1 value1 key2 value2)

Unset:
path[1]=()                 # numerical or associate
unset 'placeholders[foo]'  # associate

foo=(one two three four)
$foo[1] #-> one. Indexing starts with 1
$foo[-1] => last element
$foo[1,2] #-> one two
${foo:1} #-> two three four (note that this syntax is compatible with bash)
${foo:1:2} #-> two three
foo[*], foo[@]
$#foo #-> 4

Rem: for $@ the indexing start with 0, and $0 is the name of the script
$@=${@:1} -> the arguments
${@:0} -> $0 + the arguments

https://www-s.acm.illinois.edu/workshops/zsh/syntax_notes/array.html#all
 "$meat[@]" will return "$meat[1]" "$meat[2]" ... "$meat[n]"
where as
 "$meat[*]" will return "$meat[1] $meat[2] ... $meat[n]" 

In bash: http://www.thegeekstuff.com/2010/06/bash-array-tutorial/
foo=(one two three four)
- Indexing starts with 0 and needs to be in {}
  echo ${foo[0]} -> one
- $foo outputs the first element, not the whole array, one needs to use
  ${foo[@]} to get the whole array
- length: ${#foo}
- ranges:
  echo ${foo[@]:1:2} #two three

## Modifiers
http://zsh.sourceforge.net/Doc/Release/Expansion.html
man zshexpn

(@): In double quotes, array elements are put into separate words. E.g., ‘"${(@)foo}"’ is equivalent to ‘"${foo[@]}"’ and ‘"${(@)foo[1,2]}"’ is the same as ‘"$foo[1]" "$foo[2]"’. This is distinct from field splitting by the f, s or z flags, which still applies within each array element.
(u): remove duplicate elements
(o),(O): reorder elements of the array (o: ascending order, O: descending)
${(k)hash}: keys of $hash

${(@)^array}: expand array in string
ex: ploum=(ploum plam); echo "foo${(@)^ploum}bar" will give
fooploumbar fooplambar

Subscript flags:
${array[(i)v]}: the index of the first match for v (seen as a pattern)
                  if there is no match return $#array+1
${array[(I)v]}: the index of the last match for v (seen as a pattern)
                  if there is no match return 0
${array[(r)v]}: Reverse subscripting: if this flag is given, the exp is taken as
              a pattern and the result is the first  matching  array  element,
=> add (e) 're-evaluation' so that v is seen a value

(${foo:#b}): remove element with content "b" from array

=> Test if array contains value
  if [[ -n ${(M)ARRAY:#${VALUE}} ]] ; then
  if (($ARRAY[(Ie)$VALUE])); then

## Remove an element in an array:
To remove element number $i: a=("${(@)a[1,$i-1]}" "${(@)a[$i+1,$#a]}")
(The simpler construct a=($a[1,$i-1] $a[$i+1,$#a]) also removes empty elements.)

array=("${(@)array:#<element to remove>}")
(The (@) and "" are there to preserve empty elements in the array)

for i in $del; do array=${array:#$del}; done
${array:|del}

## Split a string:
a=("${(f)string}"): Split into an array on "\n"
(z): split into words using shell parsing
(s:-:) split on '-'. (f) is a shortcut for (ps:\n:), where (p) allows to
recognize the '\n'
Ex: echo ${(@s/:/)i} #split on ':'
    echo ${(j/:/array} #join on ':'
    (j:,:) join array with ','
Note: from the doc, (@s...), (@f) keep empty array elements while (s...), (f) do not
[NdDams: etrangement, chez moi "foo\nbar" n'est pas split avec (f) mais
avec (s:\n:); plus exactement a="foo\nbar", b=("${(@f)a}") ne marche pas;
par contre `calling_function ${(f)a} marche mais pas (s:\n:); et pareil
pour b=("${(f)$(echo "foo\nbar")}"), c'est (f) qui marche]

Difference between (z) and ^:
  foo="foo\ bar"
  ${(z)foo} => "foo\ bar"
  ${=foo} => "foo\", "bar"

Examples: https://stackoverflow.com/questions/12651355/zsh-read-lines-from-file-into-array
    for line in "${(@f)"$(</path/to/some/file.txt)"}"
    (Note: le (@) et "$..." sont là pour préserver les lignes vides, cf le commentaire de ZyX)
où avec 'mapfile': #note: mapfile est builtin dans bash
    zmodload zsh/mapfile 
    FNAME=/path/to/some/file.txt
    FLINES=( "${(f)mapfile[$FNAME]}" )

Misc
====

trap and set -e: see [doc//shell]

## Test if file is sourced or executed

https://unix.stackexchange.com/questions/4650/determining-path-to-sourced-shell-script
https://stackoverflow.com/questions/9901210/bash-source0-equivalent-in-zsh

~~~ zsh
called=$_ #put at the beginning of the script!

...

echo "called: $called"
echo "%x: ${(%):-%x}"
echo "\$0: $0"
~~~

Calling directly:
  called: 
  %x: ./foo.zsh
  $0: ./foo.zsh
Sourcing from another script:
  called: ./foo.zsh
  %x: ./foo.zsh
  $0: ./foo.zsh
=> Detection: [[ -n $called ]]

## History

History: http://unix.stackexchange.com/questions/111718/command-history-in-zsh
fpath: http://unix.stackexchange.com/questions/33255/how-to-define-and-load-your-own-shell-function-in-zsh

History expansion:
http://zsh.sourceforge.net/Doc/Release/Expansion.html
14.1 History Expansion

## Base name of glob
paths=(/some/path/blah*blah*blah)
filenames=($paths[@]:t)

Or directly:
filenames=( /some/path/blah*blah*blah(:t) )

## Change arguments:
~~~ zsh
  #foo.sh
  foo() {
  	echo $@
  }
  
  foo $@
  #bar.sh
  echo "Before: $@"
  set -- $@ foo bar
  . ./foo.sh
  echo "After: $@"
$ ./bar.sh ploum plam
Before: ploum plam
ploum plam foo bar
After: ploum plam foo bar
~~~

## Rename a function
http://stackoverflow.com/questions/1203583/how-do-i-rename-a-bash-function
copy_function() {
  test -n "$(declare -f $1)" || return
  eval "${_/$1/$2}"
}
rename_function() {
  copy_function $@ || return
  unset -f $1
}

## hash, type, command, which, whence
http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
Use one of the [bash] builtin instead of which:
$ command -v foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
$ type foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
$ hash foo 2>/dev/null || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }

man zshbuiltins
  command [ -pvV ] simple command
      The simple command argument is  taken  as  an  external  command
      instead  of  a  function  or  builtin  and  is  executed. If the
      POSIX_BUILTINS option is set, builtins will also be executed but
      certain  special  properties of them are suppressed. The -p flag
      causes a default path to be searched instead of that  in  $path.
      With  the  -v flag, command is similar to whence and with -V, it
      is equivalent to whence -v.
  type [ -fpam ] name ...
      Same as whence -v. 
  whence [ -vcfpam ] name ...
      For each name, indicate how it would be interpreted if used as a
      command name. The `-v' flag produces a more verbose report. The
      `-c' flag prints the results in a csh-like format and takes
      precedence over `-v'. The `-f' flag causes the contents of a shell
      function to be displayed, which would otherwise not happen unless
      the `-c' flag were used. The `-p' flag does a path search for name
      even if it is an alias, reserved word, shell function or builtin.
      The `-a' flag does a search for all occurrences of name throughout
      the command path. With the `-m' flag, the arguments are taken as
      patterns (which should be quoted), and the information is displayed
      for each command matching one of these patterns. 
  where
      Same as whence -ca.
  which [ -pam ] name ...
      Same as whence -c. 

Functions
=========

Autoloading
-----------
http://zsh.sourceforge.net/Doc/Release/Functions.html#Functions

If the KSH_AUTOLOAD option is set, or the file contains only a simple
definition of the function, the file’s contents will be executed. This
will normally define the function in question, but may also perform
initialization, which is executed in the context of the function
execution, and may therefore define local parameters. It is an error if
the function is not defined by loading the file.
[ie c'est équivalent à sourcer le fichier, puis à appeler `func $@`]

Otherwise, the function body (with no surrounding ‘funcname() {...}’) is
taken to be the complete contents of the file. This form allows the file to
be used directly as an executable shell script. If processing of the file
results in the function being re-defined, the function itself is not
re-executed. To force the shell to perform initialization and then call the
function defined, the file should contain initialization code (which will
be executed then discarded) in addition to a complete function definition
(which will be retained for subsequent calls to the function), and a call
to the shell function, including any arguments, at the end.
[ie c'est équivalent à faire seulement `func $@` où le body de func est le fichier]

For example, suppose the autoload file func contains
    func() { print This is func; }
    print func is initialized
then ‘func; func’ with KSH_AUTOLOAD set will produce both messages on the
first call, but only the message ‘This is func’ on the second and
subsequent calls. Without KSH_AUTOLOAD set, it will produce the
initialization message on the first call, and the other message on the
second and subsequent calls. 

Par contre avec `autoload -z` (ie sans KSH_AUTOLOAD), dans un fichier
		func() { print This is func; }
alors 'This is funk' est bien imprimé (comme avec KSH_AUTOLOAD), car il n'y
a que cette fonction de définie.

Cf
https://unix.stackexchange.com/questions/33255/how-to-define-and-load-your-own-shell-function-in-zsh

autoload -Uz hello # => search in the fpath
(-U: desactivate aliases, -z: KSH_AUTOLOAD false)

hello:
  hello_helper_one () {
    printf 'hello '
  }
  hello_helper_two () {
    printf 'world.'
  }
  hello () {
    printf '%s %s\n' "$(hello_helper_one)" "$(hello_helper_two)"
  }
  # Finally run the redefined function with the same arguments as the current run. If this is left out, the functionality implemented by the newly defined "hello" function is not executed upon its first call. So: 
  hello "$@"

Default bindings
================

Note: Esc-B is also Meta-B
The first group is Emacs mode, the second is vi normal mode, the third is
vi insert mode.

* https://sgeb.io/posts/2014/04/zsh-zle-custom-widgets/
- zle -la to see all widgets
- binding to see bindings
- execute-named-cmd to invoke a widget => bound to (I) ^Xx (N) :
  where-is widget to see bindings for a widget

## Emacs Mode
I only keep the bindings that are not 'unbound' in emacs mode, but there are
more functions, see
http://www.cs.elte.hu/zsh-manual/zsh_14.html

### Movement

backward-char (^B ESC-[D) (unbound)
    Move backward one character.
backward-word (ESC-B ESC-b) (unbound) (unbound)
    Move to the beginning of the previous word.
beginning-of-line (^A) (unbound) (unbound)
    Move to the beginning of the line. If already at the beginning of the line, move to the beginning of the previous line, if any.
end-of-line (^E) (unbound) (unbound)
    Move to the end of the line. If already at the end of the line, move to the end of the next line, if any.
forward-char (^F ESC-[C) (unbound) (unbound)
    Move forward one character.
vi-find-next-char (^X^F) (f) (unbound)
    Read a character from the keyboard, and move to the next occurrence of it in the line.
forward-word (ESC-F ESC-f) (unbound) (unbound)
    Move to the beginning of the next word. The editor's idea of a word is specified with the WORDCHARS parameter.
vi-goto-column (ESC-|) (|) (unbound)
    Move to the column specified by the numeric argument.

### History Control

beginning-of-buffer-or-history (ESC-<) (unbound) (unbound)
    Move to the beginning of the buffer, or if already there, move to the first event in the history list.
down-line-or-history (^N ESC-[B) (j) (unbound)
    Move down a line in the buffer, or if already at the bottom line, move to the next event in the history list.
end-of-buffer-or-history (ESC->) (unbound) (unbound)
    Move to the end of the buffer, or if already there, move to the last event in the history list.
history-incremental-search-backward (^R ^Xr) (unbound) (unbound)
    Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
history-incremental-search-forward (^S ^Xs) (unbound) (unbound)
    Search forward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
history-search-backward (ESC-P ESC-p) (unbound) (unbound)
    Search backward in the history for a line beginning with the first word in the buffer.
history-search-forward (ESC-N ESC-n) (unbound) (unbound)
    Search forward in the history for a line beginning with the first word in the buffer.
infer-next-history (^X^N) (unbound) (unbound)
    Search in the history for a line matching the current one and fetch the event following it.
insert-last-word (ESC-_ ESC-.) (unbound) (unbound)
    Insert the last word from the previous history event at the cursor position. If a positive numeric argument is given, insert that word from the end of the previous history event. If the argument is zero or negative insert that word from the left (zero inserts the previous command word).
up-line-or-history (^P ESC-[A) (k) (unbound)
    Move up a line in the buffer, or if already at the top line, move to the previous event in the history list.

### Modifying Text

backward-delete-char (^H ^?) (unbound) (unbound)
    Delete the character behind the cursor.
backward-kill-word (^W ESC-^H ESC-^?) (unbound) (unbound)
    Kill the word behind the cursor.
capitalize-word (ESC-C ESC-c) (unbound) (unbound)
    Capitalize the current word and move past it.
copy-region-as-kill (ESC-W ESC-w) (unbound) (unbound)
    Copy the area from the cursor to the mark to the kill buffer.
copy-prev-word (ESC-^_) (unbound) (unbound)
    Duplicate the word behind the cursor.
down-case-word (ESC-L ESC-l) (unbound) (unbound)
    Convert the current word to all lowercase and move past it.
kill-word (ESC-D ESC-d) (unbound) (unbound)
    Kill the current word.
vi-join (^X^J) (J) (unbound)
    Join the current line with the next one.
kill-line (^K) (unbound) (unbound)
    Kill from the cursor to the end of the line.
kill-buffer (^X^K) (unbound) (unbound)
    Kill the entire buffer.
kill-whole-line (^U) (unbound) (unbound)
    Kill the current line.
vi-match-bracket (^X^B) (%) (unbound)
    Move to the bracket character (one of {}, (), or []) that matches the one under the cursor. If the cursor is not on a bracket character, move forward without going past the end of the line to find one, and then go to the matching bracket.
overwrite-mode (^X^O) (unbound) (unbound)
    Toggle between overwrite mode and insert mode.
quoted-insert (^V) (unbound) (unbound)
    Insert the next character typed into the buffer literally. An interrupt character will not be inserted.
vi-quoted-insert (unbound) (unbound) (^Q ^V)
    Display a ^ at the current position, and insert the next character typed into the buffer literally. An interrupt character will not be inserted.
quote-line (ESC-') (unbound) (unbound)
    Quote the current line; that is, put a ' character at the beginning and the end, and convert all ' characters to \'.
quote-region (ESC-") (unbound) (unbound)
    Quote the region from the cursor to the mark.
self-insert (printable characters) (unbound) (printable characters and some control characters)
    Put a character in the buffer at the cursor position.
self-insert-unmeta (ESC-^I ESC-^J ESC-^M) (unbound) (unbound)
    Put a character in the buffer after stripping the meta bit and converting ^M to ^J.
transpose-chars (^T) (unbound) (unbound)
    Exchange the two characters to the left of the cursor if at end of line, else exchange the character under the cursor with the character to the left.
transpose-words (ESC-T ESC-t) (unbound) (unbound)
    Exchange the current word with the one before it.
up-case-word (ESC-U ESC-u) (unbound) (unbound)
    Convert the current word to all caps and move past it.
yank (^Y) (unbound) (unbound)
    Insert the contents of the kill buffer at the cursor position.
yank-pop (ESC-y) (unbound) (unbound)
    Remove the text just yanked, rotate the kill-ring, and yank the new top. Only works following yank or yank-pop.

### Arguments

digit-argument (ESC-0...ESC-9) (1-9) (unbound)
    Start a new numeric argument, or add to the current one. See also vi-digit-or-beginning-of-line.
neg-argument (ESC--) (unbound) (unbound)
    Changes the sign of the following argument.

### Completion

delete-char-or-list (^D) (unbound) (unbound)
    Delete the character under the cursor. If the cursor is at the end of the line, list possible completions for the current word.
expand-or-complete (TAB) (unbound) (TAB)
    Attempt shell expansion on the current word. If that fails, attempt completion.
expand-history (ESC-SPACE ESC-!) (unbound) (unbound)
    Perform history expansion on the edit buffer.
expand-word (^X*) (unbound) (unbound)
    Attempt shell expansion on the current word.
list-choices (ESC-^D) (^D=) (^D)
    List possible completions for the current word.
list-expand (^Xg ^XG) (^G) (^G)
    List the expansion of the current word.

### Miscellaneous

accept-and-hold (ESC-A ESC-a) (unbound) (unbound)
    Push the contents of the buffer on the buffer stack and execute it.
accept-line (^J ^M) (^J ^M) (^J ^M)
    Execute the contents of the buffer.
accept-line-and-down-history (^O) (unbound) (unbound)
    Execute the current line, and push the next history event on the the buffer stack.
vi-cmd-mode (^X^V) (unbound) (^[)
    Enter command mode; that is, use the alternate keymap. Yes, this is bound by default in emacs mode.
clear-screen (^L ESC-^L) (^L) (^L)
    Clear the screen and redraw the prompt.
exchange-point-and-mark (^X^X) (unbound) (unbound)
    Exchange the cursor position with the position of the mark.
eyxecute-named-cmd (ESC-x) (unbound) (unbound)
    Read the name of a editor command and execute it.
execute-last-named-cmd (ESC-z) (unbound) (unbound)
    Redo the last function executed with execute-named-cmd.
get-line (ESC-G ESC-g) (unbound) (unbound)
    Pop the top line off the buffer stack and insert it at the cursor position.
push-line (^Q ESC-Q ESC-q) (unbound) (unbound)
    Push the current buffer onto the buffer stack and clear the buffer. Next time the editor starts up, the buffer will be popped off the top of the buffer stack and loaded into the editing buffer.
redisplay (unbound) (^R) (^R)
    Redisplays the edit buffer.
send-break (^G ESC-^G) (unbound) (unbound)
    Abort the current editor function, e.g. execute-named-command, or the editor itself, e.g. if you are in vared. Otherwise abort the parsing of the current line.
run-help (ESC-H ESC-h) (unbound) (unbound)
    Push the buffer onto the buffer stack, and execute the command run-help cmd, where cmd is the current command. run-help is normally aliased to man.
set-mark-command (^@) (unbound) (unbound)
    Set the mark at the cursor position.
spell-word (ESC-$ ESC-S ESC-s) (unbound) (unbound)
    Attempt spelling correction on the current word.
undefined-key (lots o' keys) (lots o' keys) (unbound)
    Beep.
undo (^_ ^Xu ^X^U) (unbound) (unbound)
    Incrementally undo the last text modification.
vi-undo-change (unbound) (u) (unbound)
    Undo the last text modification. If repeated, redo the modification.
which-command (ESC-?) (unbound) (unbound)
    Push the buffer onto the buffer stack, and execute the command which-command cmd, where cmd is the current command. which-command is normally aliased to whence.
## Vi mode
### Movement

vi-backward-blank-word (unbound) (B) (unbound)
    Move backward one word, where a word is defined as a series of non-blank characters.
vi-backward-char (unbound) (^H h ^?) (unbound)
    Move backward one character, without changing lines.
vi-backward-word (unbound) (b) (unbound)
    Move to the beginning of the previous word, vi-style.
vi-end-of-line (unbound) ($) (unbound)
    Move to the end of the line. If an argument is given to this command, the cursor will be moved to the end of the line (argument - 1) lines down.
vi-forward-blank-word (unbound) (W) (unbound)
    Move forward one word, where a word is defined as a series of non-blank characters.
vi-forward-blank-word-end (unbound) (E) (unbound)
    Move to the end of the current word, or, if at the end of the current word, to the end of the next word, where a word is defined as a series of non-blank characters.
vi-forward-char (unbound) (SPACE l) (unbound)
    Move forward one character.
vi-find-next-char (^X^F) (f) (unbound)
    Read a character from the keyboard, and move to the next occurrence of it in the line.
vi-find-next-char-skip (unbound) (t) (unbound)
    Read a character from the keyboard, and move to the position just before the next occurrence of it in the line.
vi-find-prev-char (unbound) (F) (unbound)
    Read a character from the keyboard, and move to the previous occurrence of it in the line.
vi-find-prev-char-skip (unbound) (T) (unbound)
    Read a character from the keyboard, and move to the position just after the previous occurrence of it in the line.
vi-first-non-blank (unbound) (^) (unbound)
    Move to the first non-blank character in the line.
vi-forward-word (unbound) (w) (unbound)
    Move forward one word, vi-style.
vi-forward-word-end (unbound) (e) (unbound)
    Move to the end of the next word.
vi-goto-column (ESC-|) (|) (unbound)
    Move to the column specified by the numeric argument.
vi-goto-mark (unbound) (`) (unbound)
    Move to the specified mark.
vi-goto-mark-line (unbound) (') (unbound)
    Move to the beginning of the line containing the specified mark.
vi-repeat-find (unbound) (;) (unbound)
    Repeat the last vi-find command.
vi-rev-repeat-find (unbound) (,) (unbound)
    Repeat the last vi-find command in the opposite direction.

### History Control

down-line-or-history (^N ESC-[B) (j) (unbound)
    Move down a line in the buffer, or if already at the bottom line, move to the next event in the history list.
vi-down-line-or-history (unbound) (+) (unbound)
    Move down a line in the buffer, or if already at the bottom line, move to the next event in the history list. Then move to the first non-blank character on the line.
down-history (unbound) (^N) (unbound)
    Move to the next event in the history list.
vi-fetch-history (unbound) (G) (unbound)
    Fetch the history line specified by the numeric argument. This defaults to the current history line (i.e. the one that isn't history yet).
vi-history-search-backward (unbound) (/) (unbound)
    Search backward in the history for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
vi-history-search-forward (unbound) (?) (unbound)
    Search forward in the history for a specified string. The string may begin with ^ to anchor the search to the beginning of the line. The functions available in the mini-buffer are the same as for vi-history-search-backward.
vi-repeat-search (unbound) (n) (unbound)
    Repeat the last vi history search.
vi-rev-repeat-search (unbound) (N) (unbound)
    Repeat the last vi history search, but in reverse.
up-line-or-history (^P ESC-[A) (k) (unbound)
    Move up a line in the buffer, or if already at the top line, move to the previous event in the history list.
up-history (unbound) (^P) (unbound)
    Move to the previous event in the history list.

### Modifying Text

vi-add-eol (unbound) (A) (unbound)
    Move to the end of the line and enter insert mode.
vi-add-next (unbound) (a) (unbound)
    Enter insert mode after the current cursor position, without changing lines.
vi-backward-delete-char (unbound) (X) (^H)
    Delete the character behind the cursor, without changing lines. If in insert mode this won't delete past the point where insert mode was last entered.
vi-backward-kill-word (unbound) (unbound) (^W)
    Kill the word behind the cursor, without going past the point where insert mode was last entered.
vi-change (unbound) (c) (unbound)
    Read a movement command from the keyboard, and kill from the cursor position to the endpoint of the movement. Then enter insert mode. If the command is vi-change, kill the current line.
vi-change-eol (unbound) (C) (unbound)
    Kill to the end of the line and enter insert mode.
vi-change-whole-line (unbound) (S) (unbound)
    Kill the current line and enter insert mode.
vi-delete (unbound) (d) (unbound)
    Read a movement command from the keyboard, and kill from the cursor position to the endpoint of the movement. If the command is vi-delete, kill the current line.
vi-delete-char (unbound) (x) (unbound)
    Delete the character under the cursor, without going past the end of the line.
vi-indent (unbound) (>) (unbound)
    Indent a number of lines.
vi-insert (unbound) (i) (unbound)
    Enter insert mode.
vi-insert-bol (unbound) (I) (unbound)
    Move to the beginning of the line and enter insert mode.
vi-join (^X^J) (J) (unbound)
    Join the current line with the next one.
vi-kill-line (unbound) (unbound) (^U)
    Kill from the cursor back to wherever insert mode was last entered.
vi-kill-eol (unbound) (D) (unbound)
    Kill from the cursor to the end of the line.
vi-match-bracket (^X^B) (%) (unbound)
    Move to the bracket character (one of {}, (), or []) that matches the one under the cursor. If the cursor is not on a bracket character, move forward without going past the end of the line to find one, and then go to the matching bracket.
vi-open-line-above (unbound) (O) (unbound)
    Open a line above the cursor and enter insert mode.
vi-open-line-below (unbound) (o) (unbound)
    Open a line below the cursor and enter insert mode.
vi-put-before (unbound) (P) (unbound)
    Insert the contents of the kill buffer before the cursor. If the kill buffer contains a sequence of lines (as opposed to characters), paste it above the current line.
vi-put-after (unbound) (p) (unbound)
    Insert the contents of the kill buffer after the cursor. If the kill buffer contains a sequence of lines (as opposed to characters), paste it below the current line.
vi-quoted-insert (unbound) (unbound) (^Q ^V)
    Display a ^ at the current position, and insert the next character typed into the buffer literally. An interrupt character will not be inserted.
vi-replace (unbound) (R) (unbound)
    Enter overwrite mode.
vi-repeat-change (unbound) (.) (unbound)
    Repeat the last vi mode text modification. If a count was used with the modification, it is remembered. If a count is given to this command, it overrides the remembered count, and is remembered for future uses of this command. The cut buffer specification is similarly remembered.
vi-replace-chars (unbound) (r) (unbound)
    Replace the character under the cursor with a character read from the keyboard.
self-insert (printable characters) (unbound) (printable characters and some control characters)
    Put a character in the buffer at the cursor position.
vi-substitute (unbound) (s) (unbound)
    Substitute the next character(s).
vi-swap-case (unbound) (~) (unbound)
    Swap the case of the character under the cursor and move past it.
vi-unindent (unbound) (<) (unbound)
    Unindent a number of lines.
vi-yank (unbound) (y) (unbound)
    Read a movement command from the keyboard, and copy the region from the cursor position to the endpoint of the movement into the kill buffer. If the command is vi-yank, copy the current line.
vi-yank-whole-line (unbound) (Y) (unbound)
    Copy the current line into the kill buffer.
vi-yank-eol
    Copy the region from the cursor position to the end of the line into the kill buffer. Arguably, this is what Y should do in vi, but it isn't what it actually does.

### Arguments

digit-argument (ESC-0...ESC-9) (1-9) (unbound)
    Start a new numeric argument, or add to the current one. See also vi-digit-or-beginning-of-line.

### Completion

expand-or-complete (TAB) (unbound) (TAB)
    Attempt shell expansion on the current word. If that fails, attempt completion.
list-choices (ESC-^D) (^D=) (^D)
    List possible completions for the current word.
list-expand (^Xg ^XG) (^G) (^G)
    List the expansion of the current word.

### Miscellaneous

accept-line (^J ^M) (^J ^M) (^J ^M)
    Execute the contents of the buffer.
vi-cmd-mode (^X^V) (unbound) (^[)
    Enter command mode; that is, use the alternate keymap. Yes, this is bound by default in emacs mode.
clear-screen (^L ESC-^L) (^L) (^L)
    Clear the screen and redraw the prompt.
pound-insert (unbound) (#) (unbound)
    If there is no # character at the beginning of the buffer, add one to the beginning of each line. If there is one, remove a # from each line that has one. In either case, accept the current line. The INTERACTIVE_COMMENTS option must be set for this to have any usefulness.
vi-set-buffer (unbound) (") (unbound)
    Specify a buffer to be used in the following command. There are 35 buffers that can be specified: the 26 named buffers "a to "z and the nine queued buffers "1 to "9. The named buffers can also be specified as "A to "Z. When a buffer is specified for a cut command, the text being cut replaces the previous contents of the specified buffer. If a named buffer is specified using a capital, the newly cut text is appended to the buffer instead of overwriting it. If no buffer is specified for a cut command, "1 is used, and the contents of "1 to "8 are each shifted along one buffer; the contents of "9 is lost.
vi-set-mark (unbound) (m) (unbound)
    Set the specified mark at the cursor position.
undefined-key (lots o' keys) (lots o' keys) (unbound)
    Beep.
vi-undo-change (unbound) (u) (unbound)
    Undo the last text modification. If repeated, redo the modification.
vi-digit-or-beginning-of-line(unbound) (0) (unbound)
    If the last command executed was a digit as part of an argument, continue the argument. Otherwise, execute vi-beginning-of-line.

Menu completion
---------------

menu select: show list of possibilities, then use menu selection
menu yes: directly complete with first choice (tab cycle, but we are not in the menu)
menu yes select: like menu select, but also directly complete with first choice

force-list always: always show the list, even if there is only one possibility
list:
    This style is used by the _history_complete_word bindable command. If it is set to ‘true’ it has no effect. If it is set to ‘false’ matches will not be listed. This overrides the setting of the options controlling listing behaviour, in particular AUTO_LIST. The context always starts with ‘:completion:history-words’.

Bindings: http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets

Completion
==========

http://askql.wordpress.com/2011/01/11/zsh-writing-own-completion/
http://www.linux-mag.com/id/1106/
http://tar-jx.bz/notes/zsh-completion.html
http://wikimatze.de/writing-zsh-completion-for-padrino.html
http://bewatermyfriend.org/p/2012/003/
https://github.com/zsh-users/zsh-completions/blob/master/zsh-completions-howto.org
https://github.com/zsh-users/zsh/blob/master/Etc/completion-style-guide
http://zsh.sourceforge.net/Guide/zshguide06.html

cf compdef, compctl, compadd in http://zsh.sourceforge.net/Doc/Release/Completion-System.html

En gros pour la complétion, j'ai juste à retenir _arguments (pour les
arguments) et _values (pour spécifier plus finement les valeurs d'une
option). Les _wanted, ... et autre, c'est seulement si j'ai besoin de
spécifier des tags (pour que l'utilisateur puisse customiser s'il veut ces
tags ou pas, moi je m'en fiche un peu pour mes propres fichiers de
complétions).

Si j'utilise des states: soit
    local curcontext="$curcontext" state state_descr line
    typeset -A opt_args
    _arguments -C
ou
    local context state state_descr line
    typeset -A opt_args
    _arguments

Dans la forme *::message:action
quand action est executé, words ne contient plus les options
Dans la forme *:::message:action
quand action est executé, words ne contient plus que les arguments de la forme *
ex: _arguments -C '1: :->country' '*::: :->city' alors dans hello2 France ploum TAB, words contient suelement ploum

Pour les alternatives simples:
_alternative \
   'users:user:_users' \
   'hosts:host:_hosts'
Peut s'écrire aussi
_arguments - users ':user:_users' - hosts ':host:_hosts'

_message pour un message

_files: complete files; files -/: complete only with directories
Ex: _arguments '-l+:left border:' \ 
           '-format:paper size:(letter A4)' \ 
           '*-copy:output file:_files::resolution:(300 600)' \ 
           ':postscript file:_files -g \*.\(ps\|eps\)' \ 
           '*:page number:'
_files: The function _files calls _path_files with all the arguments it was passed except for -g and -/. The use of these two options depends on the setting of the file-patterns style.

Some options to _arguments:
    The  options  -S and -A are available to simplify the specifica‐
    tions for commands with standard option parsing.   With  -S,  no
    option  will  be  completed after a `--' appearing on its own on
    the line; this argument will otherwise be ignored; hence in  the
    line
           foobar -x -- -y
    the  `-x'  is considered an option but the `-y' is considered an
    argument, while the `--' is considered to be neither.
    With -A, no options will be completed after the first non-option
    argument  on  the  line.   The  -A must be followed by a pattern
    matching all strings which are not to  be  taken  as  arguments.
    For  example,  to  make _arguments stop completing options after
    the first normal argument, but  ignoring  all  strings  starting
    with  a hyphen even if they are not described by one of the opt‐
    specs, the form is `-A "-*"'.

    By default, options are multi-character name, one `-word'
    per  option.   With -s, options may be single characters,
    with more than one option per word, although words start‐
    ing  with two hyphens, such as `--prefix', are still con‐
    sidered complete option  names.   This  is  suitable  for
    standard GNU options.
ex: with ruby optparse $ unison.rb '--*-completion-zsh'

## compdef
typeset -A opt_args
local context state line
_arguments -s -S \
  "-b[unison batch mode]" \
  ...

compdef _command foo=bar #complete foo as _command:bar
compdef _git gitk=git-rev-list #complete gitk as git 'service=git-rev-list'
compdef _ponymix volume #complete volume as ponymix

Documentation
=============

See for some nice scripts http://chneukirchen.org/blog/archive/2013/07.html
From tips: http://chneukirchen.org/blog/category/zsh.html
zsh-lovers archlinux package -> man zsh-lovers

Others:
https://github.com/robbyrussell/oh-my-zsh
https://github.com/sorin-ionescu/prezto #a fork of oh-my-zsh
https://github.com/zsh-users/zaw #a plugin to find content

List of plugins: https://github.com/unixorn/awesome-zsh-plugins

Plugins
========

* Manager
+ https://github.com/zplug/zplug
Zsh plugin manager, very similar to vim-plug
$ curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

=> install in ~/.zplub
zsh: source ~/.zplug/init.zsh

$ZPLUG_HOME: ~/.zplug
$ZPLUG_LOADFILE=$ZPLUG_HOME/packages.zsh => This file is used to add plugins from zplug on the command-line. It is also a useful place to isolate your packages list from .zshrc

Exemple:
  # zplug check returns true if all packages are installed
  # Therefore, when it returns false, run zplug install
  if ! zplug check; then
    zplug install
  fi

  # source plugins and add commands to the PATH
  zplug load

  # zplug check returns true if the given repository exists
  if zplug check b4b4r07/enhancd; then
    # setting if enhancd is available
    export ENHANCD_FILTER=fzf-tmux
  fi

Notes:
- cf base/core/load.zsh: plugins are either sourced, or if marked as lazy autoloaded. a theme is like a plugin but `setopt prompt_subst` is activated
(except that the files are searched in *.plugin.zsh for plugins, vs .zsh-theme/.theme-zsh for themes).
  For commands they are symlinked into ~/.zplug
- init.zsh change the fpath to add some fplug folders:
  /home/dams/.zplug/misc/completions /home/dams/.zplug/base/sources...
  and adds ~/.zplug/bin to the PATH

* Plugins:
+ https://github.com/b4b4r07/enhancd
  A next-generation cd command with your interactive filter
- https://github.com/mollifier/anyframe
  peco/percol/fzf wrapper plugin for zsh
