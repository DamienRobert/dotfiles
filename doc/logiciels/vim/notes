vim: foldmethod=expr ft=markdownlight

# Documentation

- vim scripts tutorial:
https://www.ibm.com/developerworks/linux/library/l-vim-script-1/index.html
- book: http://learnvimscriptthehardway.stevelosh.com/
- Vim+ex: http://dahu.github.io/vim_waz_ere/
- https://github.com/mhinz/vim-galore
- vimrc guideline: https://github.com/romainl/idiomatic-vimrc/blob/master/idiomatic-vimrc.vim
- https://www.hillelwayne.com/post/intermediate-vim/

# Tab

tabstop/ts: number of spaces for an actual <Tab>
softtabstop/sts: virtual number of spaces for a <Tab> or <BS>
shiftwidth/sw
expandtab/et: replace a tab by spaces
smartab/tsta: <tab> => shiftwidth or <tab>
   (note that with smartab+noexpandtab, vim will replace 8 spaces with a tab when using <tab> in shiftwidth mode, ie as if the shiftwidth was a softtabstop)

Exemples: set shiftwidth=2 expandtab smarttab
          autocmd Filetype c,ruby,python,perl,sh,zsh,gitconfig setlocal ts=2 noexpandtab

For git: set shiftwidth=8 ts=8 noexpandtab

# Tips:
- http://stackoverflow.com/questions/4097259/in-vim-how-do-i-highlight-todo-and-fixme
  ~~~ vim
  augroup vimrc_todo
      au!
      au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX):/
            \ containedin=.*Comment,vimCommentTitle
  augroup END
  hi def link MyTodo Todo
  ~~~

- Startup time:
  vim --startuptime /dev/stdout +qall

- sessions: https://jvns.ca/blog/2017/09/10/vim-sessions/
  :mksession ~/.vim/sessions/foo.vim
  :source ~/.vim/sessions/foo.vim
  or `vim -S ~/.vim/sessions/foo.vim`

# Maps

Defaults maps: 'help index'
:map " see all maps
:command " see all commands
:set all " see all settings

map keywords: <buffer>, <nowait>, <silent>, <special>, <script>, <expr>, <unique>
:map   :noremap  :unmap     Normal, Visual, Select, Operator-pending
:nmap  :nnoremap :nunmap    Normal
:vmap  :vnoremap :vunmap    Visual and Select
:smap  :snoremap :sunmap    Select
:xmap  :xnoremap :xunmap    Visual
:omap  :onoremap :ounmap    Operator-pending "Allow to map movement commands
:map!  :noremap! :unmap!    Insert and Command-line
:imap  :inoremap :iunmap    Insert
:lmap  :lnoremap :lunmap    Insert, Command-line, Lang-Arg (=search pattern, r/f + character)
:cmap  :cnoremap :cunmap    Command-line
:tmap  :tnoremap :tunmap    Terminal-Job "for :terminal

Capture the commands:
http://vim.wikia.com/wiki/Capture_ex_command_output
~~~ vim
:redir @a
:set all
:redir END
~~~
=> my#GetCommandOutputInTab(cmd)

# vimscript
<SID>: allows to call a s:VimScriptFn function in a mapping:
    map foo call <SID>VimScriptFn()<CR>
This only works for a map defined in the script file, to allow to bubble
the map use <Plug>:
noremap <unique> <Plug>ScriptFunc :call <SID>VimScriptFn()<CR>
nmap _ex <Plug>ScriptFunc

## variables

set foo+=bar "adds bar at the beginning of foo
set foo^=bar "adds bar at the end of foo
