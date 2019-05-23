# vim: set foldmethod=marker:
#to test if a version is big enough
autoload -Uz is-at-least || is-at-least() { return 1 }
#completion
fpath=(~/.zsh/completion ~/.zsh/functions $fpath)
#In case .zprofile was not called
case "$_INIT" in
	*e*) ;;
	*) [[ -e "$HOME/.initenv" ]] && . "$HOME/.initenv";;
	#.initenv may not exist if we are under id=root
esac
[[ -z $_INITVARS && -e "$HOME/.initvars" ]] && . "$HOME/.initvars"

_CURSOR_INSERT=${_CURSOR_INSERT-"DarkOrange3"}
_CURSOR_NORMAL=${_CURSOR_NORMAL-"Firebrick3"}
export _CURSOR_INSERT _CURSOR_NORMAL

myaccounts=(
 dams@{feanor,numenor,valinor,fleurbleue,gondolin,mithrim,doriath}
 robert@{ens,4a,bbq}
 damienrobert@{imb,oimb,gimb,devel}
)

### zsh customisations {{{
#local variables that activate some features
#unset at the end exept __ZSHGITSTATUS
local ZSHRECOMPILE ZSHNAME __ZSHGITSTATUS ZSHPLUGINS

#zshrecompile
[[ $MYHOSTTYPE == "perso" ]] && ZSHRECOMPILE=t
if [[ -n $ZSHRECOMPILE ]]; then
autoload -Uz zrecompile
zrecompile -p \
					 -R ~/.zshrc -- \
					 -M ~/.zcompdump -- \
					 ~/.zsh/completion.zwc ~/.zsh/completion/_* -- \
					 ~/.zsh/functions.zwc ~/.zsh/functions/*
fi

#zshname
if [[ -n $MYHOSTNAME ]]; then
	for account in $myaccounts; do
		account=(${(s:@:)account})
		if [[ $account[2] == ${MYHOSTNAME:l} ]]; then
			ZSHNAME=$account[1]
			break
		fi
	done
fi
unset account

if [[ -z $ZSHNAME ]]; then
	case $MYHOSTTYPE in
		perso ) ZSHNAME="dams" ;;
		imb) ZSHNAME="damienrobert" ;;
		*) ZSHNAME="robert"
	esac
fi

#plugins & gitstatus
[[ -n $MYHOSTTYPE ]] && { __ZSHGITSTATUS="light";  ZSHPLUGINS=t }
case $MYHOSTNAME in
	Feanor|Mithrim|Doriath) __ZSHGITSTATUS=full ;;
esac
case $MYHOSTNAME in
	Gondolin|Durin)
		ZSHPLUGINS=
		__ZSHGITSTATUS=
		;;
esac
#}}}

### Options {{{1

#man zshoptions
setopt no_clobber no_hist_allow_clobber
setopt no_bgnice no_flow_control no_check_jobs nohup notify
setopt auto_pushd  pushd_minus
setopt interactivecomments
setopt complete_in_word auto_cd
# setopt pushd_ignore_dups autocd
# setopt no_banghist print_exit_value
# setopt correct nocorrectall

# in order to use #, ~ and ^ for filename generation grep word
# *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
# don't forget to quote '^', '~' and '#'!
setopt extended_glob
# display PID when suspending processes as well
setopt longlistjobs
# whenever a command completion is attempted, make sure the entire command path
# is hashed first.
setopt hash_list_all

cdpath=(.)
ttyctl -f #récupérer le terminal quand une appli meurt
HISTSIZE=2000
SAVEHIST=4000
HISTFILE="$HOME/.zsh_history"
#[[ -d "$HOME/var/history" ]] && HISTFILE="$HOME/var/history/zsh_history"
setopt inc_append_history extended_history hist_ignore_dups hist_reduce_blanks #share_history
setopt hist_expire_dups_first
FCEDIT=$EDITOR
limit coredumpsize 0

##i need to call bindkey here, in order not to overwrite the completion bindings ^X... But for my custom bindings, I put them after the completion so that I can use the completion widgets
#Rather than calling bindkey -v I specify a custom keymap where I will add
#my custom bindings, so that I can still call bindkey -v to go back to
#default vi mode. Unfortunately I need to change vicmd directly and can not
#use a copy, cf the section of man zshall.
bindkey -N myviins viins
bindkey -A myviins main

# We need to put this before completion so that LS_COLORS is defined
[[ -z $LS_COLORS ]] && [[ -e "$HOME/.dir_colors" ]] && eval $(dircolors -b $HOME/.dir_colors 2>/dev/null)
#}}}

### Alias and helper functions {{{1
# salias {{{2
# creates an alias and precedes the command with
# sudo if $EUID is not zero.
function salias() {
		emulate -L zsh
		local only=0 ; local multi=0
		while [[ $1 == -* ]] ; do
				case $1 in
						(-o) only=1 ;; #set alias if EUID != 1
						(-a) multi=1 ;;
						(-E) env=1 ;;
						(--) shift ; break ;;
						(-h)
								printf 'usage: salias [-h|-o|-a] <alias-expression>\n'
								printf '	-h			shows this help text.\n'
								printf '	-a			replace '\'' ; '\'' sequences with '\'' ; sudo '\''.\n'
								printf '					be careful using this option.\n'
								printf '	-o			only sets an alias if a preceding sudo would be needed.\n'
								printf '	-E			preserve environment'
								return 0
								;;
						(*) printf "unkown option: '%s'\n" "$1" ; return 1 ;;
				esac
				shift
		done

		if (( ${#argv} > 1 )) ; then
				printf 'Too many arguments %s\n' "${#argv}"
				return 1
		fi

		sudo_opt="${env+-E}"
		local key="${1%%\=*}" ;  local val="${1#*\=}"
		if (( EUID == 0 )) && (( only == 0 )); then
				alias -- "${key}=${val}"
		elif (( EUID > 0 )) ; then
				(( multi > 0 )) && val="${val// ; / ; sudo }"
				alias -- "${key}=sudo $sudo_opt ${val}"
		fi

		return 0
}

#Aliases {{{2
alias ls='ls --color=auto -F -T 0 --quoting-style=literal'
alias ll="ls -lh"
alias la="ls -A"
alias lla="ls -lhA"
alias lld="ls -lhd"
alias lsd="ls -d"
alias lsR="ls -R"
alias laR="ls -RA"

alias rm="nocorrect rm -i"
alias mv="nocorrect mv -i"
alias cp="nocorrect cp -i --reflink=auto"

alias df="df -h"

alias dua='du -sch'

alias 'cd..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -- ++=pushd
alias -- --=popd

alias md='mkdir -p'
alias rd='rmdir'

#pour passer latin-1/utf-8
alias to_latin='LC_CTYPE=fr_FR'
alias to_latin_euro='LC_CTYPE=fr_FR@euro'
alias to_utf8='LC_CTYPE=en_US.UTF-8'
alias recode_latin='recode UTF-8..ISO8859-1'
alias recode_utf8='recode ISO8859-1..UTF-8'

# pour les transferts de fichiers
alias transfert2='rsync -vazPHAXS'
alias transfert='rsync -vazP'

alias fg1='fg %1'
alias fg2='fg %2'
alias fg3='fg %3'
alias fg4='fg %4'

alias vimr="vim --noplugin"
alias gvimr="gvim --noplugin"
alias view="vi -R"

alias ssho="ssh -o ControlMaster=no"
alias lualatexmk="mylatexmk --lua"
alias xelatexmk="mylatexmk --xetex"
alias screenssh="screen -S ssh -RR"
alias tmuxssh="tmux new -As ssh"
alias tmuxcrontab="tmux new -As crontab"

alias g=git
alias gi="git --no-pager"
alias gitp="git --paginate"
alias gitdiffalias="git diff --no-index"
alias HI='GIT_PAGER="$HOME/script/git/diff-fancy.rb"'
alias HIG='GIT_PAGER="$HOME/script/git/contrib/diff-highlight|less"'

#control groups
alias psc="ps xawf -eo pid,user,cgroup,args"

#others
alias pacman_local="fakeroot pacman --config ~/.config/pacman/pacman.conf"
alias unisonsync="unison.rb -s"

# ruby
alias ri="ri --format=ansi" # enable colors for ri

# nice cli improvements
export BAT_THEME="GitHub"
alias ncdu="ncdu --color dark"
alias prettyping="~/usr/dist/prettyping/prettyping --nolegend"

# ~directories {{{2
#cd ~util -> /usr/local/util
hash -d mine=~/mine
hash -d bin=~mine/bin
hash -d config=~mine/config
hash -d dotfiles=~config/dotfiles
hash -d doc=~mine/doc
hash -d maint=~mine/maint
hash -d progs=~mine/progs
hash -d ruby=~mine/ruby
hash -d script=~mine/script
hash -d syst=~mine/syst
hash -d user=~mine/user

hash -d home=~config/home
hash -d services=~config/systemd/user
hash -d services2=~/.config/systemd/user
hash -d rubylib=~ruby/lib
hash -d rubydr=~rubylib/dr
hash -d rubygems=~ruby/gems
hash -d coregems=~ruby/core_gems/gems
hash -d comps=~/.cache/@comps
hash -d comp=~comps/$MYHOSTNAME
hash -d infos=~syst/@infos
hash -d syst-config=~syst/config
hash -d etc=~syst-config/slash/etc

hash -d articles=~/latex/articles
hash -d slides=~/latex/slides
hash -d latexpkgs=~/latex/latex-packages

hash -d packages=~/opt/local/packages
hash -d pkgmgr=~/opt/pkgmgr
hash -d gemsdir=~pkgmgr/gems
hash -d gems=~gemsdir/gems
hash -d gemsdoc=~gemsdir/doc
hash -d bundle=~/var/spool/bundle/gems
hash -d backups=~/var/backups
hash -d npm=~pkgmgr/npm/lib/node_modules

hash -d data=/home/data/dams

hash -d applications=/usr/share/applications
hash -d systemd=/etc/systemd
hash -d systemdsv=~systemd/system
hash -d systemdlib=/usr/lib/systemd/system
hash -d vim=/usr/share/vim/vim74/
hash -d zsh=/usr/share/zsh
hash -d zshcompletion=~zsh/functions/Completion
hash -d rubysyslib=/usr/lib/ruby

# Global aliases {{{2
#suffixes
alias -g IC="| cat"
alias -g CA="2>&1 | cat -A"
alias -g DISP="DISPLAY=:0.0"
alias -g EO="2>&1"
alias -g EG='|& egrep'
alias -g EL='|& less'
alias -g EP='|& vimpager'
alias -g IF=' | fmt -'
alias -g IG='| egrep'
alias -g IL="| less"
alias -g IV="| vimpager"
alias -g IH="| head"
alias -g IT="| tail"
alias -g NO="> /dev/null"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g IS="| sort"
alias -g IU="| uniq"
alias -g IX='| xargs'
alias -g IW="| w3m -T text/html"
alias -g IWC="| wc"
alias -g IPE='| path-extractor'
alias VP="PAGER=vimpager"

# helper functions {{{2
function loadextra() {
	case $1 in
		'zle') echo 'load extra-zle'; source "$HOME/.zsh/extra-zle.zsh" ;;
		* ) echo 'load extra'; source "$HOME/.zsh/extra.zsh" ;;
	esac
}

for func in ~/.zsh/functions/*(N-.:t); do autoload -z $func; done
unset func

alias gcd='git-cd'
alias lr='lr -F'
# Set title {{{2
function _set_cursor() {
	case $TERM in
		*screen*|*tmux*)
			print -n "\e]12;$@\e\\"
			;;
		*xterm*)
			print -n "\e]12;$@\a"
			;;
	esac
}

#with print -Pn we would do substitution/expansion
#see http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
#we used that before to expand %m and %~ but this is now done in
#_get_title_folder so don't use it anymore (and if we want expansion we can
#always call print -Pn ourselves)
function _set_title() {
	if [[ $1 == "--window" ]]; then
		shift
		case $TERM in
			*screen*|*tmux*)
				print -n "\ek$@\e\\"
				;;
		esac
	else
		## Rely directly on the zsh terminfo commands
		# if tput hs; then
		# 	print -n "$(tput tsl)$@$(tput fsl)"
		if [[ $terminfo[hs] == "yes" ]]; then
			print -n "$(echoti tsl)$@$(echoti fsl)"
		else
			case $TERM in
				#xterm has 'hs' but the terminfo does not give it :-(
				#This will work with screen.xterm-256color too
				#Note that tmux* has 'hs' so it is already handled
				*xterm*)
					print -n "\e]0;$@\a" #this is xterm hardstatus line
					#print -Pn "\e]2;$@\a" #this is an alias
					#print -Pn "\e_$@\e\\" #this is for screen, but screen understand xterm's one too
					;;
			esac
		fi
	fi
}
#}}}1

### Complétion automatique {{{1
setopt list_types list_packed nolist_beep
setopt complete_in_word
zmodload zsh/complist
autoload -Uz compinit && compinit # initialisation du système de complétion automatique.

# press ^xh (control-x h) for getting tags in context; ^x? (control-x ?) to run complete_debug with trace output grmlcomp() {
zstyle ':completion:*' completer _oldlist _expand _prefix _complete _prefix _files _ignored
zstyle ':completion::complete:*' use-cache on

zstyle ':completion:*:default' menu select

zstyle ':completion:*:default' list-colors ${(@s.:.)LS_COLORS}
zstyle ':completion:*:descriptions'		 format $'%F{red}%B%d:%b%f'
zstyle ':completion:*:warnings'				 format $'%F{red}No matches for:%f %d' # set format for warnings
zstyle ':completion:*:messages'				 format 'Completion: %d'
zstyle ':completion:*:options'				 auto-description 'specify: %d'
_prompt='%S#%M (%p)%s'
zstyle ':completion:*:default' list-prompt $_prompt
MENUPROMPT=$_prompt
unset _prompt

zstyle ':completion:*'					 verbose true  # provide verbose completion information
zstyle ':completion:*:options'				 description 'yes' # describe options in full

zstyle ':completion:*:matches'				 group 'yes'	# separate matches into groups
zstyle ':completion:*'								 group-name ''
zstyle ':completion:*:*:-subscript-:*' group-order indexes parameters				 # offer indexes before parameters in subscripts

######### specific completions #########

## expand
zstyle ':completion:*:expand:*'				 group-order expansion # menu with all expansions for expand completer

## commands
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~' # don't complete backup files as executables

## cd
zstyle ':completion:*:*:cd:*' group-order local-directories path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select							 # complete 'cd -<tab>' with menu
#in /usr/bin/t<TAB>, don't try to complete /usr
zstyle ':completion:*:accept-exact-dirs' true

## man
zstyle ':completion:*:manuals'		separate-sections true									 # man completion
#zstyle ':completion:*:manuals.*'	insert-sections		true
#zstyle ':completion:*:man:*'			 menu yes select

## zcompile
zstyle ':completion:*:*:zcompile:*'		 ignored-patterns '(*~|*.zwc)'			 # define files to ignore for zcompile

## processes
zstyle ':completion:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:processes' verbose true
zstyle ':completion:*:*:processes' menu yes select
zstyle ':completion:*:processes' force-list always
zstyle ':completion:*:processes*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion::complete:kill::' group-order jobs processes

## processes name (for killall, pgrep, ..."
# Provide more processes in completion of programs like killall:
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'

## history
zstyle ':completion:*:history-words'	 list false
zstyle ':completion:*:history-words'	 menu yes  # activate menu
zstyle ':completion:*:history-words'	 remove-all-dups yes	# ignore duplicate entries
zstyle ':completion:*:history-words'	 stop yes #stop once at history border

## editors
# Après le nom d'un éditeur, on ignore les fichiers .dvi. Cela permet,
# dans un répertoire où on a fichier.tex et fichier.dvi, d'accéder à
# fichier avec f<tab>.
binary=(.o .zo .zi .zix '.sw?' .jpg .gif .dvi .dvi.gz .pdf)
edit_ignore=(.aux .old .log '#' '~' $binary)
editors=(pico vim vi nvi gvim '*emacs' nedit nano joe mcedit cooledit)
zstyle ":completion:*:*:(${(j:*|:)editors}*):*" ignored-patterns \
\*${^edit_ignore}
zstyle ":completion:*:*:cat:*" ignored-patterns \*${^binary} '*.gz'
unset binary editors edit_ignore

## accounts
zstyle ':completion:*:my-accounts' users-hosts $myaccounts
#zstyle ':completion:*:other-accounts' users-hosts $other_accounts
#other accounts: completion for finger like commands
#my-accounts: completion for ssh like commands

## hosts
[[ -f ~/.ssh/config ]] && : ${(A)ssh_config_hosts:=${${${${(@M)${(f)"$(<~/.ssh/config)"}:#Host *}#Host }:#*\**}:#*\?*}}
[[ -f ~/.ssh/known_hosts ]] && : ${(A)ssh_known_hosts:=${${${(f)"$(<$HOME/.ssh/known_hosts)"}%%\ *}%%,*}}
zstyle ':completion:*:hosts' hosts $ssh_config_hosts $ssh_known_hosts
unset ssh_config_hosts ssh_known_hosts

## urls
zstyle ':completion:*:urls' local 'www' 'WWW' '/var/www/' 'public_html' # command for process lists, the local web server details and host completion
### }}}

### Specific command completion {{{1
# use generic completion system for programs not yet defined; (_gnu_generic works with commands that provide a --help option with "standard" gnu-like output.)
MYCOMMANDS=(ploum)
for compcom in cat cp curl df emacs emacsclient feh file grep head idn ln localedef mv paste tail touch scrot shred uname watch wc wget zsh $MYCOMMANDS; do
	[[ -z ${_comps[$compcom]} ]] && compdef _gnu_generic ${compcom}
done; unset compcom; unset MYCOMMANDS

zstyle ':completion:*:evince::' \
	file-patterns '*.(#i)(dvi|djvu|tiff|pdf|ps|xps)(|.bz2|.gz|.xz|.z) *(-/)' '*'

# Don't complete the same twice for kill/diff.
zstyle ':completion:*:(kill|diff):*'			 ignore-line yes

#a _precommand is something that can be put before any shell construction,
#like time, nohup, nocorrect ...
#a command is something that launches another command, like sudo
compdef _command socat_readline ledit ile
compdef _vim gvi vi
compdef _pgrep psinfo
compdef _pids read_process_env
compdef _sudo dbussudo
compdef _pacman mypacman
compdef _cd cdl
compdef _git gitk=git-rev-list
compdef _ponymix volume

function reload_completion() {
	local f
	f=(~/.zsh/completion/*(.))
	unfunction $f:t 2> /dev/null
	autoload -Uz $f:t
}
function reload_compdump() {
	rm ~/.zcompdump
	compinit
	reload_completion
}
### }}}

### Hooks {{{1
#note -U: don't expand alias, -z: use zsh native mode (even if shell
#currently running in ksh emulation)

#quote shell metacharacters when typing an url
if autoload -Uz url-quote-magic ; then
	 zle -N self-insert url-quote-magic
	 #zstyle ':url-quote-magic:*' url-metas '*?[]^()~#{}='
fi

#pick-web-browser open a file in firefox if X is running, otherwise use w3m
autoload -Uz pick-web-browser

if is-at-least 4.3.11; then
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
#in phare (zsh 4.3.10) chpwd_recent_dirs exit but produce an error...
#so i have to use is-at-least
add-zsh-hook chpwd chpwd_recent_dirs

autoload -Uz vcs_info
autoload -Uz zcalc zargs
autoload -Uz colors && colors
zstyle ':completion:*:*:cdr:*:*' menu selection
zstyle ':vcs_info:*' enable hg svn
#for git i use a ruby script

zstyle ':vcs_info:*' actionformats " [%a|%b%u%c]"
zstyle ':vcs_info:*' formats " [%b%u%c]"
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:*' check-for-changes false
# true: slower, but lets us show changes to working/index
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:hg:*' hgrevformat '%r'
zstyle ':vcs_info:*' unstagedstr "?"
zstyle ':vcs_info:*' stagedstr "!"
else
chpwd_recent_dirs() {}
vcs_info() {}
fi

#keybinding: Esc h
autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz run-help-svn
autoload -Uz run-help-svk
#}}}

### Bindings {{{1
# Use bindkey to see current bindings
# Cf also ~/doc/logiciels/zsh for default bindings

# zle line init/finish {{{
zle -N zle-line-init _zle_line_init
zle -N zle-line-finish _zle_line_finish
function _zle_line_init() {
	_set_cursor $_CURSOR_INSERT

	## Tell terminal to send escape codes around pastes.
	## Cf copy-paste mode (this is now handled by bracketed-paste)
	# case $TERM in
	# 	rxvt*|xterm*)
	# 		printf '\e[?2004h'
	# 		;;
	# esac
	
	# Finally, make sure the terminal is in application mode, when zle is
	# active. Only then are the values from $terminfo valid.
	if [[ -n ${terminfo[smkx]} ]] && [[ -n ${terminfo[rmkx]} ]]; then
		echoti smkx
	fi
	zle -K myviins
}

function _zle_line_finish() {
	ZLE_LINE_ABORTED=$BUFFER
	# Leave application mode
	if [[ -n ${terminfo[smkx]} ]] && [[ -n ${terminfo[rmkx]} ]]; then
		echoti rmkx
	fi

	## Tell it to stop bracketed paste mode when we leave zle, so pasting in
	## other programs doesn't get the ^[[200~ codes around the pasted text.
	# case $TERM in
	# 	rxvt*|xterm*)
	# 		printf '\e[?2004l'
	# 		;;
	# esac

	_set_cursor $_CURSOR_NORMAL
}
#}}}
# vi-mode {{{2
# Change cursor color between normal and insert mode
# See https://bbs.archlinux.org/viewtopic.php?id=95078
function _zle-keymap-select () {
	if [[ $KEYMAP == vicmd ]]; then
		_set_cursor $_CURSOR_NORMAL
	#elif [ $KEYMAP = paste ]; then
	#		 #echo -ne "\033]12;DarkOrchid\007"
	#		 echo -ne "\033]12;DarkViolet\007"
	else
		_set_cursor $_CURSOR_INSERT
	fi
}
zle -N zle-keymap-select _zle-keymap-select

function bindkeyboth() {
	# bindkey -M viins ... (default bindkey 'main' with bindkey -v)
	# bindkey -M vicmd ... (shortcut: bindkey -a)
	bindkey $@
	bindkey -a $@
}
#}}}
#{{{ Copy-paste mode
#
#Update: this is now default in zsh, cf https://archive.zhimingwang.org/blog/2015-09-21-zsh-51-and-bracketed-paste.html
# We activate bracketed-paste-magic so that url-quoting work
if [[ $TERM == dumb ]]; then
	unset zle_bracketed_paste
else
	autoload -Uz bracketed-paste-magic && zle -N bracketed-paste bracketed-paste-magic
fi
# # Code from Mikael Magnusson: http://www.zsh.org/mla/users/2011/msg00367.html
# #
# # Requires xterm, urxvt, iTerm2 or any other terminal that supports bracketed
# # paste mode as documented: http://www.xfree86.org/current/ctlseqs.html
# 
# # create a new keymap to use while pasting
# bindkey -N paste
# # make everything in this keymap call our custom widget
# bindkey -R -M paste "^@"-"\M-^?" zle_paste_insert
# # these are the codes sent around the pasted text in bracketed
# # paste mode.
# # do the first one with both -M viins and -M vicmd in vi mode
# bindkeyboth '^[[200~' zle_start_paste
# bindkey -M paste '^[[201~' zle_end_paste
# # insert newlines rather than carriage returns when pasting newlines
# bindkey -M paste -s '^M' '^J'
# 
# zle -N zle_start_paste
# zle -N zle_end_paste
# zle -N zle_paste_insert
# 
# # switch the active keymap to paste mode
# function zle_start_paste() {
# 	zle -K paste
# }
# 
# # go back to our normal keymap, and insert all the pasted text in the
# # command line. this has the nice effect of making the whole paste be
# # a single undo/redo event.
# function zle_end_paste() {
# 	zle -K main
# 	LBUFFER+=$_zle_paste_content
# 	unset _zle_paste_content
# }
# 
# function zle_paste_insert() {
# 	_zle_paste_content+=$KEYS
# }
#}}}
# Terminfo (Up, Down,...) {{{
# http://zshwiki.org/home/zle/bindkeys
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"		]]	&& bindkeyboth	"${key[Home]}"		beginning-of-line
[[ -n "${key[End]}"			]]	&& bindkeyboth	"${key[End]}"			end-of-line
[[ -n "${key[Insert]}"	]]	&& bindkeyboth	"${key[Insert]}"	overwrite-mode
[[ -n "${key[Delete]}"	]]	&& bindkeyboth	"${key[Delete]}"	delete-char
[[ -n "${key[PageUp]}"			]]	&& bindkeyboth	"${key[PageUp]}" history-beginning-search-backward
[[ -n "${key[PageDown]}"		]]	&& bindkeyboth	"${key[PageDown]}" history-beginning-search-forward
[[ -n "${key[Up]}"			]]	&& bindkeyboth	"${key[Up]}"			up-line-or-history
[[ -n "${key[Down]}"		]]	&& bindkeyboth	"${key[Down]}"		down-line-or-history
[[ -n "${key[Left]}"		]]	&& bindkeyboth	"${key[Left]}"		backward-char
[[ -n "${key[Right]}"		]]	&& bindkeyboth	"${key[Right]}"		forward-char

# Shift-tab Perform backwards menu completion
if [[ -n "$terminfo[kcbt]" ]]; then
		bindkeyboth "$terminfo[kcbt]" reverse-menu-complete
elif [[ -n "$terminfo[cbt]" ]]; then # required for GNU screen
		bindkeyboth "$terminfo[cbt]"	reverse-menu-complete
fi

# Les xterms ici envoient des codes spécifiques pour Ctrl-flèche
bindkeyboth '^[[5D' backward-word #control gauche
bindkeyboth '^[[5C' forward-word #control droite
# les nouveaux xterms
bindkeyboth '^[[1;5D' backward-word
bindkeyboth '^[[1;5C' forward-word

# }}}
# menu keys binding {{{
bindkey -M listscroll '\e' send-break
bindkey -M listscroll -r '^I' #don't scroll with tab, go directly to completion
#[[ -n "${key[PageUp]}" ]]	&& bindkey -M listscroll "${key[PageUp]}" backward-complete-word
#there is no up in listscroll (so key[Up] does not work too), only down
[[ -n "${key[PageDown]}" ]]  && bindkey -M listscroll "${key[PageDown]}" complete-word

[[ -n "${key[PageUp]}" ]]  && bindkey -M menuselect "${key[PageUp]}" backward-word
[[ -n "${key[PageDown]}" ]]  && bindkey -M menuselect "${key[PageDown]}" forward-word

bindkey -M menuselect '\e' send-break
bindkey -M menuselect '^g' send-break
bindkey -M menuselect '*' history-incremental-search-forward
bindkey -M menuselect '^t' vi-insert #toggle between insert and command in menu

## use the vi navigation keys (hjkl) besides cursor keys in menu completion
bindkey -M menuselect 'h' vi-backward-char				# left
bindkey -M menuselect 'k' vi-up-line-or-history		# up
bindkey -M menuselect 'l' vi-forward-char					# right
bindkey -M menuselect 'j' vi-down-line-or-history # bottom

bindkey -M menuselect 'u' undo
bindkey -M menuselect -- '-' undo
[[ -n "${key[Delete]}" ]] && bindkey -M menuselect ${key[Delete]} undo
# menu selection: pick item but stay in the menu
bindkey -M menuselect 'o' accept-and-menu-complete
bindkey -M menuselect "+" accept-and-menu-complete
[[ -n "${key[Insert]}" ]] && bindkey -M menuselect ${key[Insert]} accept-and-menu-complete
# accept a completion and try to complete again by using menu
# completion; very useful with completing directories
# by using 'undo' one's got a simple file browser
bindkey -M menuselect 'm' accept-and-infer-next-history
bindkey -M menuselect '^o' accept-and-infer-next-history
bindkey -M menuselect "=" accept-and-infer-next-history
#}}}
#Puts emacs like keybindings back {{{
bindkey -M myviins -r "^X"
bindkeyboth "^@" set-mark-command
bindkeyboth "^A" beginning-of-line
bindkeyboth "^B" backward-char
bindkey			"^D" delete-char-or-list #is list-choices in vicmd
bindkeyboth "^E" end-of-line
bindkeyboth "^F" forward-char
bindkeyboth "^G" list-expand #was send-break
bindkeyboth "^H" backward-delete-char
bindkeyboth "^?" backward-delete-char
bindkeyboth "^J" accept-line
bindkeyboth "^K" kill-line
bindkeyboth "^L" clear-screen
bindkeyboth "^M" accept-line
bindkeyboth "^Q" push-line-or-edit
#this is now _history-incremental-preserving-pattern-search-*
#bindkeyboth "^R" history-incremental-pattern-search-backward
#bindkeyboth "^S" history-incremental-pattern-search-forward
bindkeyboth "\et" transpose-chars
bindkeyboth "^U" kill-whole-line
bindkeyboth "^V" vi-quoted-insert
bindkeyboth "^W" backward-kill-word
bindkeyboth "^Y" yank
bindkeyboth "^_" undo

bindkeyboth "^X^B" vi-match-bracket
bindkeyboth "^X^D" list-choices
bindkeyboth "^X^E" edit-command-line #bash like binding
bindkeyboth "^X^F" vi-find-next-char
bindkeyboth "^X^G" send-break
bindkeyboth "^X^H" backward-kill-word
bindkeyboth "^X^?" backward-kill-word
bindkeyboth "^X^I" self-insert-unmeta
bindkeyboth "^X^J" self-insert-unmeta
bindkeyboth "^X^L" clear-screen
bindkeyboth "^X^K" kill-buffer
bindkeyboth "^X^M" self-insert-unmeta
bindkeyboth "^X^N" down-line-or-history
bindkeyboth "^X^P" up-line-or-history
bindkeyboth "^X^O" overwrite-mode
bindkeyboth "^X^U" undo
bindkeyboth "^X^V" vi-cmd-mode
bindkeyboth "^X^X" exchange-point-and-mark
bindkeyboth "^X^_" copy-prev-word
bindkeyboth "^XA" accept-and-hold
bindkeyboth "^XB" backward-word
bindkeyboth "^XC" capitalize-word
bindkeyboth "^XD" kill-word
bindkeyboth "^XF" forward-word
bindkeyboth "^XG" get-line
bindkeyboth "^XH" run-help
bindkeyboth "^XL" down-case-word
bindkeyboth "^XN" history-search-forward
bindkeyboth "^XP" history-search-backward
bindkeyboth "^XQ" push-line
bindkeyboth "^XS" spell-word
bindkeyboth "^XT" transpose-words
bindkeyboth "^XU" up-case-word
bindkeyboth "^XW" copy-region-as-kill
bindkeyboth "^X_" insert-last-word
bindkeyboth "^Xa" accept-and-hold
bindkeyboth "^Xb" backward-word
bindkeyboth "^Xd" kill-word
bindkeyboth "^Xf" forward-word
bindkeyboth "^Xg" list-expand
#bindkeyboth "^Xh" run-help #let the default of completion help '_complete_help'
# Search in history according to first word in buffer
bindkeyboth "^Xn" history-search-forward
bindkeyboth "^Xp" history-search-backward
bindkeyboth "^Xq" push-line
bindkeyboth "^Xr" history-incremental-search-backward
bindkeyboth "^Xs" history-incremental-search-forward
bindkeyboth "^Xu" undo
bindkeyboth "^Xt" transpose-words
bindkeyboth "^Xw" copy-region-as-kill
bindkeyboth "^Xx" execute-named-cmd
bindkeyboth "^Xy" yank-pop
bindkeyboth "^Xz" execute-last-named-cmd
bindkeyboth "^X " expand-history
bindkeyboth "^X!" expand-history
bindkeyboth '^X"' quote-region
bindkeyboth '^X$' spell-word
bindkeyboth "^X*" expand-word
bindkeyboth "^X=" what-cursor-position
bindkeyboth "^X'" quote-line
bindkeyboth "^X-" neg-argument
bindkeyboth "^X." insert-last-word
bindkeyboth "^X<" beginning-of-buffer-or-history
bindkeyboth "^X>" end-of-buffer-or-history
bindkeyboth "^X?" which-command #the default was _complete_debug; use '^Xx _complete_debug' to get it
bindkeyboth "^X|" vi-goto-column
#}}}
# Custom functions for extra bindings {{{
bindkey -M myviins -r '^o'
bindkeyboth '^oa' accept-line-and-down-history #this is what ^o would do
bindkeyboth '^om' menu-complete

# For ^oh: complete word from history with menu (from Book: ZSH, OpenSource-Press)
zle -C hist-complete complete-word _generic
zstyle ':completion:hist-complete:*' completer _history
bindkeyboth "^oh" hist-complete # complete word from history with menu

autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkeyboth "^oH" history-beginning-search-menu # complete full command from history with menu

# From: http://chneukirchen.org/blog/archive/2011/02/10-more-zsh-tricks-you-may-not-know.html
# Style for completion in history with ^p,^n (difference with ^oh above is
# that there is no menu)
bindkey "^p" _history-complete-older
bindkey "^n" _history-complete-newer

# ^of: list files
zle -C complete-files complete-word _generic
zstyle ':completion:complete-files:*' completer _files
bindkeyboth "^of" complete-files

autoload -Uz incremental-complete-word
zle -N incremental-complete-word
bindkeyboth '^xi' incremental-complete-word

autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkeyboth "^o," copy-earlier-word

autoload -Uz edit-command-line
zle -N edit-command-line
bindkeyboth '^oe' edit-command-line

# insert unicode character
# usage example: 'ctrl-o u' 00A7 'ctrl-o u' will give you an §
# See for example http://unicode.org/charts/ for unicode characters code
autoload -Uz insert-unicode-char
zle -N insert-unicode-char
bindkeyboth '^ou' insert-unicode-char

# This function allows you type a file pattern, and see the results of the
# expansion at each step. When you hit return, they will be inserted into
# the command line.
autoload -Uz insert-files
zle -N insert-files
bindkeyboth "^og" insert-files

# add a command line to the shells history without executing it
function _zle_commit-to-history() {
		print -s ${(z)BUFFER}
		zle send-break
}
zle -N zle_commit-to-history _zle_commit-to-history
bindkeyboth "^o^m" zle_commit-to-history

# History search with globs.
# 21sep2011  +chris+
# 05jun2012  +chris+	and keeping the rest of the line
# Note: the difference with standard history-incremental-pattern-search-backward
# is that history... erase the already typed command line. Here this
# function use narrow-region to just change the state of the cursor. So the
# old hisotry-* can be obtained by ^U^R.
autoload -Uz narrow-to-region
function _zle_history-incremental-preserving-pattern-search-backward() {
	local state
	MARK=CURSOR  # magick, else multiple ^R don't work
	narrow-to-region -p "$LBUFFER${BUFFER:+>>}" -P "${BUFFER:+<<}$RBUFFER" -S state
	zle end-of-history
	zle history-incremental-pattern-search-backward
	narrow-to-region -R state
}
function _zle_history-incremental-preserving-pattern-search-forward() {
	local state
	MARK=CURSOR  # magick, else multiple ^R don't work
	narrow-to-region -p "$LBUFFER${BUFFER:+>>}" -P "${BUFFER:+<<}$RBUFFER" -S state
	zle beginning-of-history
	zle history-incremental-pattern-search-forward
	narrow-to-region -R state
}
zle -N zle_history-incremental-preserving-pattern-search-backward _zle_history-incremental-preserving-pattern-search-backward
bindkeyboth "^O^R" zle_history-incremental-preserving-pattern-search-backward
# bindkey -M isearch "^R" history-incremental-pattern-search-backward
zle -N zle_history-incremental-preserving-pattern-search-forward _zle_history-incremental-preserving-pattern-search-forward
bindkeyboth "^O^S" zle_history-incremental-preserving-pattern-search-forward
# bindkey -M isearch "^S" zle_history-incremental-pattern-search-forward

function _zle_mquote() {
	zle beginning-of-line
	zle forward-word
	# RBUFFER="'$RBUFFER'"
	RBUFFER=${(q)RBUFFER}
	zle end-of-line
}
zle -N zle_mquote _zle_mquote
bindkeyboth '^oq' zle_mquote

function _zle_rationalise-dot() {
	local MATCH
	if [[ $LBUFFER =~ '(^|/| |	|'$'\n''|\||;|&)\.\.$' ]]; then
		LBUFFER+=/
		zle self-insert
		zle self-insert
	else
		zle self-insert
	fi
}
zle -N zle_rationalise-dot _zle_rationalise-dot
bindkey . zle_rationalise-dot
# without this, typing a . aborts incremental history search
if is-at-least 4.3.7; then
	bindkey -M isearch . self-insert
fi

# only slash should be considered as a word separator:
function _zle_slash-backward-kill-word() {
		local WORDCHARS=$_WORDCHARS
		zle backward-kill-word
}
zle -N zle_slash-backward-kill-word _zle_slash-backward-kill-word
bindkeyboth '^x^w' zle_slash-backward-kill-word

# Create directory under cursor or the selected area
# Press ctrl-oM to create the directory under the cursor or the selected area.
# To select an area press ctrl-@ or ctrl-space and use the cursor.
# Use case: you type "mv abc ~/testa/testb/testc/" and remember that the
# directory does not exist yet -> press ctrl-XM and problem solved
function _zle_inplaceMkDirs() {
	local PATHTOMKDIR
	if ((REGION_ACTIVE==1)); then
			local F=$MARK T=$CURSOR
			if [[ $F -gt $T ]]; then
					F=${CURSOR}
					T=${MARK}
			fi
			# get marked area from buffer and eliminate whitespace
			PATHTOMKDIR=${BUFFER[F+1,T]%%[[:space:]]##}
			PATHTOMKDIR=${PATHTOMKDIR##[[:space:]]##}
	else
			local bufwords iword
			bufwords=(${(z)LBUFFER})
			iword=${#bufwords}
			bufwords=(${(z)BUFFER})
			PATHTOMKDIR="${(Q)bufwords[iword]}"
	fi
	[[ -z "${PATHTOMKDIR}" ]] && return 1
	PATHTOMKDIR=${~PATHTOMKDIR}
	if [[ -e "${PATHTOMKDIR}" ]]; then
			zle -M " path already exists, doing nothing"
	else
			zle -M "$(mkdir -p -v "${PATHTOMKDIR}")"
			zle end-of-line
	fi
}
zle -N zle_inplaceMkDirs _zle_inplaceMkDirs
bindkeyboth '^oM' zle_inplaceMkDirs

# press "ctrl-e d" to insert the actual date in the form yyyy-mm-dd
function _zle_insert-datestamp() { LBUFFER+=${(%):-'%D{%Y-%m-%d}'}; }
function _zle_insert-timedatestamp() { LBUFFER+=${(%):-'%D{%Y-%m-%dT%T%z}'}; }
zle -N zle_insert-datestamp _zle_insert-datestamp
zle -N zle_insert-timedatestamp _zle_insert-timedatestamp
bindkeyboth "^od" zle_insert-datestamp
bindkeyboth "^ot" zle_insert-timedatestamp

# prepend the current command with "sudo"
function _zle_sudo-command-line() {
	[[ -z $BUFFER ]] && zle up-history
	if [[ $BUFFER != sudo\ * ]]; then
			BUFFER="sudo $BUFFER"
			CURSOR=$(( CURSOR+5 ))
	fi
}
zle -N zle_sudo-command-line _zle_sudo-command-line
bindkeyboth "^os" zle_sudo-command-line

### jump behind the first word on the cmdline.
### useful to add options.
function _zle_jump_after_first_word() {
		local words
		words=(${(z)BUFFER})

		if (( ${#words} <= 1 )) ; then
				CURSOR=${#BUFFER}
		else
				CURSOR=${#${words[1]}}
		fi
}
zle -N zle_jump_after_first_word _zle_jump_after_first_word
bindkeyboth '^o1' zle_jump_after_first_word

# expand-or-complete-or-list-files
function _zle_complete-or-list-files() {
	if [[ $#BUFFER == 0 ]]; then
		#zle complete-files
		BUFFER="ls "
		CURSOR=3
		zle list-choices
		zle backward-kill-word
	else
		#zle expand-or-complete
		zle complete-word
		#by default TAB is bound to expand-or-complete
		#but this way I can control how expansion is done in the compinit system
	fi
}
zle -N zle_complete-or-list-files _zle_complete-or-list-files
bindkeyboth '^I' zle_complete-or-list-files #^I=tab

# Allow to recover from C-c or failed history expansion (thx Mikachu).
# 26may2012  +chris+
function _zle_recover_line_or_else() {
	if [[ -z $BUFFER && $CONTEXT = start && $zsh_eval_context = shfunc*
				&& -n $ZLE_LINE_ABORTED
				&& $ZLE_LINE_ABORTED != $history[$((HISTCMD-1))] ]]; then
		LBUFFER+=$ZLE_LINE_ABORTED
		unset ZLE_LINE_ABORTED
	else
		zle .$WIDGET
	fi
}
zle -N up-line-or-history _zle_recover_line_or_else

#from http://chneukirchen.org/blog/archive/2015/02/10-fancy-zsh-tricks-you-may-not-know.html
#makes ^Xt (transpose words) match words as 'shell words'
autoload -Uz transpose-words-match
zstyle ':zle:transpose-words' word-style shell
zle -N transpose-words transpose-words-match

# replace the selection with its output
# ask for a command if there is no selection
function _zle_output_command {
	#local state
	#MARK=CURSOR  # magick, else multiple ^R don't work
	#narrow-to-region -p "$LBUFFER${BUFFER:+>>}" -P "${BUFFER:+<<}$RBUFFER" -S state
	#output=$(eval $BUFFER) || return
	#BUFFER=$output
	#CURSOR=0
	#narrow-to-region -R state
	local REPLY OUTPUT
	if ((REGION_ACTIVE==1)); then
			local F=$MARK T=$CURSOR
			if [[ $F -gt $T ]]; then
					F=${CURSOR}
					T=${MARK}
			fi
			REPLY=${BUFFER[F+1,T]}
			OUTPUT=${$(eval $REPLY)//"\n"/ }
			BUFFER="$BUFFER[1,F]$OUTPUT$BUFFER[T+1,-1]"
			REGION_ACTIVE=0
	else
		read-from-minibuffer
		OUTPUT=${$(eval $REPLY)//"\n"/ }
		BUFFER="$LBUFFER$OUTPUT$RBUFFER"
	fi
}
zle -N zle_output_command _zle_output_command
bindkey '^XX' zle_output_command

# fzf + git, cf https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

_zle_fzf-down() {
  fzf --height=80% "$@" --border
}

_zle_fzf_git_f() { #git status
  is_in_git_repo || return
  git -c color.status=always status --short |
  _zle_fzf-down -m --ansi --nth 2..,.. \
  --preview 'git diff -B --color=always -- {-1} | diff-fancy.rb' |
  cut -c4- | sed 's/.* -> //'
}

_zle_fzf_git_b() { #git branches
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  _zle_fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git lgm --color=always --date=short $(sed s/^..// <<< {} | cut -d " " -f1 ) --' |
  sed 's/^..//' | cut -d' ' -f1 | sed 's#^remotes/##'
}

_zle_fzf_git_t() { #git tags
  is_in_git_repo || return
  git tag --sort -version:refname |
  _zle_fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {}'
}

_zle_fzf_git_h() { #git log
  is_in_git_repo || return
  git lgm --date=short --color=always |
  _zle_fzf-down --ansi --no-sort --reverse --multi \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | head -1 | xargs git show --color=always' |
  grep -o "[a-f0-9]\{7,\}" | head -1
}

_zle_fzf_git_r() { #git remote
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  _zle_fzf-down --tac \
    --preview 'git lgm --color=always --date=short --remotes={1}' |
  cut -d$'\t' -f1
}

bind-git-helper() {
  local c
  for c in $@; do
    eval "_zle_fzf_git_$c-widget() { local result=(\"\${(@f)\$(_zle_fzf_git_$c)}\"); zle reset-prompt; [[ -n \$result ]] && LBUFFER+=\${(@q)result} }"
    eval "zle -N zle_fzf_git_$c-widget" "_zle_fzf_git_$c-widget"
    eval "bindkey '^g^$c' zle_fzf_git_$c-widget"
  done
}
bindkey -r '^g' #was list-expand
bind-git-helper f b t r h
#^g^f: files (git status)
#^g^b: branches
#^g^t: tags
#^g^r: remote
#^g^h: log
bindkey '^g ' list-expand
unfunction bind-git-helper

# }}}
#{{{ Extra bindings for vicmd
bindkey -a '/'		 vi-history-search-forward
bindkey -a '?'		 vi-history-search-backward
bindkey -a 'gu' down-case-word
bindkey -a 'gU' up-case-word
bindkey -a 'gC' capitalize-word

bindkey -a 'gl' list-choices
bindkey -a 'gx' list-expand
bindkey -a 'gg' beginning-of-history
bindkey -a 'gG' end-of-history
bindkey -a 'gj' down-history
bindkey -a 'gk' up-history
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
#the end means that the cursor will be put at the end of the line
bindkey -a '^p' history-beginning-search-backward-end
bindkey -a '^n' history-beginning-search-forward-end
bindkey -a 'gK' history-substring-search-up
bindkey -a 'gJ' history-substring-search-down

bindkey -a 'g1' jump_after_first_word
bindkey -a 'ge' edit-command-line
bindkey -a 'gf' complete-files
bindkey -a 'gh' hist-complete
bindkey -a 'gH' history-beginning-search-menu
bindkey -a 'gm' menu-complete
bindkey -a 'gM' inplaceMkDirs
bindkey -a 'gq' mquote
bindkey -a 'gs' sudo-command-line
#}}}
# Summary of custom bindings {{{
# PageUp: history-beginning-search-backward #whole command completion
# PageDown: history-beginning-search-forward
# (I) "^p" _history-complete-older #word completion
# (I) "^n" _history-complete-newer
# (N) '^p' history-beginning-search-backward-end #complete and put cursor at end
# (N) '^n' history-beginning-search-forward-end
# (N) 'gj' down-history
# (N) 'gk' up-history
# bindkeyboth "^oh" hist-complete # complete word from history with menu
# bindkeyboth "^oH" history-beginning-search-menu # complete full command from history with menu
# bindkeyboth "^R" zle_history-incremental-preserving-pattern-search-backward
# bindkey -M isearch "^R" history-incremental-pattern-search-backward
# zle -N zle_history-incremental-preserving-pattern-search-forward
# bindkeyboth "^S" zle_history-incremental-preserving-pattern-search-forward
# bindkey -M isearch "^S" zle_history-incremental-pattern-search-forward
# '^o^p', '^op', (N) gJ history-substring-search-down #complete whole line as a subcommand
# '^o^n', '^on', (N) gK history-substring-search-up
# bindkeyboth '^Or', '^O^R' zaw-history #substring search with menu
# bindkeyboth '^Oz' zaw
#
#bindkeyboth '^I' complete-or-list-files #^I=tab
#bindkeyboth '^x^w' slash-backward-kill-word
#bindkeyboth '^xi' incremental-complete-word
#bindkeyboth "^o^m" commit-to-history
#bindkeyboth "^o," copy-earlier-word
#bindkeyboth '^o1',g1 jump_after_first_word
#bindkeyboth '^oa' accept-line-and-down-history
#bindkeyboth "^od" insert-datestamp
#bindkeyboth '^oe',ge edit-command-line
#bindkeyboth "^of",gf complete-files #ie force to show files
#bindkeyboth "^og" insert-files
#bindkeyboth "^oh",gh hist-complete # complete word from history with menu
#bindkeyboth "^oH",gH history-beginning-search-menu # complete command from history with menu
#bindkeyboth '^om',gm menu-complete
#bindkeyboth '^oM',gM inplaceMkDirs
#bindkeyboth '^oq',gq mquote
#bindkeyboth "^os",gs sudo-command-line
#bindkeyboth "^ot" insert-timedatestamp
#bindkeyboth '^ou' insert-unicode-char
#}}}
#}}}

### prompt and title {{{1

##### title  {{{2
function _get_title_folder() {
	#%m: hostname, %~: current directory
	#this set the tab name to hostname:  current dir if there is an ssh
	#connection, otherwise omit hostname
	if [[ $1 == "--short" ]]; then
		shift;
		if [[ -n $SSH_CLIENT ]]; then
			print -Pn "%m %-3~"
		else
			print -Pn "\%-3~" #tabname
		fi
	else
		if [[ -n $SSH_CLIENT ]]; then
			print -Pn "%m %~"
		else
			print -Pn "%~"
		fi
	fi
}

# When executing a command => command:folder
# + screen/tmux => windows name to basename of command
function _title_preexec() {
	local a=${${1## *}[(w)1]}  # get the command
	local b=${a##*\/}		# get the command basename
	a="${b}${1#$a}"			# add back the parameters
	a=${(V)a//\%/\%\%}	# escape non-visibles and print specials

	case $b in
		git* ) unset __GIT_NOSTATUS;;
	esac

	local title="$a:$(print -Pn $folder)"
	_set_title "$a:$(_get_title_folder)"
	_set_title --window $b #tabname
	#this put the base name of the command in the tab name (under screen and
	#tmux), and the full path + command in the hardstatus for all terms
}
add-zsh-hook preexec _title_preexec

function _title_precmd() {
	vcs_info;
	case $TERM in
		*tmux*|*screen*)
			#this set the tab name to the current dir and reset the hardstatus
			_set_title --window "$(_get_title_folder --short)"
			_set_title "" #reset hardstatus title
			;;
	*)
		_set_title "$(_get_title_folder)"
	esac
}
add-zsh-hook precmd _title_precmd

##### prompt	{{{2
# names and hosts
SHOWNAME="%n@"
[[ $ZSHNAME == $USERNAME ]] && SHOWNAME=""
SHOWHOST="%m"
if [[ -f /etc/machine-info ]]; then
	. /etc/machine-info
	SHOWHOST=$PRETTY_HOSTNAME
fi
SHOWNAMEHOST="${SHOWNAME}${SHOWHOST}"
#[[ -n $SSH_CONNECTION ]] && SHOWHOST="♒$SHOWHOST"
# [[ -n $SSH_CONNECTION ]] && SHOWNAMEHOST="☀$SHOWNAMEHOST"
[[ -n $SSH_CONNECTION ]] && SHOWHOST="☁$SHOWHOST"

#gitstatus.rb
if [[ -x /usr/bin/ruby && -n $__ZSHGITSTATUS ]]; then
	if is-at-least 4.3.11; then
		add-zsh-hook chpwd _chpwd_update_git_status
		add-zsh-hook preexec _preexec_update_git_status
		add-zsh-hook precmd _precmd_update_git_status

		function _chpwd_update_git_status() {
			__GIT_NOSTATUS=
		}
		function _preexec_update_git_status() {
			case "$2" in
				git*)
					__GIT_NOSTATUS=
					;;
			esac
		}
		function _precmd_update_git_status() {
			if [[ -z $__GIT_NOSTATUS ]]; then
				__GIT_CURRENT_STATUS=$(gitstatus.rb --prompt 2>/dev/null)
				[[ $__ZSHGITSTATUS != "full" ]] && __GIT_NOSTATUS=1
			fi
		}
	fi

	function _git_status() {
		echo $__GIT_CURRENT_STATUS
	}
else
	_git_status() {}
	zstyle ':vcs_info:*' enable git
fi
setopt prompt_subst
#Nice symbols: ▶ ± ➦ ✔ ✘ ⚡ ⑄ ⑂ ⑁ ⑃ ┌ ├ └ ─ ☢ ⚙ ↳ ➜ ✗ ↵ » ➤ ☁ ✓ ✔ λ ✱ ⇒ ● ↑ ✕ ✚ ✹ ✖ ➜ ═ ✭ ☁ ☂ ☀ ♒ ⑊
# Ⓐ Ⓜ Ⓓ ⓣ Ⓞ ⓐ ⓜ ⓧ ⓡ ⓤ
# ☀ ✹ ☄ ♆ ♀ ♁ ♐ ♇ ♈ ♉ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♣ ⚢ ⚲ ⚳ ⚴ ⚥ ⚤ ⚦ ⚒ ⚑ ⚐ ♺ ♻ ♼ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷ ✡ ✔ ✖ ✚ ✱ ✤ ✦ ❤ ➜ ➟ ➼ ✂ ✎ ✐ ⨀ ⨁ ⨂ ⨍ ⨎ ⨏ ⨷ ⩚ ⩛ ⩡ ⩱ ⩲ ⩵  ⩶ ⨠ ⬅ ⬆ ⬇ ⬈ ⬉ ⬊ ⬋ ⬒ ⬓ ⬔ ⬕ ⬖ ⬗ ⬘ ⬙ ⬟	⬤ 〒 ǀ ǁ ǂ ĭ Ť Ŧ

promptline="${SHOWNAMEHOST} "
promptline+='%40<…<%~ ' #current dir
promptline+='%(!.#.$)' #root or normal user
PROMPT="%B%U$promptline%b%u "
#PROMPT="%B%U  %(!.#.$)%b%u "

rpromptline='%F{yellow}${vcs_info_msg_0_}%f$(_git_status)'
rpromptline+='%0(?||%F{red}✘%?%f)' #errors
rpromptline+='%1(j|%F{green}✹%j%f|)' #jobs
[[ -n $_SHLVL ]] || export _SHLVL=$SHLVL #shlvl of our first interactive shell
[[ $SHLVL -ne $_SHLVL ]] && rpromptline+='%F{blue}⚙$((SHLVL-$_SHLVL))%f'
netns=$(ip netns identify)
[[ -n $netns ]] && rpromptline+='%F{blue}♒${netns}%f' #current network namespace
rpromptline+='%F{blue}⚡${LINENO}%f' #line number
case $TERM in
	linux*) RPROMPT= ;; # linux term does not like a RPROMPT
	*) RPROMPT=$rpromptline ;;
esac
unset SHOWNAME SHOWHOST SHOWNAMEHOST promptline rpromptline
# secondary prompt, printed when the shell needs more information to complete a command.
PS2='\`%_> '
# selection prompt used within a select loop.
PS3='?# '
# the execution trace prompt (setopt xtrace). default: '+%N:%i>'
PS4='+%N:%i:%_> '
# }}}
#}}}

### services {{{1
if [[ -x /bin/systemctl ]]; then
	salias -E ssd='systemctl'
	#--full only output everything in systemctl, but not in systemctl
	#status ploum.service so I trick it by adding more COLUMNS
	alias sd="COLUMNS=130 systemctl --full"
	alias sv="COLUMNS=130 systemctl --user --full"
	alias journal="journalctl -b -a"
	alias jdv="journal" #both user and syst logs
	alias jd="journal --system" #syst logs
	alias jv="journal --user" #user logs
	alias jvd="journal _SYSTEMD_OWNER_UID=$UID" #user + syst logs concerning me
	#TODO: use --system / --user instead
	fi
#}}}

### plugins {{{1
[[ -e $HOME/.config/broot/launcher/bash/br ]] && source $HOME/.config/broot/launcher/bash/br

if [[ -n $ZSHPLUGINS ]]; then
	[[ -f /home/dams/.config/cani/completions/_cani.zsh ]] && source /home/dams/.config/cani/completions/_cani.zsh

	plugindir=~/usr/dist/@zsh_plugins
	plugin=$plugindir/fzf
	if [[ -d $plugin ]]; then
		## Custom functions to complete with '**'
		_fzf_complete_cdl() {
			fzv -d --complete $@
		}
		# [[ -f /usr/share/fzf/key-bindings.zsh ]] && . /usr/share/fzf/key-bindings.zsh
		if command -v fd >/dev/null; then
			## for fzf/key-bindings.zsh
			_FZF_CTRL_T_COMMAND="command fd"
			_FZF_ALT_C_COMMAND="command fd --type d"

			## for fzf/completion.zsh; we put them before so they are not redefined
			# Use fd (https://github.com/sharkdp/fd) instead of the default find
			# command for listing path candidates.
			# - The first argument to the function ($1) is the base path to start traversal
			# - See the source code (completion.{bash,zsh}) for the details.
			_fzf_compgen_path() {
  			fd --hidden --follow --exclude ".git" --exclude ".hg" --exclude ".svn" . "$1"
			}

			## Use fd to generate the list for directory completion
			# This is used for completing 'foo **' where foo is in 
			# d_cmds=(${=FZF_COMPLETION_DIR_COMMANDS:-cd pushd rmdir})
			#
			_fzf_compgen_dir() {
  			fd --type d --hidden --follow --exclude ".git" --exclude ".hg" --exclude ".svn" . "$1"
			}
		fi

		source $plugin/key-bindings.zsh
		# This adds: Esc/Alt-c: fzf-cd; ^R: fzf-history; ^T: fzf-file
		source $plugin/completion.zsh
		# This completes `kill  <TAB>` (<- note the 2 spaces); and 'foo **<TAB>'
		# => cd/pushd/rmdir dir**; ls files**; ssh **; unset/unalias/export **
	fi

	plugin=$plugindir/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
	if [[ -e $plugin ]]; then
	source $plugin
	bindkeyboth '^O^P' history-substring-search-up
	bindkeyboth '^O^N' history-substring-search-down
	bindkeyboth '^Op' history-substring-search-up
	bindkeyboth '^On' history-substring-search-down
	fi

	plugin=$plugindir/zaw/zaw.plugin.zsh
	if [[ -e $plugin ]]; then
		source $plugin
		bindkeyboth '^Or' zaw-history
		#bindkeyboth '^O^R' zaw-history
		bindkeyboth '^Oz' zaw
		zstyle ':filter-select' extended-search yes # ^ and $
		zstyle ':filter-select' case-insensitive no
	fi

	plugin=$plugindir/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
	if [[ -e $plugin ]]; then
	source $plugin 2>/dev/null
	#Since the update I get the following errors:
	# zsh-syntax-highlighting: unhandled ZLE widget 'jump_after_first_word'
	# zsh-syntax-highlighting: unhandled ZLE widget 'sudo-command-line'
	# zsh-syntax-highlighting: unhandled ZLE widget 'zle_history-incremental-pattern-search-forward'
	# zsh-syntax-highlighting: unhandled ZLE widget 'inplaceMkDirs'
	# zsh-syntax-highlighting: unhandled ZLE widget 'mquote'

	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

	#fg=64 is like green, but it gives better bold
	ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=197' #middledarkpink
	ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=88' #darkpink
	ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=52' #'fg=23' #lightgreen

	ZSH_HIGHLIGHT_STYLES[builtin]='fg=29,bold'
	ZSH_HIGHLIGHT_STYLES[precommand]='fg=22,bold,underline' #middledarkgreen
	ZSH_HIGHLIGHT_STYLES[command]='fg=22,bold'
	ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=22'
	ZSH_HIGHLIGHT_STYLES[alias]='fg=28,bold' #lightergreen
	ZSH_HIGHLIGHT_STYLES[function]='fg=28'

	ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=58' #middlegreen
	ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=58'

	ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=24,bold'
	ZSH_HIGHLIGHT_STYLES[globbing]='fg=24,bold' #middledarkblue
	ZSH_HIGHLIGHT_STYLES[assign]='fg=24,bold'

	ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=94,bold' #darkyellow
	ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=237' #grey
	ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=237'
	ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=237,bold'
	ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=237,bold'

	ZSH_HIGHLIGHT_STYLES[path]='fg=17,bold' #darkblue

	ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=88,bold' #brown
	ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=53,bold' #purple
	ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=53,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=53,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=53,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=53,bold'
	fi

	plugin=$plugindir/zsh-completions/zsh-completions.plugin.zsh
	if [[ -e $plugin ]]; then
		source $plugin
	fi

	unset plugindir plugin
fi

#}}}

### Environment {{{1
#WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>' # the default
_WORDCHARS=$WORDCHARS
# only slash should be considered as a word separator
WORDCHARS="${_WORDCHARS:s@/@}"
WATCHFMT='%a: %n@%M(%l) %D@%T'
#TIMEFMT="%J	%U user %S system %P cpu %MM memory %*E total"
TIMEFMT="%J (%*Es) - u:%U+s:%S cpu:%P mem:%MM io:%I/%O"
# report about cpu-/system-/user-time of command if running longer than 5 seconds
REPORTTIME=5
MAILCHECK=0
watch=(notme)
# Note: mailpath is an array of filenames to check for email
[[ -e $MAILDIR/Inbox ]] && MAIL="$MAILDIR/Inbox"
# export MAIL MAILDIR

## fzf
if command -v fd >/dev/null; then
	export FZF_DEFAULT_COMMAND='fd --type f'

fi

#fzf is supposed to map ctrl-n to next-history automatically, but while this work for ctrl-p it bugs out for ctrl-n
## local base03="234" base02="235" base01="240" base00="241" base0="244" base1="245" base2="254" base3="230" yellow="136" orange="166" red="160" magenta="125" violet="61" blue="33" cyan="37" green="64"
##  --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue\
##  --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
## Note: {+} means the selected file, {} the file under the cursor
export FZF_DEFAULT_OPTS="--exact --reverse\
  --history=$HOME/.cache/fzf_history --multi
  --jump-labels='qsdfghjklmazertyuiopwxcvbn,;:!1234567890'\
  --preview-window=down:50%:wrap\
  --bind 'ctrl-y:select-all,\
ctrl-n:deselect-all,\
ctrl-t:toggle-all,\
ctrl-r:toggle-sort,\
ctrl-n:next-history,\
alt-p:toggle-preview,\
alt-w:toggle-preview-wrap,\
alt-t:top,\
ctrl-o:execute[xdg-open {}],\
alt-v:execute[gvi -- {}],\
alt-e:execute[$EDITOR -- {}],\
alt-o:execute[dofor xdg-open {+} >/dev/null],\
alt-i:execute[$EDITOR -- {+}],\
alt-u:execute[gvi -p -- {+}],\
alt-f:preview-page-down,\
alt-b:preview-page-up,\
alt-j:jump'\
  --color fg:-1,bg:-1,hl:160,fg+:235,bg+:254,hl+:160\
  --color info:136,prompt:136,pointer:234,marker:234,spinner:136"

# alias preview="fzf-tmux --ansi --preview '[ -d {} ] && exa --color=always --git -l {} || bat --plain --color \"always\" {}' --preview-window=down:50%:wrap"
#alias preview="fzf-tmux --ansi --preview '[ -d {} ] && ls -lF --color=always {} || bat --plain --color always {}' --preview-window=down:50%:wrap"
alias preview="fzv --tmux --"
alias visual="fzv --tmux --visual -- -1"
alias edit="fzv --tmux --edit -- -1"
alias open="fzv --tmux --open -- -1"
alias cdup="fzv --tmux --cdup --"
alias fzcd="fzv --tmux -d --cd --"
# todo: fzf git; fzf exec

## Paths
PKGMGR=$HOME/opt/pkgmgr
OPT=$HOME/opt/local

# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath infopath

_TEXLIVE="$OPT/packages/texlive"
if [[ -d $_TEXLIVE ]]; then
	#setup texlive
	path=("$_TEXLIVE/bin/x86_64-linux" $path)
	manpath=("$_TEXLIVE/texmf-dist/doc/man" $manpath)
	infopath=("$_TEXLIVE/texmf-dist/doc/info" $infopath)
fi
unset _TEXLIVE

#path is already set up in .initenv, but when launching a new login shell
#(for instance with tmux), /etc/profile will override it :-(
path=(~/bin $MYFILES/bin $OPT/bin $PKGMGR/*/bin(N) $path)
manpath=($OPT/man $PKGMGR/*/usr/share/man(N) $manpath)
infopath=($OPT/info $PKGMGR/*/usr/share/man(N) $infopath)
#if I changed $manpath, the colon at end is stripped, but we need it for man too look to the standard directories
export MANPATH="$MANPATH:"
export INFOPATH="$INFOPATH:"
export CPATH="$OPT/include:$PKGMGR/arch/usr/include:$CPATH"
# we don't want a trailing colon, which would mean the empty path, ie '.'
export LIBRARY_PATH="$OPT/lib:$PKGMGR/arch/usr/lib:${LIBRARY_PATH:+:$LIBRARY_PATH}"
export LD_LIBRARY_PATH="$LIBRARY_PATH"
export PKG_CONFIG_PATH="$OPT/lib/pkgconfig:$PKGMGR/arch/usr/share/pkgconfig:$PKGMGR/usr/lib/pkgconfig:$PKG_CONFIG_PATH"

