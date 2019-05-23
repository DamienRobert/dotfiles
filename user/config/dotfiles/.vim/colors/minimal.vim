let g:colors_name="minimal"
" " Ces couleurs-ci sont utilisées par le syntax highlight selon le type de
" " fichier que vous éditez (TeX, mail, ...).
highlight Comment     term=none      ctermfg=darkCyan cterm=none
highlight Constant    term=underline ctermfg=Blue     cterm=none
highlight Identifier  term=none      ctermfg=Green    cterm=none
highlight Statement   term=bold      ctermfg=Red      cterm=none
highlight Operator    term=none      ctermfg=darkGray cterm=bold
highlight link Delimiter Operator
highlight PreProc     term=underline ctermfg=Magenta  cterm=none
highlight Type        term=bold      ctermfg=Brown    cterm=none
highlight Special     term=bold      ctermfg=Blue     cterm=bold
highlight Search      term=reverse   cterm=reverse
highlight IncSearch   term=reverse   ctermfg=Blue     ctermbg=White
highlight link SpecialChar Special
highlight Error       term=reverse   ctermfg=White    ctermbg=Red   cterm=none
highlight Todo        term=standout  ctermfg=White    ctermbg=Green cterm=bold
" Si on n'aime pas les highlight des nombres.
" highlight link Number      NONE

" Pour les lignes "foldées" (c'est-à-dire plusieurs lignes de texte,
" visuellement condensées en une seule que l'on peut dérouler).
highlight Folded      term=standout  ctermfg=White   ctermbg=Blue cterm=bold

" Pour les diffs (commande vimdiff).
highlight DiffAdd     term=bold      ctermfg=Green   ctermbg=none cterm=bold
highlight DiffDelete  term=bold      ctermfg=Red     ctermbg=none cterm=bold
highlight DiffChange  term=bold      ctermfg=Cyan    ctermbg=none
highlight DiffText    term=standout  ctermfg=White   ctermbg=Cyan cterm=bold


"on essaie de nouvelles couleurs
"  highlight Normal guibg=grey90
"  highlight Cursor guibg=Green guifg=NONE
"  highlight lCursor guibg=Cyan guifg=NONE
"  highlight NonText guibg=grey80
"  highlight Constant gui=NONE guibg=grey95
"  highlight Special gui=NONE guibg=grey95
