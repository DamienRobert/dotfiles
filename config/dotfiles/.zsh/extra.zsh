# vim: set foldmethod=marker:
######## From grmll zshrc.local {{{1
## ignore ~/.ssh/known_hosts entries
alias insecssh='ssh -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null" -o "PreferredAuthentications=keyboard-interactive"'

## get top 10 shell commands:
top10() { print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10 }

## Handy functions for use with the (e::) globbing qualifier (like nt)
contains() { grep -q "$*" $REPLY }
sameas() { diff -q "$*" $REPLY &>/dev/null }
ot () { [[ $REPLY -ot ${~1} ]] }

## get_ic() - queries imap servers for capabilities; real simple. no imaps
ic_get() {
    emulate -L zsh
    local port
    if [[ ! -z $1 ]] ; then
        port=${2:-143}
        print "querying imap server on $1:${port}...\n";
        print "a1 capability\na2 logout\n" | nc $1 ${port}
    else
        print "usage:\n  $0 <imap-server> [port]"
    fi
}

## List all occurrences of programm in current PATH
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

## Find out which libs define a symbol
lcheck() {
    if [[ -n "$1" ]] ; then
        nm -go /usr/lib/lib*.a 2>/dev/null | grep ":[[:xdigit:]]\{8\} . .*$1"
    else
        echo "Usage: lcheck <function>" >&2
    fi
}

## Download a file and display it locally
uopen() {
    emulate -L zsh
    if ! [[ -n "$1" ]] ; then
        print "Usage: uopen \$URL/\$file">&2
        return 1
    else
        FILE=$1
        MIME=$(curl --head $FILE | \
               grep Content-Type | \
               cut -d ' ' -f 2 | \
               cut -d\; -f 1)
        MIME=${MIME%$'\r'}
        curl $FILE | see ${MIME}:-
    fi
}

## Memory overview
memusage() {
    ps aux | awk '{if (NR > 1) print $5;
                   if (NR > 2) print "+"}
                   END { print "p" }' | dc
}

## print hex value of a number
hex() {
    emulate -L zsh
    if [[ -n "$1" ]]; then
        printf "%x\n" $1
    else
        print 'Usage: hex <number-to-convert>'
        return 1
    fi
}

## log out? set timeout in seconds...
## ...and do not log out in some specific terminals:
timelogout() {
if [[ "${TERM}" == ([Exa]term*|rxvt|dtterm|screen*) ]] ; then
    unset TMOUT
else
    TMOUT=1800
fi
}

## Some quick Perl-hacks aka /useful/ oneliner
bew() { perl -le 'print unpack "B*","'$1'"' }
web() { perl -le 'print pack "B*","'$1'"' }
hew() { perl -le 'print unpack "H*","'$1'"' }
weh() { perl -le 'print pack "H*","'$1'"' }
pversion()    { perl -M$1 -le "print $1->VERSION" } # i. e."pversion LWP -> 5.79"
getlinks ()   { perl -ne 'while ( m/"((www|ftp|http):\/\/.*?)"/gc ) { print $1, "\n"; }' $* }
gethrefs ()   { perl -ne 'while ( m/href="([^"]*)"/gc ) { print $1, "\n"; }' $* }
getanames ()  { perl -ne 'while ( m/a name="([^"]*)"/gc ) { print $1, "\n"; }' $* }
getforms ()   { perl -ne 'while ( m:(\</?(input|form|select|option).*?\>):gic ) { print $1, "\n"; }' $* }
getstrings () { perl -ne 'while ( m/"(.*?)"/gc ) { print $1, "\n"; }' $*}
getanchors () { perl -ne 'while ( m/«([^«»\n]+)»/gc ) { print $1, "\n"; }' $* }
showINC ()    { perl -e 'for (@INC) { printf "%d %s\n", $i++, $_ }' }
vimpm ()      { vim `perldoc -l $1 | sed -e 's/pod$/pm/'` }
vimhelp ()    { vim -c "help $1" -c on -c "au! VimEnter *" }

