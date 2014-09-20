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

### zsh customisations {{{
#local variables that activate some features
local ZSHRECOMPILE ZSHNAME ZSHGITSTATUS ZSHPLUGINS

#zshrecompile
[[ $MYHOSTTYPE == "perso" ]] && ZSHRECOMPILE=t
#zshname
case $MYHOSTTYPE in
	perso ) ZSHNAME="dams" ;;
	imb) ZSHNAME="damienrobert" ;;
esac
[[ -z $ZSHNAME ]] && ZSHNAME="robert"
#gitstatus
[[ -n $MYHOSTTYPE ]] && ZSHGITSTATUS="light"
if [[ $MYHOSTNAME == "Durin" || $MYHOSTTYPE == "devel" ]]; then
	ZSHGITSTATUS=
fi
case $MYHOSTNAME in
	Feanor) ZSHGITSTATUS=full ;;
esac
#plugins
[[ -n $MYHOSTTYPE ]] && ZSHPLUGINS=t
case $MYHOSTNAME in
	Gondolin|Durin)
		ZSHPLUGINS=
		;;
esac

if [[ -n $ZSHRECOMPILE ]]; then
autoload -Uz zrecompile
zrecompile -p \
					 -R ~/.zshrc -- \
					 -M ~/.zcompdump -- \
					 ~/.zsh/completion.zwc ~/.zsh/completion/_* -- \
					 ~/.zsh/functions.zwc ~/.zsh/functions/*
fi
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
HISTFILE="$HOME/.history"
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
#}}}

### Alias and helper functions {{{1
# salias {{{2
# creates an alias and precedes the command with
# sudo if $EUID is not zero.
salias() { 
		emulate -L zsh
		local only=0 ; local multi=0
		while [[ $1 == -* ]] ; do
				case $1 in
						(-o) only=1 ;;
						(-a) multi=1 ;;
						(--) shift ; break ;;
						(-h)
								printf 'usage: salias [-h|-o|-a] <alias-expression>\n'
								printf '	-h			shows this help text.\n'
								printf '	-a			replace '\'' ; '\'' sequences with '\'' ; sudo '\''.\n'
								printf '					be careful using this option.\n'
								printf '	-o			only sets an alias if a preceding sudo would be needed.\n'
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

		local key="${1%%\=*}" ;  local val="${1#*\=}"
		if (( EUID == 0 )) && (( only == 0 )); then
				alias -- "${key}=${val}"
		elif (( EUID > 0 )) ; then
				(( multi > 0 )) && val="${val// ; / ; sudo }"
				alias -- "${key}=sudo ${val}"
		fi

		return 0
}

#Aliases {{{2
alias ls='ls --color=auto -F -T 0'
alias ll="ls -lh"
alias la="ls -A"
alias lla="ls -lhA"
alias lld="ls -lhd"
alias lsd="ls -d"
alias lsR="ls -R"
alias laR="ls -RA"

export GREP_COLOR="01;31"
export GREP_OPTIONS="--color=auto"

alias rm="nocorrect rm -i"
alias mv="nocorrect mv -i"
alias cp="nocorrect cp -i"

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
alias lualatexmk="mylatexmk -lua"
alias screenssh="screen -S ssh -RR"
alias tmuxssh="tmux new -As ssh"

alias g=git
alias gi="git --no-pager"
alias gitp="git --paginate"
alias gitdiffalias="git diff --no-index"

#control groups
alias psc="ps xawf -eo pid,user,cgroup,args"

alias HI='GIT_PAGER="$HOME/script/git/contrib/diff-highlight|less"'

#pacman
alias pacman_local="fakeroot pacman --config ~/.local/.pacman.conf"

# ~directories {{{2
#cd ~util -> /usr/local/util
hash -d mine=~/mine
hash -d bin=~mine/bin
hash -d config=~mine/config
hash -d dotfiles=~config/dotfiles
hash -d config-eruby=~config/generate/eruby
hash -d doc=~mine/doc
hash -d maint=~mine/maint
hash -d progs=~mine/progs
hash -d ruby=~mine/ruby
hash -d script=~mine/script
hash -d syst=~mine/syst

hash -d packages=~/opt/packages
hash -d vardist=~/var/dist
hash -d prodist=~/pro/dist
hash -d optdist=~/opt/dist

hash -d syst-generate=~syst/generate
hash -d etc=~syst-generate/slash/etc
hash -d rubylib=~ruby/lib

hash -d services=~dotfiles/.config/systemd
hash -d services2=~/.config/systemd/user

hash -d articles=~/latex/articles
hash -d slides=~/latex/slides
hash -d latexpkgs=~/latex/latex-packages

hash -d pkgmgr=~/opt/pkgmgr
hash -d gemsdir=~pkgmgr/gems
hash -d gems=~gemsdir/gems
hash -d gemsdoc=~gemsdir/doc
hash -d mygems=~/mine/progs/gems

hash -d data=/home/data/dams

hash -d util=/usr/local/util
hash -d systemd=/etc/systemd/system
hash -d systemdlib=/usr/lib/systemd/system
hash -d vim=/usr/share/vim/vim74/
hash -d zsh=/usr/share/zsh
hash -d zshcompletion=~zsh/functions/Completion

# Global aliases {{{2
#suffixes
alias -g IC="| cat"
alias -g CA="2>&1 | cat -A"
alias -g D="DISPLAY=:0.0"
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
alias VP="PAGER=vimpager"

# helper functions {{{2
loadextra() { 
	case $1 in
		'zle') echo 'load extra-zle'; source "$HOME/.zsh/extra-zle.zsh" ;;
		* ) echo 'load extra'; source "$HOME/.zsh/extra.zsh" ;;
	esac
}

autoload -z lsfind lr cl gr hl plap ps
autoload -Uz v vimhelp h whatwhen fullhistory img pstop git-cd

alias gcd='git-cd'
alias lr='lr -F'
# Set title {{{2
set_cursor() {
	case $TERM in
		*screen*)
			print -Pn "\e]12;$@\e\\"
			;;
		xterm*)
			print -Pn "\e]12;$@\a"
			;;
	esac
}
set_title() {
	case $TERM in
		*screen*)
			print -Pn "\e_$@\e\\"
			;;
		xterm*|rxvt*)
			#print -Pn "\e]2;$@\a"
			print -Pn "\e]0;$@\a"
			;;
		*) 
			if tput hs; then 
				print -Pn "$(tput tsl)$@$(tput fsl)"
			fi
			;;
	esac
}
set_windowname() {
	case $TERM in
		*screen*)
			print -Pn "\ek$@\e\\"
			;;
	esac
}
#}}}1

### Complétion automatique {{{1
setopt list_types list_packed nolist_beep
setopt complete_in_word
zmodload zsh/complist
autoload -Uz compinit # initialisation du système de complétion automatique.
compinit
#compinit -D pour réinitaliser (si je change ~/.zsh/completion)

# press ^xh (control-x h) for getting tags in context; ^x? (control-x ?) to run complete_debug with trace output grmlcomp() {
zstyle ':completion:*' completer _oldlist _expand _prefix _complete _files _ignored
zstyle ':completion::complete:*' use-cache on

zstyle ':completion:*:default' menu select

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
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
zstyle ':completion:*:manuals.*'	insert-sections		true
#zstyle ':completion:*:man:*'			 menu yes select

## zcompile
zstyle ':completion:*:*:zcompile:*'		 ignored-patterns '(*~|*.zwc)'			 # define files to ignore for zcompile

## processes
zstyle ':completion:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:processes' verbose true
zstyle ':completion:*:*:processes' menu yes select
zstyle ':completion:*:processes' force-list always
zstyle ':completion:*:processes*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle :completion::complete:kill:: group-order jobs processes

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
myaccounts=(
 dams@{feanor,numenor,valinor,FleurBleue,gondolin}
 robert@{ens,4a,bbq}
 damienrobert@{imb,oimb,gimb,devel}
)
zstyle ':completion:*:my-accounts' users-hosts $myaccounts
#zstyle ':completion:*:other-accounts' users-hosts $other_accounts
#other accounts: completion for finger like commands
#my-accounts: completion for ssh like commands

## hosts
[ -f ~/.ssh/config ] && : ${(A)ssh_config_hosts:=${${${${(@M)${(f)"$(<~/.ssh/config)"}:#Host *}#Host }:#*\**}:#*\?*}}
[ -f ~/.ssh/known_hosts ] && : ${(A)ssh_known_hosts:=${${${(f)"$(<$HOME/.ssh/known_hosts)"}%%\ *}%%,*}}
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
compdef _screen screen256
compdef _cd cl
compdef _git gitk=git-rev-list
compdef _ponymix volume

reload_completion() {
	local f
	f=(~/.zsh/completion/*(.))
	unfunction $f:t 2> /dev/null
	autoload -Uz $f:t
}
reload_compdump() {
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
	set_cursor "DarkOrange3"
	# Tell terminal to send escape codes around pastes.
	# Cf copy-paste mode
	case $TERM in
		rxvt*|xterm*)
			printf '\e[?2004h'
			;;
	esac
	# Finally, make sure the terminal is in application mode, when zle is
	# active. Only then are the values from $terminfo valid.
	if [[ -n ${terminfo[smkx]} ]] && [[ -n ${terminfo[rmkx]} ]]; then
		echoti smkx
	fi
	zle -K myviins
}

function _zle_line_finish() {
	ZLE_LINE_ABORTED=$BUFFER
	if [[ -n ${terminfo[smkx]} ]] && [[ -n ${terminfo[rmkx]} ]]; then
		echoti rmkx
	fi
	# Tell it to stop when we leave zle, so pasting in other programs
	# doesn't get the ^[[200~ codes around the pasted text.
	case $TERM in
		rxvt*|xterm*)
			printf '\e[?2004l'
			;;
	esac
	set_cursor "Firebrick3"
}
#}}}
# vi-mode {{{2
# Change cursor color between normal and insert mode
# See https://bbs.archlinux.org/viewtopic.php?id=95078
zle-keymap-select () {
	if [[ $KEYMAP == vicmd ]]; then
			set_cursor "Firebrick3"
	#elif [ $KEYMAP = paste ]; then
	#		 #echo -ne "\033]12;DarkOrchid\007"
	#		 echo -ne "\033]12;DarkViolet\007"
	else
			set_cursor "DarkOrange3"
	fi
}
zle -N zle-keymap-select

function bindkeyboth() {
	# bindkey -M viins ... (default bindkey 'main' with bindkey -v)
	# bindkey -M vicmd ... (shortcut: bindkey -a)
	bindkey $@
	bindkey -a $@
}
#}}}
#{{{ Copy-paste mode
# Code from Mikael Magnusson: http://www.zsh.org/mla/users/2011/msg00367.html
#
# Requires xterm, urxvt, iTerm2 or any other terminal that supports bracketed
# paste mode as documented: http://www.xfree86.org/current/ctlseqs.html

# create a new keymap to use while pasting
bindkey -N paste
# make everything in this keymap call our custom widget
bindkey -R -M paste "^@"-"\M-^?" zle_paste_insert
# these are the codes sent around the pasted text in bracketed
# paste mode.
# do the first one with both -M viins and -M vicmd in vi mode
bindkeyboth '^[[200~' zle_start_paste
bindkey -M paste '^[[201~' zle_end_paste
# insert newlines rather than carriage returns when pasting newlines
bindkey -M paste -s '^M' '^J'

zle -N zle_start_paste
zle -N zle_end_paste
zle -N zle_paste_insert

# switch the active keymap to paste mode
function zle_start_paste() {
	zle -K paste
}

# go back to our normal keymap, and insert all the pasted text in the
# command line. this has the nice effect of making the whole paste be
# a single undo/redo event.
function zle_end_paste() {
	zle -K main
	LBUFFER+=$_zle_paste_content
	unset _zle_paste_content
}

function zle_paste_insert() {
	_zle_paste_content+=$KEYS
}
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
#this is now _history-incremental-preserving-pattern-search-backward
#bindkeyboth "^R" history-incremental-pattern-search-backward
#bindkeyboth "^S" history-incremental-pattern-search-forward
bindkeyboth "^T" transpose-chars
bindkeyboth "^U" kill-whole-line
bindkeyboth "^V" vi-quoted-insert
bindkeyboth "^W" backward-kill-word
bindkeyboth "^Y" yank
bindkeyboth "^_" undo

bindkeyboth "^X^B" vi-match-bracket
bindkeyboth "^X^D" list-choices
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
bindkeyboth "^Xh" run-help
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
bindkeyboth "^X?" which-command
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
zle_commit-to-history() {
		print -s ${(z)BUFFER}
		zle send-break
}
zle -N zle_commit-to-history
bindkeyboth "^o^m" zle_commit-to-history

# History search with globs.
# 21sep2011  +chris+
# 05jun2012  +chris+	and keeping the rest of the line
autoload -Uz narrow-to-region
zle_history-incremental-preserving-pattern-search-backward() {
	local state
	MARK=CURSOR  # magick, else multiple ^R don't work
	narrow-to-region -p "$LBUFFER${BUFFER:+>>}" -P "${BUFFER:+<<}$RBUFFER" -S state
	zle end-of-history
	zle history-incremental-pattern-search-backward
	narrow-to-region -R state
}
zle_history-incremental-preserving-pattern-search-forward() {
	local state
	MARK=CURSOR  # magick, else multiple ^R don't work
	narrow-to-region -p "$LBUFFER${BUFFER:+>>}" -P "${BUFFER:+<<}$RBUFFER" -S state
	zle beginning-of-history
	zle history-incremental-pattern-search-forward
	narrow-to-region -R state
}
zle -N zle_history-incremental-preserving-pattern-search-backward
bindkeyboth "^R" zle_history-incremental-preserving-pattern-search-backward
bindkey -M isearch "^R" history-incremental-pattern-search-backward
zle -N zle_history-incremental-preserving-pattern-search-forward
bindkeyboth "^S" zle_history-incremental-preserving-pattern-search-forward
bindkey -M isearch "^S" zle_history-incremental-pattern-search-forward

zle_mquote () {
		zle beginning-of-line
		zle forward-word
		# RBUFFER="'$RBUFFER'"
		RBUFFER=${(q)RBUFFER}
		zle end-of-line
}
zle -N zle_mquote
bindkeyboth '^oq' zle_mquote

zle_rationalise-dot() {
	local MATCH
	if [[ $LBUFFER =~ '(^|/| |	|'$'\n''|\||;|&)\.\.$' ]]; then
		LBUFFER+=/
		zle self-insert
		zle self-insert
	else
		zle self-insert
	fi
}
zle -N zle_rationalise-dot
bindkey . zle_rationalise-dot
# without this, typing a . aborts incremental history search
if is-at-least 4.3.7; then
	bindkey -M isearch . self-insert
fi

# only slash should be considered as a word separator: 
zle_slash-backward-kill-word() {
		local WORDCHARS=$_WORDCHARS
		zle backward-kill-word
}
zle -N zle_slash-backward-kill-word
bindkeyboth '^x^w' zle_slash-backward-kill-word

# Create directory under cursor or the selected area
# Press ctrl-oM to create the directory under the cursor or the selected area.
# To select an area press ctrl-@ or ctrl-space and use the cursor.
# Use case: you type "mv abc ~/testa/testb/testc/" and remember that the
# directory does not exist yet -> press ctrl-XM and problem solved
zle_inplaceMkDirs() {
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
zle -N zle_inplaceMkDirs
bindkeyboth '^oM' zle_inplaceMkDirs

# press "ctrl-e d" to insert the actual date in the form yyyy-mm-dd
zle_insert-datestamp() { LBUFFER+=${(%):-'%D{%Y-%m-%d}'}; }
zle_insert-timedatestamp() { LBUFFER+=${(%):-'%D{%Y-%m-%dT%T%z}'}; }
zle -N zle_insert-datestamp; zle -N zle_insert-timedatestamp
bindkeyboth "^od" zle_insert-datestamp
bindkeyboth "^ot" zle_insert-timedatestamp

# prepend the current command with "sudo"
zle_sudo-command-line() {
		[[ -z $BUFFER ]] && zle up-history
		if [[ $BUFFER != sudo\ * ]]; then
				BUFFER="sudo $BUFFER"
				CURSOR=$(( CURSOR+5 ))
		fi
}
zle -N zle_sudo-command-line
bindkeyboth "^os" zle_sudo-command-line

### jump behind the first word on the cmdline.
### useful to add options.
function zle_jump_after_first_word() {
		local words
		words=(${(z)BUFFER})

		if (( ${#words} <= 1 )) ; then
				CURSOR=${#BUFFER}
		else
				CURSOR=${#${words[1]}}
		fi
}
zle -N zle_jump_after_first_word
bindkeyboth '^o1' zle_jump_after_first_word

# expand-or-complete-or-list-files
function zle_complete-or-list-files() {
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
zle -N zle_complete-or-list-files
bindkeyboth '^I' zle_complete-or-list-files #^I=tab

# Allow to recover from C-c or failed history expansion (thx Mikachu).
# 26may2012  +chris+
zle_recover_line_or_else() {
	if [[ -z $BUFFER && $CONTEXT = start && $zsh_eval_context = shfunc*
				&& -n $ZLE_LINE_ABORTED
				&& $ZLE_LINE_ABORTED != $history[$((HISTCMD-1))] ]]; then
		LBUFFER+=$ZLE_LINE_ABORTED
		unset ZLE_LINE_ABORTED
	else
		zle .$WIDGET
	fi
}
zle -N up-line-or-history zle_recover_line_or_else
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
# In plugins below:
#		'^o^p', '^op', (N) gJ history-substring-search-down
#		'^o^n', '^on', (N) gK history-substring-search-up
# Insert mode
#		"^p" _history-complete-older #word completion
#		"^n" _history-complete-newer
# Normal mode
#		'^p' history-beginning-search-backward-end #complete and put cursor at end
#		'^n' history-beginning-search-forward-end
#		'gj' down-history
#		'gk' up-history
#bindkeyboth '^I' complete-or-list-files #^I=tab
#bindkeyboth '^x^w' slash-backward-kill-word
#bindkeyboth '^xi' incremental-complete-word
#bindkeyboth "^o^m" commit-to-history
#bindkeyboth '^o1',g1 jump_after_first_word
#bindkeyboth '^oa' accept-line-and-down-history
#bindkeyboth "^od" insert-datestamp
#bindkeyboth '^oe',ge edit-command-line
#bindkeyboth "^of",gf complete-files
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
function preexec() {
	local a=${${1## *}[(w)1]}  # get the command
	local b=${a##*\/}		# get the command basename
	a="${b}${1#$a}"			# add back the parameters
	a=${(V)a//\%/\%\%}	# escape non-visibles and print specials

	case $b in
		git* ) unset __GIT_NOSTATUS;;
	esac

	case $TERM in
		screen*)
			set_windowname $b #tabname
			if [[ -n $SSH_CLIENT ]]; then
				set_title "$a:%m %-3~" #hardstatus
			else
				set_title "$a:%-3~"
			fi
			#this put the base name of the command in the tab name, and the full
			#path + command in the hardstatus
			;;
		rxvt*|xterm*)
			if [[ -n $SSH_CLIENT ]]; then
				set_title "$a:%m %~"
			else
				set_title "$a:%~"
			fi
			;;
	esac
}

function precmd() {
	vcs_info;
	#%m: hostname, %~: current directory
	case $TERM in
		screen*)
			if [[ -n $SSH_CLIENT ]]; then
				set_windowname "%m %-3~" #tabname
			else
				set_windowname "\%-3~" #tabname
			fi
			set_title "" #reset hardstatus title
			#this set the tab name to the current dir and reset the hardstatus
			;;
		rxvt*|xterm*)
			if [[ -n $SSH_CLIENT ]]; then
				set_title "%m %~"
			else
				set_title "%~"
			fi
			#this set the tab name to hostname:  current dir if there is an ssh
			#connection, otherwise omit hostname
	esac
}

##### prompt	{{{2
# names and hosts
SHOWNAME="%n@"
[[ $ZSHNAME == $USERNAME ]] && SHOWNAME=""
SHOWHOST="%m"
if [[ -f /etc/machine-info ]]; then
	. /etc/machine-info
	SHOWHOST=$PRETTY_HOSTNAME
fi
[[ -n $SSH_CONNECTION ]] && SHOWHOST="♒$SHOWHOST"

#gitstatus.rb
if [[ -x /usr/bin/ruby && -n $ZSHGITSTATUS ]]; then
	if is-at-least 4.3.11; then
		add-zsh-hook chpwd chpwd_update_git_status
		add-zsh-hook preexec preexec_update_git_status
		add-zsh-hook precmd precmd_update_git_status

		function chpwd_update_git_status() {
			__GIT_NOSTATUS=
		}
		function preexec_update_git_status() {
			case "$2" in
				git*)
					__GIT_NOSTATUS=
					;;
			esac
		}
		function precmd_update_git_status() {
			if [[ -z $__GIT_NOSTATUS ]]; then
				__GIT_CURRENT_STATUS=$(gitstatus.rb --prompt 2>/dev/null)
				[[ $ZSHGITSTATUS != "full" ]] && __GIT_NOSTATUS=1
			fi
		}
	fi

	git_status() {
		echo $__GIT_CURRENT_STATUS
	}
else
	git_status() {}
	zstyle ':vcs_info:*' enable git
fi
setopt prompt_subst
#Nice symbols: ▶ ± ➦ ✔ ✘ ⚡ ⑄ ⑂ ⑁ ⑃ ┌ ├ └ ─ ☢ ⚙ ↳ ➜ ✗ ↵ » ➤ ☁ ✓ ✔ λ ✱ ⇒ ● ↑ ✕ ✚ ✹ ✖ ➜ ═ ✭ ☁ ☂ ☀ ♒ ⑊
# Ⓐ Ⓜ Ⓓ ⓣ Ⓞ ⓐ ⓜ ⓧ ⓡ ⓤ 
# ☀ ✹ ☄ ♆ ♀ ♁ ♐ ♇ ♈ ♉ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♣ ⚢ ⚲ ⚳ ⚴ ⚥ ⚤ ⚦ ⚒ ⚑ ⚐ ♺ ♻ ♼ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷ ✡ ✔ ✖ ✚ ✱ ✤ ✦ ❤ ➜ ➟ ➼ ✂ ✎ ✐ ⨀ ⨁ ⨂ ⨍ ⨎ ⨏ ⨷ ⩚ ⩛ ⩡ ⩱ ⩲ ⩵  ⩶ ⨠ ⬅ ⬆ ⬇ ⬈ ⬉ ⬊ ⬋ ⬒ ⬓ ⬔ ⬕ ⬖ ⬗ ⬘ ⬙ ⬟	⬤ 〒 ǀ ǁ ǂ ĭ Ť Ŧ

promptline+="${SHOWNAME}${SHOWHOST} "
promptline+='%40<…<%~ '
promptline+='%(!.#.$)'
PROMPT="%B%U$promptline%b%u "
#PROMPT="%B%U  %(!.#.$)%b%u "

rpromptline='%F{yellow}${vcs_info_msg_0_}%f$(git_status)'
rpromptline+='%0(?||%F{red}✘%?%f)' #errors
rpromptline+='%1(j|%F{green}✹%j%f|)' #jobs
if [[ -n $DESKTOP_SESSION ]]; then
	#we need to cheat on SHLVL here because in xfce, we are already on SHLVL=1
	[[ $SHLVL -gt 2 ]] && rpromptline+='%F{blue}⚙$((SHLVL-1))%f'
else
	[[ $SHLVL -gt 1 ]] && rpromptline+='%F{blue}⚙${SHLVL}%f'
fi
rpromptline+='%F{blue}⚡${LINENO}%f' #line number
RPROMPT=$rpromptline
unset SHOWNAME SHOWHOST promptline rpromptline
# secondary prompt, printed when the shell needs more information to complete a command.
PS2='\`%_> '
# selection prompt used within a select loop.
PS3='?# '
# the execution trace prompt (setopt xtrace). default: '+%N:%i>'
PS4='+%N:%i:%_> '
# }}}
#}}}

### services {{{1
if [[ -x /usr/bin/systemctl ]]; then
	salias ssd='systemctl'
	#--full only output everything in systemctl, but not in systemctl
	#status ploum.service so I trick it by adding more COLUMNS
	alias sd="COLUMNS=130 systemctl --full"
	alias sv="COLUMNS=130 systemctl --user --full"
	jd() { 
		OPTS=()
		while true;
		do
			case $1 in
				-- ) break ;;
				-n ) shift; OPTS=($OPTS -n $1); shift;;
				-o ) shift; OPTS=($OPTS -o $1); shift;;
				-* ) OPTS=($OPTS $1); shift ;;
				*=* ) OPTS=($OPTS $1); shift ;;
					*) break;;
				esac
			done
			if [[ $# -gt 0 ]]; then journalctl $OPTS -b -a SYSLOG_IDENTIFIER="$@"
			else journalctl $OPTS -a -b
			fi
		}
		#the journal corresponding to me (in case i have adm access, by
		#defaut I see everything)
		jdu() { jd _UID=$UID "$@" }
		jds() { jd _UID=0 "$@" }
		#the journal correspondingto my systemd --user session
		jv() { jd _SYSTEMD_OWNER_UID=$UID "$@" }
	fi
#}}}

### plugins {{{1

if [[ -n $ZSHPLUGINS ]]; then
	plugin=~/var/dist/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

	if [[ -e $plugin ]]; then
	source $plugin
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

	plugin=~/var/dist/zsh_plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
	if [[ -e $plugin ]]; then
	source $plugin
	bindkeyboth '^O^P' history-substring-search-up
	bindkeyboth '^O^N' history-substring-search-down
	bindkeyboth '^Op' history-substring-search-up
	bindkeyboth '^On' history-substring-search-down
	fi
	unset plugin

	plugin=~/var/dist/zsh_plugins/zaw/zaw.zsh
	if [[ -e $plugin ]]; then
		source $plugin
		bindkey '^R' zaw-history
		zstyle ':filter-select' extended-search yes # ^ and $
		zstyle ':filter-select' case-insensitive no
	fi
	unset plugin
fi

#}}}

### Environment {{{1
#WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>' # the default
_WORDCHARS=$WORDCHARS
# only slash should be considered as a word separator
WORDCHARS="${_WORDCHARS:s@/@}"

## Gems
PKGMGR=$HOME/opt/pkgmgr
#set in .initenv but it should not hurt to define it twice...
export GEM_HOME="$PKGMGR/gems" #ruby

export PYTHONUSERBASE=$PKGMGR/pip #python
export NPMHOME=$PKGMGR/npm #nodejs

#perl (cpan)
PERL5HOME=$PKGMGR/perl5
export PERL_LOCAL_LIB_ROOT="$PERL5HOME:$PERL_LOCAL_LIB_ROOT";
export PERL_MB_OPT="--install_base $PERL5HOME";
export PERL_MM_OPT="INSTALL_BASE=$PERL5HOME";
export PERL5LIB="$PERL5HOME/lib/perl5:$PERL5LIB";

path=(~/opt/pkgmgr/*/bin(N) $path)

