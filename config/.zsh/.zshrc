# vim: set foldmethod=marker:

#to test if a version is big enough
autoload -U is-at-least || is-at-least() { return 1 }
#completion
fpath=(~/.zsh/completion $fpath)

### Options {{{1

#man zshoptions
setopt no_clobber no_hist_allow_clobber 
setopt no_bgnice no_flow_control no_check_jobs nohup notify 
setopt promptcr auto_pushd 
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
FCEDIT=$EDITOR
limit coredumpsize 0 

bindkey -e #i need to call bindkey here, in order not to overwrite the completion bindings ^X... But for my custom bindings, I put them after the completion so that I can use the completion widgets
#}}}

### Environment {{{1
#export WORDCHARS='*?_[]~=&;!#$%^(){}'
WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>' # the default

# support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

[ -e "$HOME/.dir_colors" ] && eval `dircolors -b $HOME/.dir_colors 2>/dev/null`

WATCHFMT='%a: %n@%M(%l) %D@%T'

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
                printf '  -h      shows this help text.\n'
                printf '  -a      replace '\'' ; '\'' sequences with '\'' ; sudo '\''.\n'
                printf '          be careful using this option.\n'
                printf '  -o      only sets an alias if a preceding sudo would be needed.\n'
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

    key="${1%%\=*}" ;  val="${1#*\=}"
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

alias g=git
alias gi="git --no-pager"
alias gitp="git --paginate"
alias gitdiffalias="git diff --no-index"

#control groups
alias psc="ps xawf -eo pid,user,cgroup,args"

alias HI='GIT_PAGER="$HOME/script/git/contrib/diff-highlight|less"'

# ~directories {{{2
#cd ~util -> /usr/local/util
hash -d util=/usr/local/util
hash -d config=~/mine/config
hash -d maint=~config/maint
hash -d syst=~/mine/syst
hash -d etc=~syst/etc
hash -d etc-generate=~syst/etc/etc-generate
hash -d services=~config/.config/systemd/user
hash -d services2=~/.config/systemd/user
hash -d rubylib=~/mine/ruby/lib
hash -d articles=~/latex/articles
hash -d slides=~/latex/slides
hash -d latexpkgs=~/latex/latex-packages
hash -d systemd=/etc/systemd/system
hash -d systemdlib=/usr/lib/systemd/system
hash -d gems=$GEM_HOME/gems
hash -d gemslocal=~/.gem/ruby/2.0.0/gems
hash -d data=/home/data/dams

# Global aliases {{{2
#suffixes
alias -g IC="| cat"
alias -g CA="2>&1 | cat -A"
alias -g D="DISPLAY=:0.0"
alias -g EO="2>&1"
alias -g EG='|& egrep'
alias -g EL='|& less -R'
alias -g IF=' | fmt -'
alias -g IG='| egrep'
alias -g IL="| less -R"
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

# helper functions {{{2
## List all occurrences of programm in current PATH
cl() {
    emulate -L zsh
    cd $1 && ls
}

