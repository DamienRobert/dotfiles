function! FugitiveStatus()
  if exists("*fugitive#statusline")
     return fugitive#statusline()
  else
     return ""
  endif
endfunc

function! AleStatus()
  "if exists("*ale#statusline#Count")
  if &rtp =~ 'ale'
    let l:counts=ale#statusline#Count(bufnr(''))
    let l:errors = l:counts[0] ? printf('%sE', l:counts[0]) : ''
    let l:warnings = l:counts[1] ? printf('%sW', l:counts[1]) : ''
    if empty(l:errors) && empty(l:warnings)
        let l:res = ""
    elseif !empty(l:errors) && !empty(l:warnings)
        let l:res = printf('%s%s', l:errors, l:warnings)
    else
        let l:res = empty(l:errors) ? l:warnings : l:errors
    endif
    if empty(l:res)
      return ""
    else
      return "[".l:res."]"
    endif
  else
    return ""
  endif
endfunction


" %< Truncate if line too long, %= Separation point
" %n Buffer number
" %m Modified flag, %f path to file
" %y Type of file, %r Readonly flag, %h Help Buffer flag
" %w Preview window flag, %q quickfix/location list
" %l line number, %L total lines, %c column number, %P percentage
let g:UltiSnipsStatus=""
set statusline=%<%n:%m%f\ %y%r%h%w%q%k\ %{FugitiveStatus()}%=%{g:UltiSnipsStatus}%{AleStatus()}\ %-10.(%l/%L:%2.c%)\ %P
