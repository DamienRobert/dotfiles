" vim: set sw=2 sts=2 et fdm=marker:
" Vimscript Setup:

if exists("g:loaded_myplugins") || &cp
  finish
endif
let g:loaded_myplugins = 1

" Commands:
command! -bar -count=1 TransposeWords call my#TransposeWords('next','follow',<Count>)
command! -bar -count=1 TransposeWordsBack call my#TransposeWords('prev','follow',<Count>)
command! -range -nargs=* -complete=command Swapcols <line1>,<line2>call my#SwapCols(<f-args>)

" Maps:
"nnoremap <Plug>TransposeWords :<C-U>call TransposeWords()<CR>
"nmap <unique><silent> <leader>sw <Plug>TransposeWords
"nmap <unique><silent> <leader>sl <Plug>TransposeWordsBack
"" vnoremap <silent> <Plug>SwapVisualWithCut <Esc>:call <SID>SwapVisualWithCut()<CR>
" in my .vimrc:
" nnoremap <silent> gsl :<C-U>call TransposeWords('next','follow')<CR>
" nnoremap <silent> gsh :<C-U>call TransposeWords('prev','follow')<CR>
" nnoremap <silent> gsw :<C-U>call TransposeWords('next','keep')<CR>
" nnoremap <silent> gsW :<C-U>call TransposeWords('prev','keep')<CR>
" nnoremap <silent> gsp :call SwapColWithBefore()<cr>
" nnoremap <silent> gsn :call SwapColWithBehind()<cr>
