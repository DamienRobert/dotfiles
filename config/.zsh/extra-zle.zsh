## beginning-of-line OR beginning-of-buffer OR beginning of history
## by: Bart Schaefer <schaefer@brasslantern.com>, Bernhard Tittelbach
beginning-or-end-of-somewhere() {
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
zle -N beginning-of-somewhere beginning-or-end-of-somewhere
zle -N end-of-somewhere beginning-or-end-of-somewhere

run-fg-editor() {
  zle push-input
  BUFFER="fg %$EDITOR:t"
  zle accept-line
}
zle -N run-fg-editor
#call back the suspended editor

### les fonctions de Luc sont grassouilles  {{{2

function insert-pair () {
    LBUFFER="$LBUFFER$1"
    RBUFFER="$2$RBUFFER"
}

function insert-braces () {
    insert-pair '{' '}'
}

zle -N insert-braces


function insert-double-quotes () {
    insert-pair '"' '"'
}

zle -N insert-double-quotes


function insert-quotes () {
    insert-pair \' \'
}

zle -N insert-quotes

function insert-back-quotes () {
    insert-pair '`' '`'
}

zle -N insert-back-quotes


function insert-parentheses () {
    insert-pair '(' ')'
}

zle -N insert-parentheses


function insert-brackets () {
    insert-pair '[' ']'
}

zle -N insert-brackets

function setup-delims () {
    bindkey '[' insert-brackets
    bindkey '(' insert-parentheses
    bindkey '`' insert-back-quotes
    bindkey \' insert-quotes
    bindkey '"' insert-double-quotes
    bindkey '{' insert-braces
}

function unset-delims () {
    bindkey '[' self-insert
    bindkey '(' self-insert
    bindkey '`' self-insert
    bindkey \' self-insert
    bindkey '"' self-insert
    bindkey '{' self-insert
}
#}}}

# press esc-m for inserting last typed word again (thanks to caphuso!)
insert-last-typed-word() { zle insert-last-word -- 0 -1 };
zle -N insert-last-typed-word;
#k# Insert last typed word
bindkey "\em" insert-last-typed-word
