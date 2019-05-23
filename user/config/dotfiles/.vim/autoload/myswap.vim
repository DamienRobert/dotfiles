" Transpose words {{{1
" Transpose words: adapted from https://github.com/Raimondi/vim-transpose-words
function! myswap#TransposeWords(type, cursor_pos, ...)
  let cnt = a:0 ? a:1 : v:count1
" Get cursor position on [line, column] format.
  let current = getpos('.')[1:-2]
" Find the words to be swapped.
  if a:type == 'next'
    let pos1 = searchpos('\k\+', 'cWb')
    if !pos1[0]
      let pos1 = searchpos('\k\+', 'cW')
    endif
    let pos2 = map(range(cnt),
          \ 'searchpos(''\%(^\|\k\@!\_.\)\zs\k'', ''W'')')[-1]
  elseif a:type == 'prev'
    let pos2 = searchpos('\k\+', 'cWb')
    if !pos2[0]
      let pos2 = searchpos('\k\+', 'cW')
    endif
    let pos1 = map(range(cnt),
          \ 'searchpos(''\%(^\|\k\@!\_.\)\zs\k'', ''Wb'')')[-1]
  endif
  if !pos1[0] || !pos2[0]
" At least one word wasn't found.
    return cursor(current)
  endif
" Restore cursor position.
  call cursor(current)
  let line1 = getline(pos1[0])
  let line2 = pos1[0] == pos2[0] ? line1 : getline(pos2[0])
  let word1 = matchstr(line1[pos1[1] - 1 :], '^\k\+')
  let word2 = matchstr(line2[pos2[1] - 1 :], '^\k\+')
  if pos1[0] == pos2[0] && (pos1[1] + len(word1) >= pos2[1])
" Didn't find two separate words.
    return cursor(current)
  endif
  let partial1 = line1[ : pos1[1] == 1 ? - (len(line1) + 1) : pos1[1] - 2]
  if pos1[0] < pos2[0]
" Words are on different lines.
    let partial2 = line1[pos1[1] + len(word1) - 1 : ]
    let partial3 = line2[ : pos2[1] == 1 ? - (len(line2) + 1) : pos2[1] - 2]
    let partial4 = line2[pos2[1] + len(word2) - 1 : ]
    let final_line1 = partial1 . word2 . partial2
    let final_line2 = partial3 . word1 . partial4
  else
" Words are on the same line.
    let partial2 = line1[ pos1[1] + len(word1) - 1 : pos2[1] - 2]
    let partial3 = line1[ pos2[1] + len(word2) - 1 : ]
    let final_line1 = partial1 . word2 . partial2 . word1 . partial3
  endif
  if setline(pos1[0], final_line1)
        \ || (exists('final_line2')
        \ && setline(pos2[0], final_line2))
" There was a problem setting the line.
    return cursor(current)
  endif
" Make repeating with . possible.
" Do not re-attempt to use repeat#set() if not available.
  if !exists('s:repeat') || s:repeat
    silent! call repeat#set("\<Plug>TransposeWords", cnt)
    let s:repeat = exists('*repeat#set')
  endif
" Place the cursor in front of the word.
  if     a:cursor_pos == 'keep'
    let c = current
  elseif a:cursor_pos == 'follow'
    if a:type == 'next'
      let c = [pos2[0],pos2[1] + len(pos1[0] == pos2[0] ? word2 : word1) - len(word1) + current[1]-pos1[1]]
    elseif a:type == 'prev'
      let c = [pos1[0],pos1[1] + current[1]-pos2[1]]
    endif
  elseif a:cursor_pos == 'left'
    let c = [pos1[0],pos1[1]]
  elseif a:cursor_pos == 'right'
    let c = [pos2[0],pos2[1] + len(pos1[0] == pos2[0] ? word2 : word1)]
  endif
  return !cursor(c)
endfunction

