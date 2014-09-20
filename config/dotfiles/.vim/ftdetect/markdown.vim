" From vim-markdown, so that I get the correct filetype even with 'vi'
autocmd BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn
      \ if &ft =~# '^\%(conf\|modula2\)$' |
      \   set ft=markdown |
      \ else |
      \   setf markdown |
      \ endif

autocmd BufNewFile,BufRead *.kramdown,*.kd
  \ setf kramdown

autocmd BufNewFile,BufRead *.markdownlight,*.mdl
  \ setf markdownlight

autocmd BufNewFile,BufRead *.mymarkdown,*.mmd
  \ setf mymarkdown
