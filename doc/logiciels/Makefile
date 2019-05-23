Examples: http://makefiletutorial.com/

variables: https://www.gnu.org/software/make/manual/html_node/Flavors.html#Flavors
To substitute a variable’s value, write a dollar sign followed by the name of the variable in parentheses or braces: either ‘$(foo)’ or ‘${foo}’
foo=$(bar) #recursively expanded
foo:=$(bar) #simply expanded

http://stackoverflow.com/questions/2826029/passing-additional-variables-from-command-line-to-make
From environment - each environment variable is transformed into a makefile variable with the same name and value.
You may also want to set -e option (aka --environments-override) on, and your environment variables will override assignments made into makefile (unless these assignments themselves use the override directive . However, it's not recommended, and it's much better and flexible to use ?= assignment (the conditional variable assignment operator, it only has an effect if the variable is not yet defined):
    FOO?=default_value_if_not_set_in_environment
From command line - make can take variable assignments as part of his command line, mingled with targets:
make target FOO=bar
But then all assignments to FOO variable within the makefile will be ignored unless you use the override directive in assignment. (The effect is the same as with -e option for environment variables).

builtins are separated by ',':
$(foreach f,files, action on $(f);)

Functions can use parameters:
define list_in_dir
$(patsubst $(1)%,%,$(shell find $(1) $(2)))
endef

This find all files in $(1) (with options in $(2)
Then we substitute $(1)(.*) into (.*) to get the relative names

install_pattern=\
  etc:$(DESTDIR)$(etc_dir) \
  bin:$(DESTDIR)$(bin_dir) \
  lib:$(DESTDIR)$(lib_dir)

install:
	$(foreach inout,$(install_pattern), \
	  $(eval in = $(word 1,$(subst :, ,$(inout)))) \
	  $(eval out = $(word 2,$(subst :, ,$(inout)))) \
	  $(call install_dir,$(in),$(out));)
we transform etc:ploum into 'etc ploum', and then
in=(etc) and out=(ploum)

Recursion: https://www.gnu.org/software/make/manual/html_node/Recursion.html
Phony Targets: https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html#Phony-Targets
Pattern Match: https://www.gnu.org/software/make/manual/html_node/Pattern-Match.html

By default make starts with the first rule
Specifying an argument will make 'make' try to match the argument as target
One can use patterns:
%:
	$(MAKE) -C build $@
will transfert all calls to build/Makefile