" Swap words {{{1
" Adapted from http://code.google.com/p/lh-vim/source/browse/misc/trunk/plugin/vim-tip-swap-word.vim?r=486
function! myswap#SwapVisualWithCut()
  let deleted = @"

  let v_s = getpos("'<")
  let v_e = getpos("'>")
  "if v_s > v_e
  "  let v_e = getpos("'<")
  "  let v_s = getpos("'>")
  "endif
  let d_s = getpos("'.")

  if v_s[1]==d_s[1] && v_s[2] < d_s[2]
    let line = getline(d_s[1])
    let c = d_s[2]

    let line_2 = (v_s[2] > 1 ? line[ : v_s[2]-2] : '')
    \. deleted
    \. line[v_e[2] : c-1]
    \. line[v_s[2]-1 : v_e[2]-1]
    \. line[c : ]
    "normal! u
    call setline(d_s[1], line_2)
  else
    normal! `.``gvp``P
  endif
endfunction
" }}}

"Swap columns {{{1
"Taken from vim-swapcol

function! s:GetToken(line, i, pat)
    let l:token = strpart(a:line, a:i, 1)
    let l:len   = strlen(a:line)
    let l:inx   = a:i + 1

    while l:inx < l:len
        let l:char = strpart(a:line, l:inx, 1)
        if l:char =~# a:pat
            let l:token .= l:char
            let l:inx += 1
        else
            return l:token
        endif
    endwhile

    return l:token
endfunction

" Swap current column with behind
function! myswap#SwapColWithBehind()
    let l:line = getline('.')
    let l:len  = strlen(l:line)
    let l:col  = col('.')
    let l:i    = 0
    let l:list = []

    while l:i < l:len
        if strpart(l:line, l:i, 1) =~ '\s'
            let l:token = s:GetToken(l:line, l:i, '\s')
        else
            let l:token = s:GetToken(l:line, l:i, '\S')
        endif
        call add(l:list, l:token)
        let l:i += strlen(l:token)
    endwhile
    unlet l:line

    let l:pos = 1
    let l:i   = 0
    let l:len = len(l:list)
    while l:i < l:len
        if l:col >= l:pos && l:col <= (l:pos + strlen(l:list[l:i]) - 1)
            let l:cur = l:i
            break
        endif
        let l:pos += strlen(l:list[l:i])
        let l:i   += 1
    endwhile
    unlet l:pos

    " The blank col
    if l:list[l:cur] =~# '\s'
        return
    endif
    " The last col
    if l:cur == l:len - 1
        return
    endif
    " No col behind
    let l:swap = l:cur + 2
    if l:swap >= l:len
        return
    endif

    let l:coltmp       = l:list[l:cur]
    let l:list[l:cur]  = l:list[l:swap]
    let l:list[l:swap] = l:coltmp

    call setline(line('.'), join(l:list, ''))
endfunction

" Swap current column with before
function! myswap#SwapColWithBefore()
    let l:line = getline('.')
    let l:col  = col('.')
    let l:len  = strlen(l:line)
    let l:i    = 0
    let l:list = []

    while l:i < l:len
        if strpart(l:line, l:i, 1) =~ '\s'
            let l:token = s:GetToken(l:line, l:i, '\s')
        else
            let l:token = s:GetToken(l:line, l:i, '\S')
        endif
        call add(l:list, l:token)
        let l:i += strlen(l:token)
    endwhile
    unlet l:line

    let l:pos = 1
    let l:i   = 0
    let l:len = len(l:list)
    while l:i < l:len
        if l:col >= l:pos && l:col <= (l:pos + strlen(l:list[l:i]) - 1)
            let l:cur = l:i
            break
        endif
        let l:pos += strlen(l:list[l:i])
        let l:i   += 1
    endwhile
    unlet l:pos

    " The blank col
    if l:list[l:cur] =~# '\s'
        return
    endif
    " The first col
    if l:cur == 0
        return
    endif
    " No col before
    let l:swap = l:cur - 2
    if l:swap < 0
        return
    endif

    let l:coltmp       = l:list[l:cur]
    let l:list[l:cur]  = l:list[l:swap]
    let l:list[l:swap] = l:coltmp

    call setline(line('.'), join(l:list, ''))
endfunction

" Swap two columns
function! s:SwapCols_(linenum, m, n)
    let l:line       = getline(a:linenum)
    let l:len        = strlen(l:line)
    let l:i          = 0
    let l:blank_list = []
    let l:col_list   = []

    while l:i < l:len
        if strpart(l:line, l:i, 1) =~ '\s'
            let l:token = s:GetToken(l:line, l:i, '\s')
            call add(l:blank_list, l:token)
        else
            let l:token = s:GetToken(l:line, l:i, '\S')
            call add(l:col_list, l:token)
        endif
        let l:i += strlen(l:token)
    endwhile
    if strpart(l:line, 0, 1) =~# '\s'
        let l:firstColIsBlank = 1
    else
        let l:firstColIsBlank = 0
    endif
    unlet l:line

    " The column num is illegal
    if a:m <= 0 || a:m > len(l:col_list)
        return
    endif
    if a:n <= 0 || a:n > len(l:col_list)
        return
    endif

    let l:coltmp          = l:col_list[a:m-1]
    let l:col_list[a:m-1] = l:col_list[a:n-1]
    let l:col_list[a:n-1] = l:coltmp

    let l:first_i   = 0
    let l:second_i  = 0
    let l:result    = ''

    if l:firstColIsBlank
        let l:first  = l:blank_list
        let l:second = l:col_list
    else
        let l:first  = l:col_list
        let l:second = l:blank_list
    endif

    let l:first_len  = len(l:first)
    let l:second_len = len(l:second)

    while l:first_i < l:first_len && l:second_i < l:second_len
        let l:result   .= l:first[l:first_i]
        let l:result   .= l:second[l:second_i]
        let l:first_i  += 1
        let l:second_i += 1
    endwhile
    if l:first_i < l:first_len
        let l:result .= l:first[l:first_i]
    endif
    if l:second_i < l:second_len
        let l:result .= l:second[l:second_i]
    endif

    call setline(a:linenum, l:result)
endfunction

" Swap two columns on multiple lines
function! myswap#SwapCols(m, n) range
    for l:linenum in range(a:firstline, a:lastline)
        call s:SwapCols_(l:linenum, a:m, a:n)
    endfor
endfunction
" }}}
