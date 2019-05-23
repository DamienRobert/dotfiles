"au BufRead,BufNewFile *.magma     setfiletype c
"HACK
au BufRead,BufNewFile *.magma     setfiletype magma
"au BufRead,BufNewFile *.m    setfiletype magma
autocmd FileType magma setlocal dictionary=~/.vim/syntax/magma.vim foldmethod=marker fo-=t
