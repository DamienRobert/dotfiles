#vim: fdm=marker
### les fonctions de Luc sont grassouilles  {{{
function zle_insert-pair () {
    LBUFFER="$LBUFFER$1"
    RBUFFER="$2$RBUFFER"
}

function zle_insert-braces () {
    zle_insert-pair '{' '}'
}
zle -N zle_insert-braces


function zle_insert-double-quotes () {
    zle_insert-pair '"' '"'
}
zle -N zle_insert-double-quotes


function zle_insert-quotes () {
    zle_insert-pair \' \'
}
zle -N zle_insert-quotes

function zle_insert-back-quotes () {
    zle_insert-pair '`' '`'
}
zle -N zle_insert-back-quotes

function zle_insert-parentheses () {
    zle_insert-pair '(' ')'
}
zle -N zle_insert-parentheses


function zle_insert-brackets () {
    zle_insert-pair '[' ']'
}
zle -N zle_insert-brackets

function zle_setup-delims () {
    bindkey '[' insert-brackets
    bindkey '(' insert-parentheses
    bindkey '`' insert-back-quotes
    bindkey \' insert-quotes
    bindkey '"' insert-double-quotes
    bindkey '{' insert-braces
}

function zle_unset-delims () {
    bindkey '[' self-insert
    bindkey '(' self-insert
    bindkey '`' self-insert
    bindkey \' self-insert
    bindkey '"' self-insert
    bindkey '{' self-insert
}
zle_setup-delims
#}}}

## dircycle {{{
#### from oh-my-zsh
##
# dircycle plugin: enables cycling through the directory
# stack using Ctrl+Shift+Left/Right

function zle_insert-cycledleft () { zle push-line; LBUFFER='pushd -q +1'; zle accept-line }
zle -N zle_insert-cycledleft
bindkey "\e[1;6D" zle_insert-cycledleft

function zle_insert-cycledright () { zle push-line; LBUFFER='pushd -q -0'; zle accept-line }
zle -N zle_insert-cycledright
bindkey "\e[1;6C" zle_insert-cycledright

#DIRSTACKSIZE=10
#setopt autopushd pushdminus pushdsilent pushdtohome pushdignoredups
#### }}}

# Unbinded functions {{{
# press esc-m for inserting last typed word again (thanks to caphuso!)
zle_insert-last-typed-word() { zle insert-last-word -- 0 -1 };
zle -N zle_insert-last-typed-word;
#k# Insert last typed word
#bindkey "\em" insert-last-typed-word

## beginning-of-line OR beginning-of-buffer OR beginning of history
## by: Bart Schaefer <schaefer@brasslantern.com>, Bernhard Tittelbach
zle_beginning-or-end-of-somewhere() {
    local hno=$HISTNO
    if [[ ( "${LBUFFER[-1]}" == $'\n' && "${WIDGET}" == beginning-of* ) || \
      ( "${RBUFFER[1]}" == $'\n' && "${WIDGET}" == end-of* ) ]]; then
        zle .${WIDGET:s/somewhere/buffer-or-history/} "$@"
    else
        zle .${WIDGET:s/somewhere/line-hist/} "$@"
        if (( HISTNO != hno )); then
            zle .${WIDGET:s/somewhere/buffer-or-history/} "$@"
        fi
    fi
}
zle -N zle_beginning-of-somewhere zle_beginning-or-end-of-somewhere
zle -N zle_end-of-somewhere zle_beginning-or-end-of-somewhere

run-fg-editor() {
  zle push-input
  BUFFER="fg %$EDITOR:t"
  zle accept-line
}
zle -N zle_run-fg-editor
#call back the suspended editor
#}}}
