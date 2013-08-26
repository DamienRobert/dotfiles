
" je ne veux pas de toolbar
set go-=T
"je ne veux pas de blinking cursor
let &guicursor = "a:blinkon0"

if expand("$MYHOSTNAME") == 'Feanor'
  set guifont=Monospace\ 15
else
  set guifont=Monospace\ 14
endif