# for perl local:lib
PERL5HOME=$PKGMGR/perl5
export PERL_LOCAL_LIB_ROOT="$PERL5HOME:$PERL_LOCAL_LIB_ROOT";
export PERL_MB_OPT="--install_base $PERL5HOME";
export PERL_MM_OPT="INSTALL_BASE=$PERL5HOME";

unset PKGMGR OPT

## Colors
# support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#I want 256 colors in xfce4-terminal
case $COLORTERM in
	"gnome-terminal"|"Terminal"|"xfce4-terminal"|"mate-terminal" )
		 [[ "$TERM" == "xterm" ]] && infocmp xterm-256color >/dev/null 2>&1 && TERM=xterm-256color
	 ;;
esac

# See https://github.com/gnunn1/terminix/wiki/VTE-Configuration-Issue
if [[ -n $VTE_VERSION && -r /etc/profile.d/vte.sh ]]; then
	source /etc/profile.d/vte.sh
fi
#}}}

### local {{{1
case $MYHOSTTYPE in
	perso )
		#watch=(notme) #now global
		alias muttinria="mutt -f $MAILDIR/inria/Inbox"
		alias muttphare="mutt -f $MAILDIR/phare/Inbox"
		#i think lightdm or xfce puts it to en_US.utf8
		export LANG=POSIX
		;;
	ens )
		alias afp='flrn -name afp'
		alias news='flrn -name news'
		#tmux in phare is too old to understand -A
		#alias aa="tmux -As android"
		alias aa="tmux attach -t android || tmux new -s android"
		alias tmuxssh="tmux attach -t ssh || tmux new -s ssh"
		path+=("/usr/local/sbin" "/usr/sbin" "/sbin")
		type avertissement_quota >/dev/null && avertissement_quota
		#On lit le fichier local:
		[[ -r /etc/skel-common/zshrc-after ]] && source /etc/skel-common/zshrc-after ;;
	imb )
		LESS="-RMiqx2" #/etc/profile.d override les valeurs de initenv...
		umask 022 #l'umask est à 002 par défaut
		alias 'lprprint' 'lpr -P melies31'
		alias tmuxssh="tmux attach -t ssh || tmux new -s ssh"
		#the year should not be important, they all point to the latest version
		alias tlcontrib="tlmgr --repository http://tlcontrib.metatex.org/2013"
		alias pacman="fakeroot pacman"
		#@imb an rvm ruby is set up, and GEM_PATH points to this rvm ruby and this confuses my local gems
		unset GEM_PATH
		manpath=("$HOME/opt/archfull/usr/share/man" $manpath)
		;;
esac
case $MYHOSTNAME in
	plafrim )
		#la commande module
		. /etc/profile.d/modules.sh
		alias modgrep="module avail 2>&1 | grep -v '^-\+' | sed 's/[ \t]\+/\n/' | grep"
		;;
esac

unset ZSHRECOMPILE ZSHNAME ZSHPLUGINS myaccounts
unfunction bindkeyboth salias
#}}}