plap() {
    emulate -L zsh
    if [[ $# = 0 ]] ; then
        echo "Usage:    $0 program"
        echo "Example:  $0 zsh"
        echo "Lists all occurrences of program in the current PATH."
    else
        ls -l ${^path}/*$1*(*N)
    fi
}

spectrum_ls() {
  for code in {000..255}; do
print -P -- "$code: %F{$code}Test color%f"
  done
}

whatwhen()  {
    emulate -L zsh
    local usage help ident format_l format_s first_char remain first last
    usage='USAGE: whatwhen [options] <searchstring> <search range>'
    help='Use `whatwhen -h'\'' for further explanations.'
    ident=${(l,${#${:-Usage: }},, ,)}
    format_l="${ident}%s\t\t\t%s\n"
    format_s="${format_l//(\\t)##/\\t}"
    # Make the first char of the word to search for case
    # insensitive; e.g. [aA]
    first_char=[${(L)1[1]}${(U)1[1]}]
    remain=${1[2,-1]}
    # Default search range is `-100'.
    first=${2:-\-100}
    # Optional, just used for `<first> <last>' given.
    last=$3
    case $1 in
        ("")
            printf '%s\n\n' 'ERROR: No search string specified. Aborting.'
            printf '%s\n%s\n\n' ${usage} ${help} && return 1
        ;;
        (-h)
            printf '%s\n\n' ${usage}
            print 'OPTIONS:'
            printf $format_l '-h' 'show help text'
            print '\f'
            print 'SEARCH RANGE:'
            printf $format_l "'0'" 'the whole history,'
            printf $format_l '-<n>' 'offset to the current history number; (default: -100)'
            printf $format_s '<[-]first> [<last>]' 'just searching within a give range'
            printf '\n%s\n' 'EXAMPLES:'
            printf ${format_l/(\\t)/} 'whatwhen grml' '# Range is set to -100 by default.'
            printf $format_l 'whatwhen zsh -250'
            printf $format_l 'whatwhen foo 1 99'
        ;;
        (\?)
            printf '%s\n%s\n\n' ${usage} ${help} && return 1
        ;;
        (*)
            # -l list results on stout rather than invoking $EDITOR.
            # -i Print dates as in YYYY-MM-DD.
            # -m Search for a - quoted - pattern within the history.
            fc -li -m "*${first_char}${remain}*" $first $last
        ;;
    esac
}

vimhelp ()    { vim -c "help $1" -c on -c "au! VimEnter *" }

loadextra() { 
  case $1 in
    'maybe') echo 'load maybe'; source "$HOME/.zsh/maybe.zsh" ;;
    'zle') echo 'load extra-zle'; source "$HOME/.zsh/extra-zle.zsh" ;;
    * ) echo 'load extra'; source "$HOME/.zsh/extra.zsh" ;;
  esac
}
#}}}1

### Complétion automatique {{{1
setopt list_types list_packed nolist_beep
setopt complete_in_word
zmodload zsh/complist
autoload -U compinit # initialisation du système de complétion automatique.
compinit
#compinit -D pour réinitaliser (si je change ~/.zsh/completion)

# press ^xh (control-x h) for getting tags in context; ^x? (control-x ?) to run complete_debug with trace output grmlcomp() {
zstyle ':completion:*' completer _oldlist _expand _prefix _complete _files _ignored
zstyle ':completion::complete:*' use-cache on

zstyle ':completion:*:default' menu select

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions'    format $'%F{red}%B%d:%b%f'
zstyle ':completion:*:warnings'        format $'%F{red}No matches for:%f %d' # set format for warnings
zstyle ':completion:*:messages'        format 'Completion: %d'
zstyle ':completion:*:options'         auto-description 'specify: %d'
_prompt='%S#%M (%p)%s'
zstyle ':completion:*:default' list-prompt $_prompt
MENUPROMPT=$_prompt
unset _prompt

zstyle ':completion:*'           verbose true  # provide verbose completion information
zstyle ':completion:*:options'         description 'yes' # describe options in full

zstyle ':completion:*:matches'         group 'yes'  # separate matches into groups
zstyle ':completion:*'                 group-name ''
zstyle ':completion:*:*:-subscript-:*' group-order indexes parameters        # offer indexes before parameters in subscripts

######### specific completions #########

## expand
zstyle ':completion:*:expand:*'        group-order expansion # menu with all expansions for expand completer

## commands
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~' # don't complete backup files as executables

## cd
zstyle ':completion:*:*:cd:*' group-order local-directories path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select              # complete 'cd -<tab>' with menu
#in /usr/bin/t<TAB>, don't try to complete /usr
zstyle ':completion:*:accept-exact-dirs' true

## man
zstyle ':completion:*:manuals'    separate-sections true                   # man completion
zstyle ':completion:*:manuals.*'  insert-sections   true
#zstyle ':completion:*:man:*'      menu yes select

## zcompile
zstyle ':completion:*:*:zcompile:*'    ignored-patterns '(*~|*.zwc)'       # define files to ignore for zcompile

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
zstyle ':completion:*:history-words'   list false                          #
zstyle ':completion:*:history-words'   menu yes                            # activate menu
zstyle ':completion:*:history-words'   remove-all-dups yes                 # ignore duplicate entries
zstyle ':completion:*:history-words'   stop yes                            #

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
my_accounts=(
 dams@{feanor,numenor,valinor,FleurBleue,gondolin}
 robert@{ens,4a,bbq}
 drobert@{imb,oimb,gimb,devel}
)
zstyle ':completion:*:my-accounts' users-hosts $my_accounts
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

## Specific command completion {{{1
# use generic completion system for programs not yet defined; (_gnu_generic works with commands that provide a --help option with "standard" gnu-like output.)
MYCOMMANDS=(ploum)
for compcom in cp df feh head mv tail uname $MYCOMMANDS; do
    [[ -z ${_comps[$compcom]} ]] && compdef _gnu_generic ${compcom}
done; unset compcom; unset MYCOMMANDS

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
compdef _ponymix volume

reload_completion() {
  local f
  f=(~/.zsh/completion/*(.))
  unfunction $f:t 2> /dev/null
  autoload -U $f:t
}
reload_compdump() {
  rm ~/.zcompdump
  compinit
  reload_completion
}
### }}}

### hooks {{{1
#note -U: don't expand alias, -z: use zsh native mode (even if shell
#currently running in ksh emulation)
#
if autoload -U url-quote-magic ; then
   zle -N self-insert url-quote-magic
   #zstyle ':url-quote-magic:*' url-metas '*?[]^()~#{}='
fi

#pick-web-browser open a file in firefox if X is running, otherwise use w3m
autoload -U pick-web-browser

if is-at-least 4.3.11; then
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook 
#in phare (zsh 4.3.10) chpwd_recent_dirs exit but produce an error...
#so i have to use is-at-least
add-zsh-hook chpwd chpwd_recent_dirs

autoload -Uz vcs_info
autoload -Uz zcalc zargs
autoload -U colors && colors
zstyle ':completion:*:*:cdr:*:*' menu selection
zstyle ':vcs_info:*' enable hg svn
#for git i use a python module

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
autoload -U run-help
autoload -U run-help-git
autoload -U run-help-svn
autoload -U run-help-svk
#}}}

### bindings {{{1
# '^x^h' commit-to-history
# '^x^w' slash-backward-kill-word
# '^x1': jump_after_first_word
# '\em', '^om': menu-complete
# '\ee', '^oe': edit-command-line
# '^op': push-line-or-edit
# '^oq': mquote
# '^ou': insert-unicode-char
# '^oM': inplaceMkDirs
# '^of': insert-files
# '^od': insert-datestamp
# '^ot': insert-timedatestamp
# '^os': sudo-command-line
# '^oh': hist-complete

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
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[PageUp]}"      ]]  && bindkey  "${key[PageUp]}" history-beginning-search-backward
[[ -n "${key[PageDown]}"    ]]  && bindkey  "${key[PageDown]}" history-beginning-search-forward
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Shift-tab Perform backwards menu completion
if [[ -n "$terminfo[kcbt]" ]]; then
    bindkey "$terminfo[kcbt]" reverse-menu-complete
elif [[ -n "$terminfo[cbt]" ]]; then # required for GNU screen
    bindkey "$terminfo[cbt]"  reverse-menu-complete
fi

# Les xterms ici envoient des codes spécifiques pour Ctrl-flèche
bindkey '^[[5D' backward-word #control gauche
bindkey '^[[5C' forward-word #control droite
# les nouveaux xterms
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
# Update: this does not work with TERM=linux (console), and without it
# seems to be working fine
#function zle-line-init () {
#    echoti smkx
#}
#function zle-line-finish () {
#    echoti rmkx
#}
#zle -N zle-line-init
#zle -N zle-line-finish  

# expand-or-complete-or-list-files
function expand-or-complete-or-list-files() {
    if [[ $#BUFFER == 0 ]]; then
        BUFFER="ls "
        CURSOR=3
        zle list-choices
        zle backward-kill-word
    else
        #zle expand-or-complete
        zle complete-word
        #by default TAB is bound to expand-or-complete
        #this way I can control how expansion is done in the compinit system
    fi
}
zle -N expand-or-complete-or-list-files
# bind to tab
bindkey '^I' expand-or-complete-or-list-files

## menu keys
bindkey -M listscroll '\e' send-break
[[ -n "${key[PageUp]}" ]]  && bindkey -M listscroll "${key[PageUp]}" backward-word
[[ -n "${key[PageDown]}" ]]  && bindkey -M listscroll "${key[PageDown]}" forward-word
#this does ot seems to work for listscroll, but it does for menuselect
[[ -n "${key[PageUp]}" ]]  && bindkey -M menuselect "${key[PageUp]}" backward-word
[[ -n "${key[PageDown]}" ]]  && bindkey -M menuselect "${key[PageDown]}" forward-word

bindkey '\em' menu-complete  # menu completion via esc-m
bindkey '^om' menu-complete
## use the vi navigation keys (hjkl) besides cursor keys in menu completion
bindkey -M menuselect 'h' vi-backward-char        # left
bindkey -M menuselect 'k' vi-up-line-or-history   # up
bindkey -M menuselect 'l' vi-forward-char         # right
bindkey -M menuselect 'j' vi-down-line-or-history # bottom
bindkey -M menuselect '\e' send-break
#k# menu selection: pick item but stay in the menu
bindkey -M menuselect "+" accept-and-menu-complete
bindkey -M menuselect ${key[Insert]} accept-and-menu-complete
# accept a completion and try to complete again by using menu
# completion; very useful with completing directories
# by using 'undo' one's got a simple file browser
bindkey -M menuselect '^o' accept-and-infer-next-history

bindkey -r '^o'
bindkey '^oa' accept-line-and-down-history

bindkey '^op' push-line-or-edit

autoload -U edit-command-line
zle -N edit-command-line
bindkey '\ee' edit-command-line
bindkey '^oe' edit-command-line

# add a command line to the shells history without executing it
commit-to-history() {
    print -s ${(z)BUFFER}
    zle send-break
}
zle -N commit-to-history
bindkey "^x^h" commit-to-history

mquote () {
    zle beginning-of-line
    zle forward-word
    # RBUFFER="'$RBUFFER'"
    RBUFFER=${(q)RBUFFER}
    zle end-of-line
}
zle -N mquote
bindkey '^oq' mquote

rationalise-dot() {
  local MATCH
  if [[ $LBUFFER =~ '(^|/| |	|'$'\n''|\||;|&)\.\.$' ]]; then
    LBUFFER+=/
    zle self-insert
    zle self-insert
  else
    zle self-insert
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot
# without this, typing a . aborts incremental history search
if is-at-least 4.3.7; then
  bindkey -M isearch . self-insert
fi

# insert unicode character
# usage example: 'ctrl-x i' 00A7 'ctrl-x i' will give you an §
# See for example http://unicode.org/charts/ for unicode characters code
autoload insert-unicode-char
zle -N insert-unicode-char
#k# Insert Unicode character
bindkey '^ou' insert-unicode-char

# only slash should be considered as a word separator:
slash-backward-kill-word() {
    local WORDCHARS="${WORDCHARS:s@/@}"
    # zle backward-word
    zle backward-kill-word
}
zle -N slash-backward-kill-word
#k# Kill left-side word or everything up to next slash
bindkey '^x^w' slash-backward-kill-word

#f5# Create directory under cursor or the selected area
# Press ctrl-xM to create the directory under the cursor or the selected area.
# To select an area press ctrl-@ or ctrl-space and use the cursor.
# Use case: you type "mv abc ~/testa/testb/testc/" and remember that the
# directory does not exist yet -> press ctrl-XM and problem solved
inplaceMkDirs() {
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
#k# mkdir -p <dir> from string under cursor or marked area
zle -N inplaceMkDirs && bindkey '^oM' inplaceMkDirs

autoload -U insert-files 
zle -N insert-files
bindkey "^of" insert-files

# press "ctrl-e d" to insert the actual date in the form yyyy-mm-dd
insert-datestamp() { LBUFFER+=${(%):-'%D{%Y-%m-%d}'}; }
insert-timedatestamp() { LBUFFER+=${(%):-'%D{%Y-%m-%dT%T%z}'}; }
zle -N insert-datestamp; zle -N insert-timedatestamp
bindkey "^od" insert-datestamp
bindkey "^ot" insert-timedatestamp

# run command line as user root via sudo:
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER != sudo\ * ]]; then
        BUFFER="sudo $BUFFER"
        CURSOR=$(( CURSOR+5 ))
    fi
}
zle -N sudo-command-line
#k# prepend the current command with "sudo"
bindkey "^os" sudo-command-line

### jump behind the first word on the cmdline.
### useful to add options.
function jump_after_first_word() {
    local words
    words=(${(z)BUFFER})

    if (( ${#words} <= 1 )) ; then
        CURSOR=${#BUFFER}
    else
        CURSOR=${#${words[1]}}
    fi
}
zle -N jump_after_first_word
#k# jump to after first word (for adding options)
bindkey '^x1' jump_after_first_word

# complete word from history with menu (from Book: ZSH, OpenSource-Press)
zle -C hist-complete complete-word _generic
zstyle ':completion:hist-complete:*' completer _history
#k# complete word from history with menu
bindkey "^oh" hist-complete
#}}}

### prompt and title {{{1

##### title  {{{2
function preexec() {
  local a=${${1## *}[(w)1]}  # get the command
  local b=${a##*\/}   # get the command basename
  a="${b}${1#$a}"     # add back the parameters
  a=${a//\%/\%\%}     # escape print specials
  a=$(print -Pn "$a" | tr -d "\t\n\v\f\r")  # remove fancy whitespace
  a=${(V)a//\%/\%\%}  # escape non-visibles and print specials

  case $b in
    git* ) unset __GIT_NOSTATUS;;
  esac

  case "$TERM" in
    screen|screen.*)
      # See screen(1) "TITLES (naming windows)".
      # "\ek" and "\e\" are the delimiters for screen(1) window titles
      print -Pn "\ek$b\e\\" # set screen title.  Fix vim: ".
      if [[ -n $SSH_CLIENT ]]; then
        print -Pn "\e]2;$a:%m %-3~\a" # set screen hardstatus title, via screen "Operating System Command"
      else
        print -Pn "\e]2;$a:%-3~\a" # set screen hardstatus title, via screen "Operating System Command"
      fi
      #this put the base name of the command in the tab name, and the full
      #path + command in the hardstatus
      ;;
    rxvt|rxvt-unicode|rxvt-unicode-256color|xterm|xterm-color|xterm-256color)
      #print -Pn "\e]2;%m %-3~:$a\a"
      if [[ -n $SSH_CLIENT ]]; then
        print -Pn "\e]2;$a:%m %~\a"
      else
        print -Pn "\e]2;$a:%~\a"
      fi
      ;;
  esac
}

function precmd() {
  vcs_info;
  #%m: hostname, %~: current directory
  case "$TERM" in
    screen|screen.rxvt)
      if [[ -n $SSH_CLIENT ]]; then
        print -Pn "\ek%m %-3~\e\\" # set screen title
      else
        print -Pn "\ek%-3~\e\\" # set screen title
      fi
      print -Pn "\e]2;\a" # must (re)set hardstatus title
      #this set the tab name to the current dir and reset the hardstatus
      ;;
    rxvt|rxvt-unicode|rxvt-unicode-256color|xterm|xterm-color|xterm-256color)
      if [[ -n $SSH_CLIENT ]]; then
        print -Pn "\e]2;%m %~\a"
      else
        print -Pn "\e]2;%~\a"
      fi
      #this set the tab name to hostname:  current dir if there is an ssh
      #connection, otherwise omit hostname
  esac
  #set the cursor to red in gnome-terminal
  case $COLORTERM in
    gnome-terminal) 
      print -Pn "\033]12;firebrick3\007"
  esac
}

##### prompt  {{{2
# names and hosts
SHOWNAME="%n@"
SHOWHOST="%m"
if [[ -f /etc/machine-info ]]; then
  . /etc/machine-info
  SHOWHOST=$PRETTY_HOSTNAME
fi
if [[ "$MYHOSTTYPE" == "perso" &&  "$USERNAME" == "dams" ]]; then
    SHOWNAME=""
else
  case $MYHOSTNAME in
    phare|4a|bbq|mygale)
      if [[ $USERNAME == "robert" ]]; then
        SHOWNAME=""
      fi
    ;;
    imb)
      if [[ $USERNAME == "drobert" ]]; then
        SHOWNAME=""
      fi
    ;;
  esac
fi
[[ -n $SSH_CONNECTION ]] && SHOWHOST="♒$SHOWHOST"

if [[ -x /usr/bin/ruby && $MYHOSTNAME != "Durin" && $MYHOSTTYPE != "plafrim" ]]; then
  #export __GIT_NOSTATUS
  if is-at-least 4.3.11; then
    add-zsh-hook chpwd chpwd_update_git_vars

  function chpwd_update_git_vars() {
      #unset __GIT_NOSTATUS
      __GIT_NOSTATUS=
    }
  fi

  git_super_status() {
    if [[ -z $__GIT_NOSTATUS ]]; then
      echo $(gitstatus.rb --prompt 2>/dev/null)
      case $MYHOSTTYPE in
        imb) __GIT_NOSTATUS=1 ;;
      esac
      case $MYHOSTNAME in
        Numenor) __GIT_NOSTATUS=1 ;;
      esac
    fi
  }
else
  git_super_status() {}
  zstyle ':vcs_info:*' enable git
fi
setopt prompt_subst
#Nice symbols: ▶ ± ➦ ✔ ✘ ⚡ ⑄ ⑂ ⑁ ⑃ ┌ ├ └ ─ ☢ ⚙ ↳ ➜ ✗ ↵ » ➤ ☁ ✓ ✔ λ ✱ ⇒ ● ↑ ✕ ✚ ✹ ✖ ➜ ═ ✭ ☁ ☂ ☀ ♒ ⑊
# Ⓐ Ⓜ Ⓓ ⓣ Ⓞ ⓐ ⓜ ⓧ ⓡ ⓤ 
# ☀ ✹ ☄ ♆ ♀ ♁ ♐ ♇ ♈ ♉ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♣ ⚢ ⚲ ⚳ ⚴ ⚥ ⚤ ⚦ ⚒ ⚑ ⚐ ♺ ♻ ♼ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷ ✡ ✔ ✖ ✚ ✱ ✤ ✦ ❤ ➜ ➟ ➼ ✂ ✎ ✐ ⨀ ⨁ ⨂ ⨍ ⨎ ⨏ ⨷ ⩚ ⩛ ⩡ ⩱ ⩲ ⩵  ⩶ ⨠ ⬅ ⬆ ⬇ ⬈ ⬉ ⬊ ⬋ ⬒ ⬓ ⬔ ⬕ ⬖ ⬗ ⬘ ⬙ ⬟  ⬤ 〒 ǀ ǁ ǂ ĭ Ť Ŧ

promptline+="${SHOWNAME}${SHOWHOST} "
promptline+='%40<…<%~ '
promptline+='%(!.#.$)'
PROMPT="%B%U$promptline%b%u "
#PROMPT="%B%U  %(!.#.$)%b%u "

rpromptline='%F{yellow}${vcs_info_msg_0_}%f$(git_super_status)'
rpromptline+='%0(?||%F{red}✘%?%f)' #errors
rpromptline+='%1(j|%F{green}✹%j%f|)' #jobs
if [[ -n "$MYXSESSION" || -n "$DESKTOP_SESSION" ]]; then
  #we need to cheat on SHLVL here because in xfce, we are already on SHLVL=1
  [[ $SHLVL -gt 2 ]] && rpromptline+='%F{blue}⚙$((SHLVL-1))%f'
else
  [[ $SHLVL -gt 1 ]] && rpromptline+='%F{blue}⚙${SHLVL}%f'
fi
rpromptline+='%F{blue}⚡${LINENO}%f' #line number
RPROMPT="$rpromptline"
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
case $MYHOSTTYPE in
  perso ) 
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
    ;;
esac
#}}}

## plugins {{{1

if [[ $MYHOSTNAME == "Durin" ]]; then
  plugin=~/var/dist/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

  plugin=~/var/dist/zsh-history-substring-search/zsh-history-substring-search.zsh
  if [[ -e $plugin ]]; then
  source $plugin
  bindkey -M emacs '^P' history-substring-search-up
  bindkey -M emacs '^N' history-substring-search-down
  fi
fi

#}}}

### local {{{1
#
case $MYHOSTTYPE in
  perso ) 
        #watch=(notme) #now global
        alias muttcron="mutt -f $MAILPATH/cron"
        alias muttinria="mutt -f $MAILPATH/inria/Inbox"
        alias muttphare="mutt -f $MAILPATH/phare/Inbox"
        ;;
  phare )
    alias afp='flrn -name afp'
    alias news='flrn -name news'
    avertissement_quota
    #On lit le fichier local:
    source /etc/skel-common/zshrc-after ;;
  imb ) 
        LESS="-RMiq" #/etc/profile.d override les valeurs de initenv...
        umask 022 #l'umask est à 002 par défaut
        alias 'lprprint' 'lpr -P melies31'
        # source /home/imb/drobert/.rvm/scripts/rvm
        # #this set GEM_HOME to /home/imb/drobert/.rvm/gems/ruby-1.9.3-p327
        # PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
        # GEM_HOME="$HOME/progs-data/rubygems" #ruby
        ;;
esac
#}}}
