#!/bin/zsh
#see http://unix.stackexchange.com/questions/57940/trap-int-term-exit-really-necessary

set_error() { set -e; echo "in set error"; false; echo "after set error"; }
exit_error() { exit 1; }
exit_ok() { exit 0; }
ok() { true; }


trap 'echo "exit handling!"' EXIT
trap 'echo "error handling!"' ERR
trap 'echo "signal received: $?"' INT QUIT TERM

for command in $@; do
	echo $command
	eval $command
done

sleep 2
echo "foo"

## ZSH
#./test_trap.sh ''/ok/exit_ok/exit_error
#=> exit handling!
#./test_trap.sh set_error
#=> error handling!
#SIGINT (^C, signal received: 130)
#SIGQUIT: (^\, signal received: 131)
#=> signal received, error handling!, 'foo', exit handling!
#ie le signal déclenche aussi 'ERR'
#Note: that 'ERR' is generated each time a command/subfunction return !=0

#Note: adding
#set -e
#false
#at the end, in ./test_trap.sh generates
#foo; error handling!; exit handling!
#it is strange that in a function 'set -e' generates only ERR  while in the main script ERR and EXIT

##BASH
#set_error does a 'normal exit' only (the rest works like zsh)

#ZSH in a function: trap EXIT,ERR is specific to that function
#cf http://stackoverflow.com/questions/22793713/how-to-set-a-shell-exit-trap-from-within-a-function-in-zsh-and-bash
#
#set_trap() {
#	trap 'echo normal exit!' EXIT
#	trap 'echo error exit!' ERR
#	set -e
#	false
#	echo ploum
#}
#=> set_trap() will give 'error exit!', 'normal_exit!'
#(replacing false by true of course only gives normal_exit!)

##Summary for a clean up in all cases in bash:
#cleanup() {echo "CLEANUP"}
#trap_cleanup() {
#	ret=$?;
#	#Note: in zsh this clear the trap only in 'cleanup' :-(
#	trap '' EXIT ERR # some shells will call EXIT or ERR after the INT handler
#	cleanup
#	[[ $ret -ne 0 ]] && error "Failed to generate image"
#	exit $ret;
#}
#trap trap_cleanup EXIT ERR
#
#And in zsh:
#trap trap_cleanup ERR
#And add at the end: cleanup; or zshexit() { cleanup }