_TEXLIVE="$HOME/opt/packages/texlive"
if [[ -d $_TEXLIVE ]]; then
	#setup texlive
	path=("$_TEXLIVE/bin/x86_64-linux" $path)
	manpath=("$_TEXLIVE/texmf-dist/doc/man" $manpath)
	infopath=("$_TEXLIVE/texmf-dist/doc/info" $infopath)
fi
_GIT="$HOME/opt/packages/git"
if [[ -d $_GIT ]]; then
	manpath=("$_GIT/share/man" $manpath)
fi
unset _TEXLIVE _GIT
#This directories are already there because of .initenv, but i went them to
#be first
path=(~/bin ~/mine/bin ~/opt/bin ~/opt/bin/arch $path)

# support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

[[ -e "$HOME/.dir_colors" ]] && eval `dircolors -b $HOME/.dir_colors 2>/dev/null`

WATCHFMT='%a: %n@%M(%l) %D@%T'
#TIMEFMT="%J	%U user %S system %P cpu %MM memory %*E total"
TIMEFMT="%J (%*Es) - u:%U+s:%S cpu:%P mem:%MM io:%I/%O"

# report about cpu-/system-/user-time of command if running longer than 5 seconds
REPORTTIME=5
MAILCHECK=0
watch=(notme)

# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath

#I want 256 colors in xfce4-terminal
case $COLORTERM in
	"gnome-terminal"|"Terminal"|"xfce4-terminal"|"mate-terminal" )
		 [[ "$TERM" == "xterm" ]] && infocmp xterm-256color >/dev/null 2>&1 && TERM=xterm-256color
	 ;;
esac
#}}}

### local {{{1

[[ -f "$HOME/.xinput.d/default.local" ]] && . "$HOME/.xinput.d/default.local"

if [[ $MYHOSTTYPE != "none" ]]; then
	#don't want zsh to look at it when i have a gtk indicator
	MAILPATH="$HOME/Mail"
	MAIL="$MAILPATH/Inbox"
	export MAIL MAILPATH
fi

case $MYHOSTTYPE in
	perso )
		#watch=(notme) #now global
		alias muttcron="mutt -f $MAILPATH/cron"
		alias muttinria="mutt -f $MAILPATH/inria/Inbox"
		alias muttphare="mutt -f $MAILPATH/phare/Inbox"
		if [[ -z $TZ ]]; then
			#TZ="Europe/Paris"
			#TZ="America/Edmonton"
			#TZ="Pacific/Honolulu"
			#TZ="Europe/Moscow"
			#TZ="America/Los_Angeles"
			#TZ="Africa/Casablanca"
			#TZ="Pacific/Tahiti"
			#TZ=Asia/Seoul
		fi
		export TZ
		export LANG=POSIX
		#i think lightdm or xfce puts it to en_US.utf8
				;;
	phare )
		alias afp='flrn -name afp'
		alias news='flrn -name news'
		#tmux in phare is too old to understand -A
		#alias aa="tmux -As android"
		alias aa="tmux attach -t android || tmux new -s android"
		alias tmuxssh="tmux attach -t ssh || tmux new -s ssh"
		path+=("/usr/local/sbin" "/usr/sbin" "/sbin")
		avertissement_quota
		#On lit le fichier local:
		source /etc/skel-common/zshrc-after ;;
	imb ) 
		LESS="-RMiqx2" #/etc/profile.d override les valeurs de initenv...
		umask 022 #l'umask est à 002 par défaut
		alias 'lprprint' 'lpr -P melies31'
		alias tmuxssh="tmux attach -t ssh || tmux new -s ssh"
		#the year should not be important, they all point to the latest version
		alias tlcontrib="tlmgr --repository http://tlcontrib.metatex.org/2013"
		alias pacman="fakeroot pacman"
		#@imb an rvm ruby is set up, and GEM_PATH points to this rvm ruby and
		#this confuses my local gems
		unset GEM_PATH
		;;
	plafrim )
		#la commande module
		. /etc/profile.d/modules.sh
		alias modgrep="module avail 2>&1 | grep -v '^-\+' | sed 's/[ \t]\+/\n/' | grep"
		;;
esac
#}}}
