#to use with gitstatus.rb --porcelain
#source in your .zshrc
if [[ -x /usr/bin/ruby ]]; then
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
        #__GIT_NOSTATUS=1 #to not rerun
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