####### Grml global {{{1 
# useful functions

#f5# Backup \kbd{file {\rm to} file\_timestamp}
bk() {
    emulate -L zsh
    cp -b $1 $1_`date --iso-8601=m`
}

#f5# cd to directoy and list files
cl() {
    emulate -L zsh
    cd $1 && ls -a
}

# smart cd function, allows switching to /etc when running 'cd /etc/fstab'
cd() {
    if (( ${#argv} == 1 )) && [[ -f ${1} ]]; then
        [[ ! -e ${1:h} ]] && return 1
        print "Correcting ${1} to ${1:h}"
        builtin cd ${1:h}
    else
        builtin cd "$@"
    fi
}

#f5# Create Directoy and \kbd{cd} to it
mkcd() {
    if (( ARGC != 1 )); then
        printf 'usage: mkcd <new-directory>\n'
        return 1;
    fi
    if [[ ! -d "$1" ]]; then
        command mkdir -p "$1"
    else
        printf '`%s'\'' already exists: cd-ing.\n' "$1"
    fi
    builtin cd "$1"
}

#f5# Create temporary directory and \kbd{cd} to it
cdt() {
    local t
    t=$(mktemp -d)
    echo "$t"
    builtin cd "$t"
}

#f5# List files which have been accessed within the last {\it n} days, {\it n} defaults to 1
accessed() {
    emulate -L zsh
    print -l -- *(a-${1:-1})
}

#f5# List files which have been changed within the last {\it n} days, {\it n} defaults to 1
changed() {
    emulate -L zsh
    print -l -- *(c-${1:-1})
}

#f5# List files which have been modified within the last {\it n} days, {\it n} defaults to 1
modified() {
    emulate -L zsh
    print -l -- *(m-${1:-1})
}

# Translate DE<=>EN
# 'translate' looks up fot a word in a file with language-to-language
# translations (field separator should be " : "). A typical wordlist looks
# like at follows:
#  | english-word : german-transmission
# It's also only possible to translate english to german but not reciprocal.
# Use the following oneliner to turn back the sort order:
#  $ awk -F ':' '{ print $2" : "$1" "$3 }' \
#    /usr/local/lib/words/en-de.ISO-8859-1.vok > ~/.translate/de-en.ISO-8859-1.vok
#f5# Translates a word
trans() {
    emulate -L zsh
    case "$1" in
        -[dD]*)
            translate -l de-en $2
            ;;
        -[eE]*)
            translate -l en-de $2
            ;;
        *)
            echo "Usage: $0 { -D | -E }"
            echo "         -D == German to English"
            echo "         -E == English to German"
    esac
}

#f5# Set all ulimit parameters to \kbd{unlimited}
allulimit() {
    ulimit -c unlimited
    ulimit -d unlimited
    ulimit -f unlimited
    ulimit -l unlimited
    ulimit -n unlimited
    ulimit -s unlimited
    ulimit -t unlimited
}

#f5# Change the xterm title from within GNU-screen
xtrename() {
    emulate -L zsh
    if [[ $1 != "-f" ]] ; then
        if [[ -z ${DISPLAY} ]] ; then
            printf 'xtrename only makes sense in X11.\n'
            return 1
        fi
    else
        shift
    fi
    if [[ -z $1 ]] ; then
        printf 'usage: xtrename [-f] "title for xterm"\n'
        printf '  renames the title of xterm from _within_ screen.\n'
        printf '  also works without screen.\n'
        printf '  will not work if DISPLAY is unset, use -f to override.\n'
        return 0
    fi
    print -n "\eP\e]0;${1}\C-G\e\\"
    return 0
}

