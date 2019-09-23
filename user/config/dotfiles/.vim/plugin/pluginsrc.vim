" vim: foldmethod=marker

" Optional packages {{{1
" Recall to activate all optional plugins that C-A inserts all completion (remapped to C-B in my .vimrc)
" :packadd TAB <C-B>

command -bar Helptags :packadd! vim-pathogen | call pathogen#helptags()
call Lazy({'name': 'WhereFrom', 'cmd': 'WhereFrom'})
call Lazy({'name': 'TaskList.vim', 'cmd': 'TaskList'})
call Lazy({'name': 'searchfold.vim', 'map': ['<Leader>z', '<Leader>iz']})
call Lazy({'name': 'vim-gnupg', 'read': '*.\(gpg\|asc\|pgp\)'})

" Commands for functions in autoload/my.vim {{{1
" http://vim.wikia.com/wiki/Capture_ex_command_output
command! -nargs=+ -complete=command GetCommand call my#GetCommandOutputInTab(<q-args>)

""" code/start/vim-indent-guides {{{1
let g:indent_guides_enable_on_vim_startup = 1 "default: 0
let g:indent_guides_auto_colors = 0 "default: 1
" let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 5 "default: 10 (for auto colors)

""" code/start/ultisnips  {{{1
let g:snips_author = "Damien Robert"
let g:snips_email = "damien.olivier.robert@gmail.com"
let g:snips_github = "https://github.com/DamienRobert"

let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
" Number of tabstops :py3 print(UltiSnips_Manager._cs._tabstops)
" Current tabstop: print(UltiSnips_Manager._cs._cts)
" I patched UltiSnips to get the status in `UltiSnipsStatus`
"" fun! UltiSnipsInfo() 
""   exec g:_uspy "UltiSnips_Manager._cs is not None and print(str(UltiSnips_Manager._cs.snippet._trigger)+\": \"+str(UltiSnips_Manager._cs._cts)+\" / \"+str(len(UltiSnips_Manager._cs._tabstops.keys())))"
"" endf

" let g:UltiSnipsJumpBackwardTrigger='<c-k>'
" Défaut:
"   g:UltiSnipsExpandTrigger               <tab>
"   g:UltiSnipsListSnippets                <c-tab>
"   g:UltiSnipsJumpForwardTrigger          <c-j>
"   g:UltiSnipsJumpBackwardTrigger         <c-k>

""" code/start/supertab {{{1
let g:SuperTabDefaultCompletionType='context'
let g:SuperTabContextDefaultCompletionType='<c-p>'
let g:SuperTabLongestHighlight=1 "préselectionner le premier élément proposé
let g:SuperTabLongestEnhanced=1 "complete au maximum

" augroup MySupertab
"   autocmd!
"   autocmd FileType *
"     \ if &omnifunc != '' |
"     \   call SuperTabChain(&omnifunc, "<c-p>") |
"     \ endif
" augroup END

""" code/start/vim-mucomplete {{{1
imap <unique> <c-g><tab> <plug>(MUcompleteFwd)
imap <unique> <c-g><s-tab> <plug>(MUcompleteBwd)
let g:mucomplete#always_use_completeopt = 1 "we want the completion menu even when calling mucomplete manually
let g:mucomplete#empty_text = 1 "we want to complete on empty space
" "Default
"  let g:mucomplete#chains = {
"      \ 'default' : ['path', 'omni', 'keyn', 'dict', 'uspl'],
"      \ 'vim'     : ['path', 'cmd', 'keyn']
"      \ }
"
let g:mucomplete#chains = { 'default' : ['path', 'omni', 'keyp', 'dict', 'uspl', 'ulti'] }

""" commands/start/increment.vim--Avadhanula {{{1
"vnoremap <c-a> :Inc<CR>

""" commands/start/utl.vim {{{1
let g:utl_cfg_hdl_scm_http_system = "silent !firefox -remote 'ping()' && firefox -remote 'openURL( %u )' || firefox '%u#%f' &"

""" language/start/vim-markdown-folding {{{1
let g:markdown_fold_override_foldtext = 0
let g:markdown_fold_style = 'nested'

""" integrations/start/ack.vim {{{1
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""" integrations/start/vim-plugin-viewdoc {{{1
let g:no_viewdoc_abbrev=1
let g:ViewDoc_tex = 'ViewDoc_help_custom'

""" integrations/start/vim-fugitive {{{1
" .. pour revenir en arrière dans le Gedit
augroup myplugins
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

"autoclean fugitive buffers (looks to be done automatically now in newer "version)
"autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

""" integrations/opt/vimwiki {{{1
let g:vimwiki_list = [{'path': '~/doc/vim/vimwiki/'}]

""" integrations/start/fzf {{{1
let g:fzf_command_prefix = 'Fzf'

""" interface/start/nerdtree {{{1
nmap <Leader>nT :NERDTreeToggle<CR>
nmap <Leader>nM :NERDTreeMirror<CR>
nmap <Leader>nt :NERDTree
let NERDTreeIgnore=['\~$', '\.aux', '\.bak', '\.bbl', '\.blg', '\.glg', '\.glo', '\.gls', '\.log', '\.out', '\.thm', '\.toc', '\.xdy']
let NERDTreeSortOrder=['\/$', '*', '\.swp$', '\.orig$', '\.bak$', '\~$']

""" interface/start/ZoomWin {{{1
"the key, oft, sn, tx options are removed in neovim
let g:zoomwin_localoptlist   = ["ai","ar","bh","bin","bl","bomb","bt","cfu","ci","cin", "cink","cino","cinw","cms","com","cpt","diff","efm","eol","ep","et","fenc","fex" ,"ff","flp","fo","ft","gp","imi","ims","inde","inex","indk","inf","isk", "kmp","lisp","mps","ml","ma","mod","nf","ofu","pi","qe","ro","sw","si", "sts","spc","spf","spl","sua","swf","smc","syn","ts","tw","udf","wfh","wfw" ,"wm"]
""" vim-ruby {{{1
"let ruby_minlines = 500 "this is already the default value
let ruby_operators = 1
"let ruby_space_errors = 1 "I already highlight tabs and trailing spaces
"let ruby_fold=1 "too much folding. Use set foldmethod=syntax to enable locally

""" gutentags {{{1
let g:gutentags_file_list_command = {
  \ 'markers': {
    \ '.git': 'git ls-files',
    \ '.hg': 'hg files',
    \ },
  \ }
let g:gutentags_ctags_tagfile = ".tags"
" puts '.notags' in dir to desactivate
" Use `ctags -o .tags $(git ls)` to generate punctually

""" yankstack {{{1
if exists("*yankstack#setup")
  call yankstack#setup() "à appeler avant toute map utilisant yank
endif

""" interface/start/ale {{{1
let g:ale_set_signs=0

nnoremap <unique> <leader>ta :call my#AleToggleSign()<cr>
let g:ale_fixers = {
  \ 'ruby': ['rubocop']
\}

let g:ale_sign_error='⛔'
let g:ale_sign_warning='⚠'
let g:ale_sign_style_error='⚡'
let g:ale_sign_style_warning='☂'

""" interface/ranger.vim {{{1
let g:ranger_map_keys = 0
