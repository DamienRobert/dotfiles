let s:triggers = get(s:, 'triggers', {})
" usage: 
" call Lazy({'name': 'WhereFrom', 'cmd': 'WhereFrom'})
" call Lazy({'name': 'searchfold.vim', 'map': ['<Leader>z', '<Leader>iz']})
    " trick: if the map is a <Plug>, add it as an interactive map too
" call Lazy({'name': 'foo.vim', 'imap': ['<Leader>z', '<Leader>iz']})
" call Lazy({'name': 'bar.vim', 'for': ['FileType1', 'FileType2']})
" call Lazy({'name': 'baz.vim', 'read': ['FilePattern1', 'FilePattern2']})

" lazy autocmd to lazy load plugin based on filetypes
if exists('#LazyLOD')
  augroup LazyLOD
    autocmd!
  augroup END
  augroup! LazyLOD
endif

" add a value to a keyed list
function! s:assoc(dict, key, val)
  let a:dict[a:key] = add(get(a:dict, a:key, []), a:val)
endfunction

function! s:to_a(v)
  return type(a:v) == type([]) ? a:v : [a:v]
endfunction

function! s:doautocmd(...)
  if exists('#'.join(a:000, '#'))
    execute 'doautocmd' ((v:version > 703 || has('patch442')) ? '<nomodeline>' : '') join(a:000)
  endif
endfunction

" load the package and refire the map
function! s:lod_map(map, names, with_prefix, prefix)
  call s:lod(a:names)
  let extra = ''
  while 1
    let c = getchar(0)
    if c == 0
      break
    endif
    let extra .= nr2char(c)
  endwhile

  if a:with_prefix
    let prefix = v:count ? v:count : ''
    let prefix .= '"'.v:register.a:prefix
    if mode(1) == 'no'
      if v:operator == 'c'
        let prefix = "\<esc>" . prefix
      endif
      let prefix .= v:operator
    endif
    call feedkeys(prefix, 'n')
  endif
  call feedkeys(substitute(a:map, '^<Plug>', "\<Plug>", '') . extra)
endfunction

" load the package and refire the command
function! s:lod_cmd(cmd, bang, l1, l2, args, names)
  call s:lod(a:names)
  execute printf('%s%s%s %s', (a:l1 == a:l2 ? '' : (a:l1.','.a:l2)), a:cmd, a:bang, a:args)
endfunction

" load the packages and remove the LazyLOD autocmd corresponding to it
function! s:lod_ft(pat, names)
  call s:lod(a:names)
  execute 'autocmd! LazyLOD FileType' a:pat
  " Fire again the autocmd linked to the filetype so that it loads the ftplugin lazily added
  " TODO check if this is done by packadd already
  call s:doautocmd('filetypeplugin', 'FileType')
  call s:doautocmd('filetypeindent', 'FileType')
endfunction

function! s:lod_fileread(pat, names, autype)
  call s:lod(a:names)
  execute 'autocmd! LazyLOD BufReadCmd' a:pat
  execute 'autocmd! LazyLOD FileReadCmd' a:pat
  " here we don't call s:doautocmd because we want the modeline
  exe 'doautocmd' a:autype
endfunction

function! Lazy(plug)
  let names=s:to_a(a:plug.name)
  for name in names
    if !has_key(s:triggers, name)
      let s:triggers[name] = { 'imap': [], 'map': [], 'cmd': [] }
    endif
  endfor

  if has_key(a:plug, 'for')
    for ft in s:to_a(a:plug.for)
      augroup LazyLOD
        execute printf('autocmd FileType %s call <SID>lod_ft(%s, %s)',
              \ ft, string(ft), string(names))
      augroup END
    endfor
  endif

  if has_key(a:plug, 'read')
    for ft in s:to_a(a:plug.read)
      augroup LazyLOD
        execute printf('autocmd FileReadCmd %s call <SID>lod_fileread(%s, %s, "FileReadCmd")',
              \ ft, string(ft), string(names))
        execute printf('autocmd BufReadCmd %s call <SID>lod_fileread(%s, %s, "BufReadCmd")',
              \ ft, string(ft), string(names))
      augroup END
    endfor
  endif

  if has_key(a:plug, 'cmd')
    for cmd in s:to_a(a:plug.cmd)
      if cmd =~# '^[A-Z]'
        let cmd = substitute(cmd, '!*$', '', '')
        if exists(':'.cmd) != 2
          execute printf(
          \ 'command! -nargs=* -range -bang -complete=file %s call s:lod_cmd(%s, "<bang>", <line1>, <line2>, <q-args>, %s)',
          \ cmd, string(cmd), string(names))
          for name in names
            call add(s:triggers[name].cmd, cmd)
          endfor
        endif
      else
        call s:err('Invalid `on` option: '.cmd.
        \ '. Should start with an uppercase letter or `<Plug>`.')
      endif
    endfor
  endif

  if has_key(a:plug, 'map')
    for map in s:to_a(a:plug.map)
      if empty(mapcheck(map))
        for name in names
          call add(s:triggers[name].map, map)
        endfor
        call s:set_map('cmd', map, names)
        " trick: if the map is a <Plug>, add it as an interactive map too
        if map =~? '^<Plug>.\+'
          assoc(a:plug, 'imap', map)
        endif
      endif
    endfor
  endif

  if has_key(a:plug, 'imap')
    for map in s:to_a(a:plug.imap)
      if empty(mapcheck(map, 'i'))
        for name in names
          call add(s:triggers[name].imap, map)
        endfor
        call s:set_map('i', map, names)
      endif
    endfor
  endif
endfunction

function! s:set_map(mode, map, names)
  let [mode, map, names]=[a:mode, a:map, a:names]
  if mode == "all"
    for lmode in ["i", "n", "v", "o"]
      call s:set_map(lmode, map, names)
    endfor
    return ""
  elseif mode == "cmd" " standard map
    for lmode in ["n", "v", "o"]
      call s:set_map(lmode, map, names)
    endfor
    return ""
  elseif mode == "i"
    let [map_prefix, key_prefix]= ['<C-O', '']
  elseif mode == "n"
    let [map_prefix, key_prefix]= ['', '']
  elseif mode == "v"
    let [map_prefix, key_prefix]= ['', 'gv']
  elseif mode == "o"
    let [map_prefix, key_prefix]= ['', '']
  endif
  execute printf(
    \ '%snoremap <silent> %s %s:<C-U>call <SID>lod_map(%s, %s, %s, "%s")<CR>',
    \ mode, map, map_prefix, string(map), string(names), mode != 'i', key_prefix)
endfunction

function! s:remove_triggers(name)
  if !has_key(s:triggers, a:name)
    return
  endif
  for cmd in s:triggers[a:name].cmd
    execute 'silent! delc' cmd
  endfor
  for map in s:triggers[a:name].map
    execute 'silent! unmap' map
  endfor
  for map in s:triggers[a:name].imap
    execute 'silent! iunmap' map
  endfor
  call remove(s:triggers, a:name)
endfunction

function! s:lod(names)
  " clean all triggers, then load packages
  for name in a:names
    call s:remove_triggers(name)
  endfor
  for name in a:names
    exe "packadd ". name
  endfor
endfunction
