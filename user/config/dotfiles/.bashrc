# Check for an interactive session
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

[[ -e "$HOME/.dir_colors" ]] && eval `dircolors -b $HOME/.dir_colors 2>/dev/null`
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

# From https://github.com/junegunn/fzf/wiki/examples
# CTRL-X-1 - Invoke Readline functions by name
__fzf_readline ()
{
    builtin eval "
        builtin bind ' \
            \"\C-x3\": $(
                builtin bind -l | command fzf +s +m --toggle-sort=ctrl-r
            ) \
        '
    "
}
builtin bind -x '"\C-x2": __fzf_readline';
builtin bind '"\C-x1": "\C-x2\C-x3"'
