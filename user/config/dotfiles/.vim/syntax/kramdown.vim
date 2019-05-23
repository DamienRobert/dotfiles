" Vim syntax file
" Language: Kramdown

if exists("b:current_syntax")
  finish
endif

runtime! syntax/html.vim
unlet! b:current_syntax
runtime! syntax/mymarkdown.vim
unlet! b:current_syntax

let b:current_syntax = "kramdown"