# Create small urls via http://goo.gl using curl(1).
# API reference: https://code.google.com/apis/urlshortener/
function zurl() {
    emulate -L zsh
    if [[ -z $1 ]]; then
        print "USAGE: zurl <URL>"
        return 1
    fi

    local PN url prog api json data
    PN=$0
    url=$1

    # Prepend 'http://' to given URL where necessary for later output.
    if [[ ${url} != http(s|)://* ]]; then
        url='http://'${url}
    fi

    if check_com -c curl; then
        prog=curl
    else
        print "curl is not available, but mandatory for ${PN}. Aborting."
        return 1
    fi
    api='https://www.googleapis.com/urlshortener/v1/url'
    contenttype="Content-Type: application/json"
    json="{\"longUrl\": \"${url}\"}"
    data=$($prog --silent -H ${contenttype} -d ${json} $api)
    # Match against a regex and print it
    if [[ $data =~ '"id": "(http://goo.gl/[[:alnum:]]+)"' ]]; then
        print $match;
    fi
}

#f2# Find history events by search pattern and list them by date.
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

# mercurial related stuff
    # gnu like diff for mercurial
    # http://www.selenic.com/mercurial/wiki/index.cgi/TipsAndTricks
    #f5# GNU like diff for mercurial
    hgdi() {
        emulate -L zsh
        for i in $(hg status -marn "$@") ; diff -ubwd <(hg cat "$i") "$i"
    }

    # execute commands on the versioned patch-queue from the current repos
    #alias mq='hg -R $(readlink -f $(hg root)/.hg/patches)'

    # diffstat for specific version of a mercurial repository
    #   hgstat      => display diffstat between last revision and tip
    #   hgstat 1234 => display diffstat between revision 1234 and tip
    #f5# Diffstat for specific version of a mercurial repos
    hgstat() {
        emulate -L zsh
        [[ -n "$1" ]] && hg diff -r $1 -r tip | diffstat || hg export tip | diffstat
    }

# see http://www.cl.cam.ac.uk/~mgk25/unicode.html#term for details
alias term2iso="echo 'Setting terminal to iso mode' ; print -n '\e%@'"
alias term2utf="echo 'Setting terminal to utf-8 mode'; print -n '\e%G'"

utf2iso() {
    if isutfenv ; then
        for ENV in $(env | command grep -i '.utf') ; do
            eval export "$(echo $ENV | sed 's/UTF-8/iso885915/ ; s/utf8/iso885915/')"
        done
    fi
}
iso2utf() {
    if ! isutfenv ; then
        for ENV in $(env | command grep -i '\.iso') ; do
            eval export "$(echo $ENV | sed 's/iso.*/UTF-8/ ; s/ISO.*/UTF-8/')"
        done
    fi
}

# make a backup of a file
bk() {
    cp -a "$1" "${1}_$(date --iso-8601=seconds)"
}

ssl_hashes=( sha512 sha256 sha1 md5 )

for sh in ${ssl_hashes}; do
    eval 'ssl-cert-'${sh}'() {
        emulate -L zsh
        if [[ -z $1 ]] ; then
            printf '\''usage: %s <file>\n'\'' "ssh-cert-'${sh}'"
            return 1
        fi
        openssl x509 -noout -fingerprint -'${sh}' -in $1
    }'
done; unset sh

ssl-cert-fingerprints() {
    emulate -L zsh
    local i
    if [[ -z $1 ]] ; then
        printf 'usage: ssl-cert-fingerprints <file>\n'
        return 1
    fi
    for i in ${ssl_hashes}
        do ssl-cert-$i $1;
    done
}

ssl-cert-info() {
    emulate -L zsh
    if [[ -z $1 ]] ; then
        printf 'usage: ssl-cert-info <file>\n'
        return 1
    fi
    openssl x509 -noout -text -in $1
    ssl-cert-fingerprints $1
}

#f1# Reload an autoloadable function
freload() { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }
compdef _functions freload

#f1# List symlinks in detail (more detailed version of 'readlink -f' and 'whence -s')
sll() {
    [[ -z "$1" ]] && printf 'Usage: %s <file(s)>\n' "$0" && return 1
    for file in "$@" ; do
        while [[ -h "$file" ]] ; do
            ls -l $file
            file=$(readlink "$file")
        done
    done
}

# zsh profiling
profile() {
    ZSH_PROFILE_RC=1 $SHELL "$@"
}

# wonderful idea of using "e" glob qualifier by Peter Stephenson
# You use it as follows:
# $ NTREF=/reference/file
# $ ls -l *(e:nt:)
# This lists all the files in the current directory newer than the reference file.
# You can also specify the reference file inline; note quotes:
# $ ls -l *(e:'nt ~/.zshenv':)
nt() {
    if [[ -n $1 ]] ; then
        local NTREF=${~1}
    fi
    [[ $REPLY -nt $NTREF ]]
}

#f1# Edit an alias via zle
edalias() {
    [[ -z "$1" ]] && { echo "Usage: edalias <alias_to_edit>" ; return 1 } || vared aliases'[$1]' ;
}
compdef _aliases edalias

#f1# Edit a function via zle
edfunc() {
    [[ -z "$1" ]] && { echo "Usage: edfunc <function_to_edit>" ; return 1 } || zed -f "$1" ;
}
compdef _functions edfunc

# grep for running process, like: 'any vim'
any() {
    emulate -L zsh
    unsetopt KSH_ARRAYS
    if [[ -z "$1" ]] ; then
        echo "any - grep for process(es) by keyword" >&2
        echo "Usage: any <keyword>" >&2 ; return 1
    else
        ps xauwww | grep -i "${grep_options[@]}" "[${1[1]}]${1[2,-1]}"
    fi
}

# After resuming from suspend, system is paging heavily, leading to very bad interactivity.
# taken from $LINUX-KERNELSOURCE/Documentation/power/swsusp.txt
deswap() {
    print 'Reading /proc/[0-9]*/maps and sending output to /dev/null, this might take a while.'
    cat $(sed -ne 's:.* /:/:p' /proc/[0-9]*/maps | sort -u | grep -v '^/dev/')  > /dev/null
    print 'Finished, running "swapoff -a; swapon -a" may also be useful.'
}

#f1# Provides useful information on globbing
H-Glob() {
    echo -e "
    /      directories
    .      plain files
    @      symbolic links
    =      sockets
    p      named pipes (FIFOs)
    *      executable plain files (0100)
    %      device files (character or block special)
    %b     block special files
    %c     character special files
    r      owner-readable files (0400)
    w      owner-writable files (0200)
    x      owner-executable files (0100)
    A      group-readable files (0040)
    I      group-writable files (0020)
    E      group-executable files (0010)
    R      world-readable files (0004)
    W      world-writable files (0002)
    X      world-executable files (0001)
    s      setuid files (04000)
    S      setgid files (02000)
    t      files with the sticky bit (01000)

  print *(m-1)          # Files modified up to a day ago
  print *(a1)           # Files accessed a day ago
  print *(@)            # Just symlinks
  print *(Lk+50)        # Files bigger than 50 kilobytes
  print *(Lk-50)        # Files smaller than 50 kilobytes
  print **/*.c          # All *.c files recursively starting in \$PWD
  print **/*.c~file.c   # Same as above, but excluding 'file.c'
  print (foo|bar).*     # Files starting with 'foo' or 'bar'
  print *~*.*           # All Files that do not contain a dot
  chmod 644 *(.^x)      # make all plain non-executable files publically readable
  print -l *(.c|.h)     # Lists *.c and *.h
  print **/*(g:users:)  # Recursively match all files that are owned by group 'users'
  echo /proc/*/cwd(:h:t:s/self//) # Analogous to >ps ax | awk '{print $1}'<"
}

# listing stuff
#a2# Execute \kbd{ls -lSrah}
alias dir="ls -lSrah"
#a2# Only show dot-directories
alias lad='ls -d .*(/)'
#a2# Only show dot-files
alias lsa='ls -a .*(.)'
#a2# Only files with setgid/setuid/sticky flag
alias lss='ls -l *(s,S,t)'
#a2# Only show symlinks
alias lsl='ls -l *(@)'
#a2# Display only executables
alias lsx='ls -l *(*)'
#a2# Display world-{readable,writable,executable} files
alias lsw='ls -ld *(R,W,X.^ND/)'
#a2# Display the ten biggest files
alias lsbig="ls -flh *(.OL[1,10])"
#a2# Only show directories
alias lsd='ls -d *(/)'
#a2# Only show empty directories
alias lse='ls -d *(/^F)'
#a2# Display the ten newest files
alias lsnew="ls -rtlh *(D.om[1,10])"
#a2# Display the ten oldest files
alias lsold="ls -rtlh *(D.Om[1,10])"
#a2# Display the ten smallest files
alias lssmall="ls -Srl *(.oL[1,10])"
#a2# Display the ten newest directories and ten newest .directories
alias lsnewdir="ls -rthdl *(/om[1,10]) .*(D/om[1,10])"
#a2# Display the ten oldest directories and ten oldest .directories
alias lsolddir="ls -rthdl *(/Om[1,10]) .*(D/Om[1,10])"

# some useful aliases
#a2# Remove current empty directory. Execute \kbd{cd ..; rmdir $OLDCWD}
alias rmcdir='cd ..; rmdir $OLDPWD || cd $OLDPWD'

#a2# ssh with StrictHostKeyChecking=no \\&\quad and UserKnownHostsFile unset
alias insecssh='ssh -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null"'
alias insecscp='scp -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null"'

######## From zsh-chneukirchen {{{1
# sfetch (sftp|scp)://HOST/PATH [DEST] -- file by scp/sftp with resuming
# 19sep2011  +chris+
sfetch() {
  curl -k -u $USER -C- ${2:--O}${2:+-o $2} $1
}

# mess -- switch to current mess folder, creating it if needed
# 17may2008  +chris+
mess() {
  set +e
  DIR=~/mess/$(date +%Y/%V)
  [[ -d $DIR ]] || {
    mkdir -p $DIR
    ln -sfn $DIR ~/mess/current
    echo "Created $DIR."
  }
  cd ~/mess/current
}

# 29feb2008  +chris+
# 13apr2010  +chris+  allow completion
# 18dec2012  +chris+  set work tree too
alias homegit="GIT_DIR=~/prj/dotfiles/.git GIT_WORK_TREE=~ git"

# preserve cd -
# 21feb2011  +chris+
# 12feb2012  +chris+  save full dirstack, adopted from grml
# 02feb2013  +chris+  only add $PWD to file, better for multiple shells
DIRSTACKSIZE=9
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
chpwd() {
  local -a dirs; dirs=( "$PWD" ${(f)"$(< $DIRSTACKFILE)"} )
  print -l ${${(u)dirs}[0,$DIRSTACKSIZE]} >$DIRSTACKFILE
}

# translate -- grep de-en dictionary
# 22feb2010  +chris+
translate() { grep -i -w -e $1 ~/.translate.de-en } 

# mcd -- mkdir and cd at once
# 16may2010  +chris+
# 12feb2012  +chris+
mcd() { mkdir -p "$1" && cd "$1" }
compdef mcd=mkdir

# img -- display given or all images with the currently preferred viewer
# 01jun2010  +chris+
# 01apr2013  +chris+  back to feh
# 15sep2013  +chris+  back to qiv
img() {
  qiv -ftuNRi ${*:-.}
}

# h -- grep history
# 08mar2011  +chris+
# 14mar2011  +chris+
# 08dec2011  +chris+
h() {
  fc -l 0 -1 | sed -n "/$1/s/^ */!/p" | tail -n ${2:-10}
}
alias h=' h'

# sucdo -- su -c like sudo without quotes
# 21mar2011  +chris+
sucdo() {
  su -c "$*"
}
compdef sucdo=sudo

# pstop -- ps with top-like output
# 16aug2011  +chris+
pstop() {
  ps -eo pid,user,pri,ni,vsz,rsz,stat,pcpu,pmem,time,comm --sort -pcpu |
    head "${@:--n 20}"
}

# sfetch (sftp|scp)://HOST/PATH [DEST] -- file by scp/sftp with resuming
# 19sep2011  +chris+
sfetch() {
  curl -k -u $USER -C- ${2:--O}${2:+-o $2} $1
}

# zman -- easier browsing of zsh manpage
# 20sep2011  +chris+
zman() {
  PAGER="less -g -s '+/^       "$1"'" man zshall
}

# g -- call grep recursively with useful defaults
# 02oct2011  +chris+
# 10jan2012  +chris+  take an directory as possible last argument
# 28nov2012  +chris+  use grep -r
g() {
  local p=$argv[-1]
  [[ -d $p ]] && { p=$p/; argv[-1]=(); } || p=''
  grep --exclude "*~" --exclude "*.o" --exclude "tags" \
    --exclude-dir .bzr --exclude-dir .git --exclude-dir .hg --exclude-dir .svn \
    --exclude-dir CVS  --exclude-dir RCS --exclude-dir _darcs \
    --exclude-dir _build \
    -r -P ${@:?regexp missing} $p
}

# l -- find file names, recursively
# 20jun2012  +chris+  take an directory as possible last argument
l() {
  local p=$argv[-1]
  [[ -d $p ]] && { argv[-1]=(); } || p='.'
  find $p ! -type d | sed 's:^./::' | egrep "${@:-.}"
}

# lr -- a saner ls -R (using find)
# 07jun2013  +chris+
lr() {
  zparseopts -D -E S=S t=t r=r h=h U=U l=l F=F d=d
  local sort="sort -t/ -k2"                                # by name (default)
  local numfmt="cat"
  local long='s:[^/]* /::; s:^\./\(.\):\1:;'               # strip detail
  local classify=''
  [[ -n $F ]] && classify='/^d/s:$:/:; /^-[^ ]*x/s:$:*:;'  # dir/ binary*
  [[ -n $l ]] && long='s: /\(\./\)\?: :;'                  # show detail
  [[ -n $S ]] && sort="sort -n -k5"                        # by size
  [[ -n $r ]] && sort+=" -r"                               # reverse
  [[ -n $t ]] && sort="sort -k6" && { [[ -n $r ]] || sort+=" -r" } # by date
  [[ -n $U ]] && sort=cat                                  # no sort, live output
  [[ -n $h ]] && numfmt="numfmt --field=5 --to=iec --padding=6"  # human fmt
  [[ -n $d ]] && set -- "$@" -prune                        # don't enter dirs
  find "$@" -printf "%M %2n %u %g %9s %TY-%Tm-%Td %TH:%TM /%p -> %l\n" |
    $=sort | $=numfmt |
    sed '/^[^l]/s/ -> $//; '$long' '$classify
}
alias lr='lr -F'

# use-context -- enable ConTeXt paths
# 16aug2011  +chris+
use-context() {
  export TEXMFOS=/opt/context-minimals/texmf-linux-64
  export TEXMFCACHE=$HOME/.cache/texmf-cache
  export PATH=$TEXMFOS/bin:$PATH
  export OSFONTDIR="$HOME/.fonts;/usr/share/fonts;"
}

# pacgrep -- search arch package contents
# 21nov2011  +chris+
# 08dec2011  +chris+
pacgrep() {
  PATTERN=${1:?pattern missing}
  shift
  pacman -Qlq "$@" | xargs grep -d skip -e "$PATTERN"
}
_pacgrep() {
  _pacman  # force autoload
  _arguments : '1:pattern:' '*:package:_pacman_completions_installed_packages'
}
compdef _pacgrep pacgrep

# imv -- interactive rename, using vared
# 03sep2012  +chris+
imv() {
  local src dst
  for src; do
    [[ -e $src ]] || { print -u2 "$src does not exist"; continue }
    dst=$src
    vared dst
    [[ $src != $dst ]] && mkdir -p $dst:h && mv -n $src $dst
  done
}

# hl -- highlight regexps
# 06sep2012  +chris+
hl() {
  egrep --color=always -e '' -e${^*}
}

# don't export $COLUMNS for ps, to allow long lines on "ps | grep ..."
# 09nov2012  +chris+
ps() {
  ( unset COLUMNS; command ps "$@" )
}

# noq -- remove query string from filenames
# 01dec2012  +chris+
noq() {
  for f (${@:-*\?*}) mv -nv $f ${f%%\?*}
}

# jkill -- kill all jobs of the current shell
# 23dec2012  +chris+
jkill() {
  kill "$@" %${(k)^jobstates}
}

# jpid -- map job ids to pids
# 23dec2012  +chris+
jpid() {
  local p
  # $jobstates uses jobs.c:getjob() and can do %1 or %foo as well.
  for id; p+=(${${${jobstates[$id]}#*:*:}%=*})
  print $p
}

# zconvert -- zmv calling convert
# 05feb2013  +chris+
zconvert() {
  zparseopts -D n=n
  zmv -vf -W -p convert $n "-o ${*[1,-3]}" "$@[-2]" "$@[-1]"
}
alias zconvert='noglob zconvert'

# px -- verbose pgrep
px() {
  ps uwwp ${$(pgrep -d, "${(j:|:)@}"):?no matches}
}

# crun -- compile and run .c program
crun() {
  local cprog=$1; shift
  local n=$@[(i)--]
  gcc -o ${cprog%.*} $cprog $@[1,n-1] && ./${cprog%.*} $@[n+1,-1]
}

# tracing -- run zsh function with tracing
tracing() {
  local f=$1; shift
  functions -t $f
  $f "$@"
  functions +t $f
}

# bins -- list all executable files in $PATH as called by basename
bins() {
  rehash
  whence -p ${(kon)commands}
}

# v -- open file:line: in vim, defaulting to X selection
# 28aug2013  +chris+
v() {
  case ${1:=$(xsel)} in
    *:<->:) v ${1%:};;
    *:<->) [[ -e ${1%:*} ]] && vim +${1##*:} ${1%:*};;
    *) [[ -e $1 ]] && vim $1
  esac
}

# up [|N|pat] -- go up 1, N or until basename matches pat many directories
#   just output directory when not used interactively, e.g. in backticks
# 06sep2013  +chris+
up() {
  local op=print
  [[ -t 1 ]] && op=cd
  case "$1" in
    '') up 1;;
    -*|+*) $op ~$1;;
    <->) $op $(printf '../%.0s' {1..$1});;
    *) local -a seg; seg=(${(s:/:)PWD%/*})
       local n=${(j:/:)seg[1,(I)$1*]}
       if [[ -n $n ]]; then
         $op /$n
       else
         print -u2 up: could not find prefix $1 in $PWD
         return 1
       fi
  esac
}

######## URL Tools {{{1
# Adds handy command line aliases useful for dealing with URLs
#
# Taken from:
# http://ruslanspivak.com/2010/06/02/urlencode-and-urldecode-from-a-command-line/

alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'

encode64(){ echo -n $1 | base64 }
decode64(){ echo -n $1 | base64 -D }


####### oh-my-zsh
# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
print -P -- "$code: %F{$code}Test%f"
  done
}
##### zmodload {{{1
zmodload zsh/zpty #zsh/zsocket
######## See also: {{{1
#https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/github/github.plugin.zsh
#https://gist.github.com/3712874
#
