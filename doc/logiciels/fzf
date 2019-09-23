vim: ft=markdownlight fdm=expr

fzf tools
=========

http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
https://github.com/junegunn/fzf/wiki
https://github.com/junegunn/fzf/wiki/examples

fzf+cd bookmarks: https://dmitryfrank.com/articles/shell_shortcuts
fzf + chrome history: https://junegunn.kr/2015/04/browsing-chrome-history-with-fzf/
fzf + git: https://junegunn.kr/2016/07/fzf-git/
fzf + extract path: https://github.com/edi9999/path-extractor

vim and fzf: https://statico.github.io/vim3.html

Other fuzzy finders:
https://github.com/lotabout/skim (in rust)

Standard fzf options
====================

       -1, --select-1
              Automatically select the only match
       -0, --exit-0
              Exit immediately when there's no match
       -n, --nth=N[,..]
              Comma-separated  list  of  field  index expressions for limiting
              search scope.  See FIELD INDEX EXPRESSION for the details.
       --with-nth=N[,..]
              Transform the presentation of each line using  field  index  ex‐
              pressions [=only show these fields]

Key bindings
============

ctrl-y:select-all,
ctrl-n:deselect-all,
ctrl-t:toggle-all,
ctrl-r:toggle-sort,
ctrl-n:next-history,
alt-p:toggle-preview,
alt-w:toggle-preview-wrap,
alt-t:top,
ctrl-o:execute[xdg-open {}],
alt-v:execute[gvi -- {}],
alt-e:execute[$EDITOR -- {}],
alt-o:execute[dofor xdg-open {+} >/dev/null],
alt-i:execute[$EDITOR -- {+}],
alt-u:execute[gvi -p -- {+}],
alt-f:preview-page-down,
alt-b:preview-page-up,
alt-j:jump'

Fzf in the shell
================

* shell shortcuts
Esc/Alt-c: fzf-cd
^R: fzf-history
^T: fzf-file

* Complétion:
**<TAB>: expand files with fzf
kill  <TAB>, cd dir**; ls files**; ssh **; unset/unalias/export **

* git shell shortcuts:
^g^f: files (git status)
^g^b: branches
^g^t: tags
^g^r: remote
^g^h: log

* shell functions
fzbin [--fork/--exec]: show path directories and the bin in the paths
fzedit: preview && $EDITOR $files [might as well use 'edit' alias]
fzlpass: get lastpass passwords
fzpdf: uses fast-p to search words in pdf
  [`fd .pdf | fast-p` to extract text. Cache in ~/.cache/fast-p-pdftotext-output]
fzrg: calls fzf on the results of rg
fztags: search .tags

* fzv: fzf with a preview defined
       + add the 'alt-c' shortcut

  $fzf_start ${=preargs} | FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS $fzf_opts" $fzf_post $@
  fzf_preview_file="unbuffer -p vimcat {}"
  fzf_preview_dir="ls -lF --color=always {}"

  Options:
	# File selection:
	-b|--bookmarks ) Add frequently looked at files
	-a|--all ) -d|--dir ) -f|--files ): fd settings
	-l|--locate ) Use locate
	# Generic commands
	--pre ) preargs
	--post ) fzf_post # (default to $fzf_bin=fzf / fzf-tmux)
	--tmux ) fzf_bin='fzf-tmux' ;;
	# Preview window arguments
	--hidden) --height)
	# Preview bin
	--preview ) --filepreview )  --dirpreview )
	--bat ) --cat ) --vimcat )  #default to bat
	# Action after fzf selection (default is print)
	-e|--edit ) -v|--visual ) -o|--open ) --print0 ) --cd )
	# Misc
	--cdup ) #Call fzf on ../../... folders and cd to it
	--complete ) # for use in other completion functions
	--bare ) There is no actions

* shell aliases
preview="fzv --tmux --"
visual="fzv --tmux --visual -- -1"
edit="fzv --tmux --edit -- -1"
open="fzv --tmux --open -- -1"
cdup="fzv --tmux --cdup --"
fzcd="fzv --tmux -d --cd -- -q"

* shell script
fzf_mpd --genre/--artist/--album/--title/--playlist

* Divers
path-extractor (alias IPE): g s IPE fzv
