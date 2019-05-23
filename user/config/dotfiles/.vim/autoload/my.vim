" vim: set fdm=marker:

" Quick fix toggle {{{1
" http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window
function! s:GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! my#ToggleList(bufname, pfx)
  let buflist = s:GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction
" }}}1
function! my#AleToggleSign()
  if g:ale_set_signs
    let g:ale_set_signs=0
    sign unplace *
    " sign unplace ALEErrorSign 
    " sign unplace ALEStyleErrorSign 
    " sign unplace ALEWarningSign 
    " sign unplace ALEStyleWarningSign 
    " sign unplace ALEInfoSign 
    " sign unplace ALEDummySign
  else
    let g:ale_set_signs=1
    ALELint
  endif
endfunction

function! my#GetCommandOutputInTab(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
