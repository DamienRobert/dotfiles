"vim: set fo=marker
""" View Doc {{{1
let g:no_viewdoc_abbrev=1
let g:ViewDoc_tex = 'ViewDoc_help_custom'

""" NERD comment {{{1
let NERDShutUp=1

""" NERD Tree {{{1
nmap <Leader>nT :NERDTreeToggle<CR>
nmap <Leader>nM :NERDTreeMirror<CR>
nmap <Leader>nt :NERDTree
let NERDChristmasTree=1
let NERDTreeIgnore=['\~$', '\.aux', '\.bak', '\.bbl', '\.blg', '\.glg', '\.glo', '\.gls', '\.log', '\.out', '\.thm', '\.toc', '\.xdy']
let NERDTreeSortOrder=['\/$', '*', '\.swp$', '\.orig$', '\.bak$', '\~$']

""" Fugitive {{{1
" .. pour revenir en arrière dans le Gedit
augroup myplugins
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

"autoclean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

""" Increment {{{1
vnoremap <c-a> :Inc<CR>

""" screen shell {{{1
let g:ScreenShellExternal=1 "lancer un screen externe
let g:ScreenShellTerminal="xterm"

nmap <C-s><C-n> :ScreenShell<cr>
nmap <C-s><C-a> :ScreenShellAttach<space>
nmap <C-s><C-e> :ScreenShell<space>
nmap <C-s><C-x> :ScreenQuit<cr>
nmap <C-s><C-s> :ScreenSend<cr>
vmap <C-s><C-s> :ScreenSend<cr>

""" Snipmate {{{1
"let g:snips_author = 'Damien Robert'
"let g:snips_trigger_key='<Ctrl-F>'
"let g:snips_trigger_key_backwards='<Ctrl-B>'
let g:UltiSnipsJumpBackwardTrigger='<c-l>'
" Défaut:
"   g:UltiSnipsExpandTrigger               <tab>
"   g:UltiSnipsListSnippets                <c-tab>
"   g:UltiSnipsJumpForwardTrigger          <c-j>
"   g:UltiSnipsJumpBackwardTrigger         <c-k>

""" super tab {{{1
let g:SuperTabDefaultCompletionType='context'
let g:SuperTabContextDefaultCompletionType='<c-p>'
let g:SuperTabLongestHighlight=1 "préselectionner le premier élément proposé
let g:SuperTabLongestEnhanced=1 "complete au maximum

""" syntastic {{{1
"ouvrir le fichier d'erreur automatiquement
"let g:syntastic_auto_loc_list=1
"marquer les erreurs avec sign
let g:syntastic_enable_signs=0
let g:syntastic_stl_format = ' [Syntax: %E{%ee}%B{/}%W{%ww} (l%F)]'

""" endwise {{{1
"otherwise it is mapped to Ctrl-O o
inoremap <M-o> <M-o>

""" scratch {{{1
let g:NotebookDir = expand('~/doc/vim/notebook')

""" vimwiki {{{1
let g:vimwiki_list = [{'path': '~/doc/vim/vimwiki/'}]

""" ruby {{{1
let ruby_minlines = 100
let ruby_operators = 1
let ruby_space_errors = 1

""" utl.vim {{{1
let g:utl_cfg_hdl_scm_http_system = "silent !firefox -remote 'ping()' && firefox -remote 'openURL( %u )' || firefox '%u#%f' &"
