vim: ft=markdownlight fdm=expr

Mouse
=====

Better mouse shortcuts, see:
https://bbs.archlinux.org/viewtopic.php?id=204091
https://github.com/tmux/tmux/issues/145

Default bindings
================

bind-key        C-b send-prefix                                         [25/25]
bind-key        C-o rotate-window
bind-key        C-z suspend-client
bind-key      Space next-layout
bind-key          ! break-pane
bind-key          " split-window
bind-key          # list-buffers
bind-key          $ command-prompt -I #S "rename-session '%%'"
bind-key          % split-window -h
bind-key          & confirm-before -p "kill-window #W? (y/n)" kill-window
bind-key          ' command-prompt -p index "select-window -t ':%%'"
bind-key          ( switch-client -p
bind-key          ) switch-client -n
bind-key          , command-prompt -I #W "rename-window '%%'"
bind-key          - delete-buffer
bind-key          . command-prompt "move-window -t '%%'"
bind-key          0 select-window -t :0
bind-key          1 select-window -t :1
bind-key          2 select-window -t :2
bind-key          3 select-window -t :3
bind-key          4 select-window -t :4
bind-key          5 select-window -t :5
bind-key          6 select-window -t :6
bind-key          7 select-window -t :7
bind-key          8 select-window -t :8
bind-key          9 select-window -t :9
bind-key          : command-prompt
bind-key          ; last-pane
bind-key          = choose-buffer
bind-key          ? list-keys
bind-key          D choose-client
bind-key          L switch-client -l
bind-key          [ copy-mode
bind-key          ] paste-buffer
bind-key          c new-window
bind-key          d detach-client
bind-key          f command-prompt "find-window '%%'"
bind-key          i display-message
bind-key          l last-window
bind-key          n next-window
bind-key          o select-pane -t :.+
bind-key          p previous-window
bind-key          q display-panes
bind-key          r refresh-client
bind-key          s choose-tree
bind-key          t clock-mode
bind-key          w choose-window
bind-key          x confirm-before -p "kill-pane #P? (y/n)" kill-pane
bind-key          z resize-pane -Z
bind-key          { swap-pane -U
bind-key          } swap-pane -D
bind-key          ~ show-messages
bind-key      PPage copy-mode -u
bind-key -r      Up select-pane -U
bind-key -r    Down select-pane -D
bind-key -r    Left select-pane -L
bind-key -r   Right select-pane -R
bind-key        M-1 select-layout even-horizontal
bind-key        M-2 select-layout even-vertical
bind-key        M-3 select-layout main-horizontal
bind-key        M-4 select-layout main-vertical
bind-key        M-5 select-layout tiled
bind-key        M-n next-window -a
bind-key        M-o rotate-window -D
bind-key        M-p previous-window -a
bind-key -r    M-Up resize-pane -U 5
bind-key -r  M-Down resize-pane -D 5
bind-key -r  M-Left resize-pane -L 5
bind-key -r M-Right resize-pane -R 5
bind-key -r    C-Up resize-pane -U
bind-key -r  C-Down resize-pane -D
bind-key -r  C-Left resize-pane -L
bind-key -r C-Right resize-pane -R

Plugins
=======

* Manager
- https://github.com/tmux-plugins/tpm

* Exemples of tmux plugins:
- https://github.com/tmux-plugins/tmux-sensible
  basic tmux settings everyone can agree on
- https://github.com/tmux-plugins/tmux-copycat
  A plugin that enhances tmux search
- https://github.com/tmux-plugins/tmux-yank
  Tmux plugin for copying to system clipboard
- https://github.com/tmux-plugins/tmux-open
  Tmux key bindings for quick opening of a highlighted file or url
- https://github.com/tmux-plugins/tmux-pain-control
  standard pane key-bindings for tmux
- https://github.com/tmux-plugins/tmux-resurrect
  Persists tmux environment across system restarts.
- https://github.com/tmux-plugins/tmux-continuum
  Continuous saving of tmux environment. Automatic restore when tmux is
  started. Automatic tmux start when computer is turned on.

Misc
====

http://stackoverflow.com/questions/22138211/how-do-i-disconnect-all-other-users-in-tmux
=> <prefix> D

Commands
========

http://hyperpolyglot.org/multiplexers
                                  screen 		tmux
create session and attach 	$ screen 		$ tmux
create session foo and attach 	$ screen -S foo 	$ tmux new -s foo
create detached session foo 	$ screen -S foo -d -m 	$ tmux new -s foo -d
list sessions 			$ screen -list 		$ tmux ls
attach 	$ screen -r 		$ tmux attach
attach to session foo 		$ screen -r foo 	$ tmux attach -t foo
attach to session by pid 	$ screen -r pid 	
kill session foo 		$ screen -r foo -X quit $ tmux kill-session -t foo
send command to session foo 	$ screen -r foo -X command 	$ tmux command -t foo
run ls in session foo 		$ screen -r foo -X stuff "ls $(echo -ne '\015')" 	$ tmux send-keys -t foo 'ls' C-m
run vi in new window 		$ screen vi /etc/motd 	$ tmux new-window vi /etc/motd
