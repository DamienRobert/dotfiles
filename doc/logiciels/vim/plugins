vim: foldmethod=expr ft=markdownlight

# Doc

- https://www.reddit.com/r/vim/comments/bfo6r1/finally_after_3_months_of_intense_vimscript/
  Sample vim config
- https://medium.freecodecamp.org/a-guide-to-modern-web-development-with-neo-vim-333f7efbf8e2
  Setting up Denite + CoC
- https://www.reddit.com/r/vim/comments/5lm3v3/creating_your_own_agvim_script/
  How to write a 'Ack' like plugin

# Plugins

## gui
neovim gui: nyaovim (npm: electron) https://github.com/rhysd/NyaoVim
gtk: http://www.wezm.net/technical/2017/12/a-killer-linux-gui-for-neovim-neovimgtk/ => https://github.com/daa84/neovim-gtk
https://github.com/dzhou121/gonvim (qt)
https://github.com/equalsraf/neovim-qt (qt, more active, in archlinux)
https://github.com/onivim/oni neovim IDE; replaced by oni2 [=neovim+vscode]
https://github.com/vhakulinen/gnvim GUI for neovim, without any web bloat (in rust)

## code
start:
- ervandew/supertab
  complétion avec Tab
  :SuperTabHelp
- SirVer/ultisnips
  snippets
  Mappings: <tab>, <ctrl-tab>, ^j, ^k
- tpope/vim-endwise
  complète les instructions en shell/ruby

## commands
start:
- chrisbra/NrrwRgn
  :NR (:NarrowRegion) copie la région dans un scratch pour que les edits 
  n'affectent pas le reste
  :NarrowRegion, :NarrowWindow, :WidenRegion, :NUD, :NRPrepare, :NRMulti
  :NR[No]SyncOnWrite, NRL
  Mapping: <Leader>nr
- vim-scripts/TextFormat
  justification du texte
  :AlignLeft, :AlignRight, :AlignCenter, :AlignJustify
  Maps: <Leader>al <Leader>ar <Leader>ac <Leader>aj
- ervandew/increment.vim--Avadhanula
  :Inc 3 pour incrémenter linéairement de 3
  :Inc :IncN :IncL (right align, no align, left align
- vim-scripts/searchfold.vim
  search and folds
  Mapping: <Leader>z, <Leader>Z, <Leader>iz
- drchip/swapstrings
  Swap two strings in a range area (TODO)
- godlygeek/tabular
  aligner des phrases
  :Tabularize /pattern/, :Tabularize /pattern/r2c0l2
  :AddTabularPattern, :AddTabularPipeline
  (some patterns are already addind in TabularMaps.vim, cf :Tabularize <tab>)
- vim-scripts/utl.vim
  liens hypertextes
  :Utl => pour lire un lien (web/mail/...)
  :Utl openLink/ol, :Utl copyLink/cl, :Utl copyFileName, cf
  Exemples of url:
    Fragments: <url:#r=here> => id=here, <url:#tn=some text> => search for 'some text' (defautl, ie '#some text' uses tn=), #line=10, #tp=some text
    url: <url:../file#tn=text>, www.vim.org, filename
    [10] footnotes
    scheme: vimhelp::, vimscript:: (or simply vimscript:)
- tpope/vim-abolish
  change la case des variables: case_snake, caseCaml... 
  Mapping: cr + c/m/_/s/u/U/-/k/./<space>/t
    c: camelCase m: MixedCase _,s: snake_case u: SNAKE_UPPERCASE -: dash-case
  Avec en plus :%Subvert/facilit{y,ies}/building{,s}/g
- tpope/vim-characterize
  In Vim, pressing ga on a character reveals its representation in decimal,
  octal, and hex. Characterize.vim modernizes this with the following
  additions: ©
  - Unicode character names: U+00A9 COPYRIGHT SYMBOL
  - Vim digraphs (type after <C-K> to insert the character): Co, cO
  - Emoji codes: :copyright:
  - HTML entities: &copy;
- Lokaltog/vim-easymotion
  <Leader><Leader>motion indique où aller
- michaeljsmith/vim-indent-object
  ai, ii, aI, iI  pour avoir des objets dépendants de l'indentation
  Ex: dai
- tpope/vim-repeat
  . répète l'action des plugins
- tpope/vim-scriptease
  A Vim plugin for Vim plugins (TODO)
- tpope/vim-speeddating
  Mappings: ^A et ^X pour incrémenter/décrémenter une date/heure
  d ^A, d ^X: insert utc time/local time. Ex: 09:08:16
  :SpeedDatingFormat pour la liste des formats supportés
- tpope/vim-surround
  actions to surround part of the text (TODO)
  Old text                  Command     New text ~
  "Hello *world!"           ds"         Hello world!
  [123+4*56]/2              cs])        (123+456)/2
  "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
  if *x>3 {                 ysW(        if ( x>3 ) {
  my $str = *whee!;         vlllls'     my $str = 'whee!';
- tpope/vim-unimpaired
  Already defined mappings: [,] + a A b B l L ^L q Q ^Q t T
    [a :previous| ]a :next| [A :first| ]A :last|
    [b :bprevious| ]b :bnext| [B :bfirst| ]B :blast|
    [l :lprevious| ]l :lnext| [L :lfirst| ]L :llast|
    [q :cprevious| ]q :cnext| [Q :cfirst| ]Q :clast|
    [t :tprevious| ]t :tnext| [T :tfirst| ]T :tlast|
  Next and previous: [,] + f n 
    [f, ]f: files dans l'ordre alphabétique du répertoire
    [n, ]n: previous/next SCM conflict or diff/patch hunk
  Line operations: [,] + <Space>, e
    [ , ] : rajouter des lignes blanches
    [e, ]e: échanger des lignes
  Option toggling: [,],= + ob, oc, od, oh, oi, ol, on, or, os, ou, ov, ow, ox
  Pasting: >,<,= + p,P
  Encoding: [,] + x, u, y (xml, url, c string)
    [x{motion} ]x{motion} XML encode/decode
    [u{motion} ]u{motion} URL encode/decode
    [y{motion} ]y{motion} C string encode/decode
- maxbrunsfeld/vim-yankstack
  more lightweight implementation of yankstack (TODO)
- drchip/visswap
  visual aread based swapping (TODO)
- drchip/zmaps: additional zmap for the cursor
  Shift text: z< z> zs z; ze
  Move cursor: z, z0 z$
  Put: zp zP

opts:
- drchip/math
  Add a math menu
  Keymap: set kmp=math
  :MathStart => In visual mode: ^ => superscript ᵃᵇ⁰¹², _ => subscript ₀₁₂, & => substitute αβψ
- wellle/targets.vim
  add more target to vim motion object (like daw...) (TODO)
- tpope/vim-pathogen
  Package helper. Faire :Helptags pour générer la doc des bundle
- justinmk/vim-sneak
  a light vim-easy-motion like (TODO)
- vim-scripts/TaskList.vim
  locate TODO and FIXME in file Note: might as well use :Ack
  " let g:tlTokenList = ["FIXME", "TODO", "XXX"]
  :TaskList
- drchip/WhereFrom
  Search the runtimepath to determine where a setting/function/... comes from
  :WhereFrom

## integrations
start:
- fzf.vim/
  [Default plugin native with fzf bin: :FZF)
  Files [PATH] 	Files (similar to :FZF)
  GFiles [OPTS] 	Git files (git ls-files)
  GFiles? 	Git files (git status)
  Buffers 	Open buffers
  Colors 	Color schemes
  Ag [PATTERN] 	ag search result (ALT-A to select all, ALT-D to deselect all)
  Rg [PATTERN] 	rg search result (ALT-A to select all, ALT-D to deselect all)
  Lines [QUERY] 	Lines in loaded buffers
  BLines [QUERY] 	Lines in the current buffer
  Tags [QUERY] 	Tags in the project (ctags -R)
  BTags [QUERY] 	Tags in the current buffer
  Marks 	Marks
  Windows 	Windows
  Locate PATTERN 	locate command output
  History 	v:oldfiles and open buffers
  History: 	Command history
  History/ 	Search history
  Snippets 	Snippets (UltiSnips)
  Commits 	Git commits (requires fugitive.vim)
  BCommits 	Git commits for the current buffer
  Commands 	Commands
  Maps 	Normal mode mappings
  Helptags 	Help tags 1
  Filetypes 	File types
  Most commands support CTRL-T / CTRL-X / CTRL-V key bindings to open in a new tab, a new split, or in a new vertical split
  Bang-versions of the commands (e.g. Ag!) will open fzf in fullscreen
  Note: I have `let g:fzf_command_prefix = 'Fzf'` so all commands start wit Fzf
- mileszs/ack.vim
  :Ack comme :grep (mais avec ack/ag/rg à la place)
  :Ack, :AckAdd, :AckFromSearch, :LAck, :LAckAdd
  :AckFile, :AckHelp, :LAckHelp, :AckWindow, :LAckWindow
  + add the following mappings to the q/l window (g:ack_mappings)
    ?                   display a quick summary of these mappings.
    o/O                 open file (same as Enter) / open file and close the quickfix window.
    go                  preview file (open but maintain focus on ack.vim results).
    t/T                 open in a new tab / open in new tab without moving to it.
    h/H                 open in horizontal split / horizontal split, keeping focus on the results.
    v/gv                open in vertical split / open in vertical split, keeping focus on the results.
    q                   close the quickfix window.
- w0rp/ale
  linters
  :ALEInfo, :ALELint, :ALEFix, :ALEFixSuggest,
  :ALEPrevious,Next,First,Last, :AleToggle,Enable,Disable,EnableBuffer
  :ALEDetail, :ALEReset
- gregsexton/gitv
  :Gitv Equivalent de gitk dans vim
- tpope/vim-eunuch
  des commandes shells
  :Delete, :Unlink, :Move, :Rename, :Chmod, :Mkdir, :Find, :Locate,
  :SudoEdit, :SudoWrite, :Wall
- tpope/vim-fugitive
  git commands in vim
  :Git, :Gcd, :Glcd, :Gstatus, :Gcommit, :Gmerge, :Gpull, :Gpush, :Gfetch
  :Gwrite, :Gwq, :Gdiff, :Gmove, :Gdelete, :Gremove, :Gblame,
  :Ggrep/:Glgrep, :Glog/:Gllog, :Gbrowse
  :Gedit/:Gsplit/:Gvsplit/:Gtabedit/:Gpedit/:Gread revision
  Maps: - c:^R^G  path to the current object
        - y^G     yank commit SHA and path to the current object
- tpope/vim-rhubarb
  GitHub extension for fugitive.vim
  (For :Gbrowse) + in commit messages, GitHub issues, issue URLs, and
  collaborators can be omni-completed (<C-X><C-O>)
- powerman/vim-plugin-viewdoc
  man, perl, help (TODO)

opt:
- ervandew/vcs
  vcs (git/hg)
  :Vcs*
- vim-scripts/vimwiki
  (TODO)
- vim-gnupg
  Déchiffre/Chiffre els fichiers gpg
  :GPGEditRecipients :GPGViewRecipients :GPGEditOptions :GPGViewOptions

## interface
start:
- vim-scripts/ZoomWin
  :ZoomWin => permet de dézoomer une fois que l'on a zoomé
  Mapping: ^W-o
- ervandew/maximize
  commande pour maximize/minimize une fenetre
  :MaximizeWindow, :MinimizeWindow, :MinimizeRestore
- scrooloose/nerdtree (TODO Stopped here)
  un explorateur de fichier
- majutsushi/tagbar
  tags on the source file
  :TagbarOpen/Toggle/OpenAutoClose/Close (TODO)
- mbbill/undotree
  A more modern version of gundo (which is unmaintened)
- jeetsukumaran/vim-buffergator
  explorateur des buffers
- vim-gutentags

opt:
- francoiscabrol/ranger.vim
  Ranger // open current file by default
  RangerCurrentFile // Default Ranger behaviour
  RangerCurrentDirectory
  RangerWorkingDirectory
- justinmk/vim-dirvish
  Minimalist "path navigator"
- chrisbra/Recover.vim
  A Plugin to show a diff, whenever recovering a buffer
  Looks super hacky => don't use it

## language
start:
- SyntaxRange
  define a syntax region
- ervandew/archive
  vim sait ouvrir des archives
- Shougo/context_filetype.vim
  To set up a filetype inside another
- drchip/libview.vba
  For editing *.a, *.o, *.so
- tpope/vim-afterimage
  édite les .png, .ico, .gif
- ap/vim-css-color
  voir les couleurs dans le css
- nelstrom/vim-markdown-folding
  Markdown section folding
- sheerun/vim-polyglot

opt:
- LaTeX-Box-Team/LaTeX-Box
  Light tex plugin
- vim-scripts/csv.vim
  plugin pour les csv
- gerw/vim-latex-suite
  fork de latex-suite qui ajoute plein de fonctionalités

## colorscheme

- vim-scripts/Festoon
- noahfrederick/Hemisu
- vim-scripts/Lucius
- vim-scripts/mayansmoke
- altercation/vim-colors-solarized
- chriskempson/base16-vim 
  Bae16 vim theme: https://github.com/chriskempson/base16
- lifepillar/vim-solarized8
  Optimized Solarized colorschemes. Best served with true-color terminals!

# Changed Plugins

- vimballs (  - :packadd vimball
  - let g:vimball_home=expand("~/.vim/vim-script/vimballs/name.vba")
    :so %
  - Directly:
    :UseVimball ~/.vim/vim-script/vimballs/name.vba

-> maths.vim: mettre les bindings sur xmap et pas vmap
-> visswap.vim: add ve+=onemore to have consistency in case of end line
   (j'ai mis ça sous git pour mieux controler)

- vim-latex-suite:
  chercher aux dans out/ (cf la branche aux)

# New plugins

List of plugins:
- https://vimawesome.com
- Minimal plugins: https://www.vi-improved.org/plugins/
- The Vim plugin shortlist:
  https://vim.zeef.com/andrew.krawchyk
  https://github.com/akrawchyk/awesome-vim
  https://statico.github.io/vim3.html
- http://spacevim.org/: collection of plugins (like oh-my-zsh)

Individual lists:
- Based on shougo/dein: https://github.com/rafi/vim-config
- Mai 2017: https://github.com/Genki-S/dotfiles/blob/master/vimfiles/vim/bundles.yml (cf plugins-example.yaml in ~vimscript:)
  - plugins-example.yaml:
  Imported from https://github.com/Genki-S/dotfiles/blob/master/vimfiles/vim/bundles.yml in 2014, the file has been updated since
  - plugins-example.readme: the corresponding readme of the github plugins
  referenced in plugins-example.yaml
- 2015: http://mixandgo.com/blog/vim-config-for-rails-ninjas

## Colorschemes:
http://www.vimninjas.com/2012/08/26/10-vim-color-schemes-you-need-to-own/
http://www.vimninjas.com/2012/09/14/10-light-colors/
https://news.ycombinator.com/item?id=9803168 -> http://vimcolors.com/

- https://github.com/morhetz/gruvbox
- https://github.com/icymind/NeoSolarized
  solarized with truecolor definition

- https://github.com/joelstrouts/swatch.vim
a tool for working with hexadecimal color codes and colorschemes in vim

## Code
Snippets:
+ [x] https://github.com/SirVer/ultisnips
+ [x] https://github.com/honza/vim-snippets
- https://github.com/Shougo/deoppet.nvim

Competion:
- https://github.com/Shougo/deoplete.nvim
- https://github.com/Valloric/YouCompleteMe
+ https://github.com/roxma/nvim-completion-manager
  Now https://github.com/ncm2/ncm2
- https://github.com/lifepillar/vim-mucomplete
- https://github.com/ajh17/VimCompletesMe
++ https://github.com/neoclide/coc.nvim
   Intellisense engine for vim8 & neovim, full language server protocol support as VSCode 

From the code:
- VimCompletesMe maps Tab to Indent/C-p and Shift-Tab to Unindent/C-n
  It detects if (via a regexp) if it should use Omni Complete or File
  Complete, and if the first tab yields nothing switch back to C-p/C-n.
  => really minimal, this is like supertab+"context" without configurability
- supertab: like vimcompletesme but much more flexible and a bit
  overengineered. The default completion type can be set to 'context' where
  supertab try to guess to use file/omni completion (like vimcompletesme
  but can be configured more precisely). Also can chain completions
  (without pressing tab again).
  Also, cf *supertab-longestenhanced*: has enhanced longest match support.
  Drawback: no autoloading
- vim-mucomplete: can pass a list of completion methods to try, return the
  first non empty. Has improved spell and file completion, support ultisnip,
  can run automatic word completion and when in a completion menu ^h/^j can
  switch back along the completion chain. Has no 'context' but i think this
  can be emulated with mucomplete#can_complete
  => Mapped to <Ctrl-Tab>, and then use <Ctrl-j> to change the completion
  method
  Note that the list of UltiSnips snippets is awailable on Ctrl-Tab, but
  this only works on a gui. But mucomplete can complete Ultisnips, so <C-g
  Tab> on a empty space works.

- https://github.com/reedes/vim-lexical
  Build on Vim’s spell/thes/dict completion

Comments:
+ https://github.com/tpope/vim-commentary
+ https://github.com/tomtom/tcomment_vim
  Comment. Both handles text objects. vim-commentary is more lightweight

+ https://github.com/nathanaelkane/vim-indent-guides
  A Vim plugin for visually displaying indent levels in code

Tagbar:
+ https://github.com/liuchengxu/vista.vim
  View and search LSP symbols, tags in Vim/NeoVim.

## Commands
+ https://github.com/kana/vim-textobj-user
  Create your own text objects
+ https://github.com/tommcdo/vim-lion
  A simple alignment operator for Vim text editor
+ https://github.com/junegunn/vim-easy-align
  A Vim alignment plugin
  (more powerfull than lion)
+ https://github.com/machakann/vim-sandwich
  The set of operator and textobject plugins to search/select/edit sandwiched textobjects.
  => To replace vim-surround
+ https://github.com/nishigori/increment-activator
  Enhance to increment candidates U have defined

- https://github.com/lambdalisue/gina.vim
Asynchronously control git repositories in Neovim/Vim 8 http://www.vim.org/scripts/script.php…

## Interface

+ https://github.com/tpope/vim-rsi
  emacs like bindings in vim
+ https://github.com/farmergreg/vim-lastplace
  Intelligently reopen files at your last edit position
+ https://github.com/vim-airline/vim-airline
  lean & mean status/tabline for vim that's light as air
  https://github.com/powerline/fonts
+ https://github.com/romainl/vim-qf
  Tame the quickfix window
+ https://github.com/romainl/vim-qlist
  Persist the results of :ilist and related commands via the quickfix list.
+ https://github.com/haya14busa/incsearch.vim
  Improved incremental searching for Vim
+ https://github.com/moll/vim-bbye
  Delete buffers and close files in Vim without closing your windows or
  messing up your layout. Like Bclose.vim, but rewritten and well
  maintained.
- https://github.com/Olical/vim-enmasse
  Edit every line in a quickfix list at the same time
- https://github.com/tomtom/ttags_vim
  Tag list browser for VIM (List, filter, preview, jump to tags)
+ https://github.com/xtal8/traces.vim
  Range and pattern preview for Command-line mode
+ https://github.com/terryma/vim-expand-region
  Vim plugin that allows you to visually select increasingly larger
  regions of text using the same key combination.
+ https://github.com/pseewald/vim-anyfold
  Vim plugin for indent based folding and motion for any filetypes.
+ https://github.com/arecarn/vim-fold-cycle
  This plugin provides the ability to cycle open and closed folds and
  nested folds
- https://github.com/junegunn/vim-peekaboo
  Peekaboo extends " and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers.
+ https://github.com/alok/notational-fzf-vim
  https://news.ycombinator.com/item?id=20049075
  Uses rg+fzf for quick notes taking in vim
- https://github.com/m00qek/nvim-contabs
  contextual tabs for vim/neovim

## Integrations
Plugins:
+ https://github.com/junegunn/vim-plug
  Minimalist Vim Plugin Manager (with On-demand loading)
- https://github.com/Shougo/dein.vim

Filesystem:
- https://github.com/tpope/vim-vinegar
  netrw improvements

Git:
+ https://github.com/airblade/vim-gitgutter
  A Vim plugin which shows a git diff in the 'gutter' (sign column). It shows whether each line has been added, modified, and where lines have been removed. You can also stage and revert individual hunks.
- https://github.com/jreybert/vimagit
  Ease your git workflow within Vim

Tmux:
+ https://github.com/benmills/vimux
  vim plugin to interact with tmux
+ https://github.com/christoomey/vim-tmux-runner
  A simple, vimscript only, command runner for sending commands from vim to tmux.
- https://github.com/jgdavey/vim-turbux
  Turbo Ruby testing with tmux

+ https://www.reddit.com/r/neovim/comments/c1yhpv/introducing_neomux_a_neovim_terminal_integration/
https://github.com/nikvdp/neomux

Shell:
+ https://github.com/duggiefresh/vim-easydir
  A simple way to create, edit and save files and parent directories
+ https://github.com/kassio/neoterm
  Wrapper of some neovim's :terminal functions.
+ https://github.com/Shougo/deol.nvim
  Dark powered shell interface for NeoVim and Vim8.
- https://github.com/baruchel/vim-notebook
  a plugin for Vim for handling any interpreter in a notebook with evaluatable cells style.

Misc:
- https://github.com/sgur/vim-editorconfig
  Yet another EditorConfig (http://editorconfig.org) plugin for vim written in vimscript only

+ https://github.com/skywind3000/asyncrun.vim
  Run Async Shell Commands in Vim 8.0 / NeoVim and Output to Quickfix Window
  (modern version of tpope/vim-dispatch)
- https://github.com/hauleth/asyncdo.vim
  Minimalist version

## Language
Not in vim-polyglot
+ https://github.com/tpope/vim-rake
Rake.vim is a plugin leveraging projectionist.vim to enable you to use all those parts of rails.vim that you wish you could use on your other Ruby projects, including :A, :Elib and friends, and of course :Rake. It's great when paired with gem open and bundle open and complemented nicely by bundler.vim.
- https://github.com/tpope/vim-rails
- https://github.com/tpope/vim-bundler
  This is a lightweight bag of Vim goodies for Bundler, best accompanied by rake.vim and/or rails.vim.

! https://github.com/lervag/vimtex

  A modern vim plugin for editing LaTeX files. (contains LatexBox)
  - Text objects: `id` `ad` Delimiters, `ie` `ae` LaTeX environments, `i$` `a$` Inline math structures, `iP` `aP` Sections
  - Delete/Change surrounding: dsc, dse, ds$, dsd; csc, cse, cs$, csd
  - Toggle starred command/environment/delim: tsc, tse, tsd/tsD
  - new command: F7, close command: ]]
  - Motions: section boundaries with `[[`, `[]`, `][`, and `]]`
             environment boundaries with `[m`, `[M`, `]m`, and `]M`
             comment boundaries with `[*` and `]*`
             matching delimiters with `%`
  - normal bindings
   \li  vimtex-info \lI  vimtex-info-full
   \lt  vimtex-toc-open \lT  vimtex-toc-toggle
   \lq  vimtex-log
   \lv  vimtex-view
   \lr  vimtex-reverse-search
   \ll  vimtex-compile \lL  vimtex-compile-selected
   \lk  vimtex-stop \lK  vimtex-stop-all
   \le  vimtex-errors \lo  vimtex-compile-output
   \lg  vimtex-status \lG  vimtex-status-all
   \lc  vimtex-clean \lC  vimtex-clean-full
   \lm  vimtex-imaps-list
   \lx  vimtex-reload \lX  vimtex-reload-state
   \ls  vimtex-toggle-main
   K    vimtex-doc-package

## Shougo
https://github.com/Shougo?tab=repositories
neovim plugins: dein (plugin manager), deoppet (snippets), deoplete (completion), deol (shell), neoyank
+ https://github.com/Shougo/denite.nvim
  Unite users interfaces
  => todo: look also at fzf https://github.com/junegunn/fzf
     which is a command line fuzzy finder with a vim plugin
     => replace percol?
- https://github.com/Shougo/junkfile.vim
  Create temporary file for memo, testing, ...
+ https://github.com/Shougo/neoyank.vim
  Saves yank history includes unite.vim history/yank source.

## haya14busa
https://docs.google.com/presentation/d/14pViuMI_X_PiNwQD8nuGRG72GUqSeKDqoJqjAZWS39U/edit#slide=id.p
- vim-easymotion 
- incsearch.vim (integrated into vim 8, cf is.vim)
+ vim-asterisk
? vim-operator-flashy 
? vim-easyoperator-phrase

# Old plugins

List of plugins I removed from dist/@vim:

Kwbd.vim/config:	url = https://github.com/rgarver/Kwbd.vim.git
atp_vim/config:	url = https://github.com/coot/atp_vim.git
gnupg.vim/config:	url = https://github.com/vim-scripts/gnupg.vim.git
gundo.vim/config:	url = https://github.com/sjl/gundo.vim.git
html5.vim/config:	url = https://github.com/othree/html5.vim.git
junkfile.vim/config:	url = https://github.com/Shougo/junkfile.vim.git
neobundle.vim/config:	url = https://github.com/Shougo/neobundle.vim
neocomplete.vim/config:	url = https://github.com/Shougo/neocomplete.vim
nerdcommenter/config:	url = https://github.com/scrooloose/nerdcommenter.git
neobundle-vim-recipes/config:	url = https://github.com/Shougo/neobundle-vim-recipes
omlet.vim/config:	url = https://github.com/vim-scripts/omlet.vim.git
screen/config:	url = https://github.com/ervandew/screen.git
syntastic/config:	url = https://github.com/scrooloose/syntastic.git
vim-airline/config:	url = https://github.com/vim-airline/vim-airline
vim-bundler/config:	url = https://github.com/tpope/vim-bundler
unite.vim/config:	url = https://github.com/Shougo/unite.vim
vim-conque/config:	url = https://github.com/trammell/vim-conque.git
vim-git/config:	url = https://github.com/tpope/vim-git.git
vim-javascript/config:	url = https://github.com/pangloss/vim-javascript.git
vim-markdown/config:	url = https://github.com/tpope/vim-markdown.git
vim-plug/config:	url = https://github.com/junegunn/vim-plug
vim-rake/config:	url = https://github.com/tpope/vim-rake
vim-rails/config:	url = https://github.com/tpope/vim-rails
vim-ruby/config:	url = https://github.com/vim-ruby/vim-ruby.git
vim-space/config:	url = https://github.com/scrooloose/vim-space.git
vimfiler.vim/config:	url = https://github.com/Shougo/vimfiler.vim
vimshell.vim/config:	url = https://github.com/Shougo/vimshell.vim
xml.vim/config:	url = https://github.com/vim-scripts/xml.vim.git

## Manpageview: Manpageview tar.i to get info file
Viewdoc: Viewdoc itemize to get latex help (if ft=tex)

## taglisttoo
  :TlistToo "pour la liste des tags

## Bufexplorer:
   To start exploring in the current window, use: >
   \be   or   :BufExplorer
  To start exploring in a newly split horizontal window, use: >
   \bs   or   :BufExplorerHorizontalSplit
  To start exploring in a newly split vertical window, use: >
   \bv   or   :BufExplorerVerticalSplit

## closetag
  ctrl-_ pour fermer un tag html

## Info:
  :Info libc

## xml.vim:
  - <tag> rajoute </tag>
  - <tag>> pour formater verticalement
  - tag;; devient <tag>
  - [] pour se déplacer
  - \c pour renomer un tag, \C pour en plus enlever les attributs
  - \d pour enlever le surrounding tag, \D pour enlever son contenu
  - \e pour fermer un tag, \s pour ouvrir un tag fermé
  - \f pour folder le tag couurant, \F pour folder tous les tags du même nom
  - \g, \G pour formatter le tag, \I tout reformatter
  - \< \> pour shifter les tags
  - \j join tags
  - \o, \O pour insérer des tags (internes avec \o, externes avec \O)
  - \[,\],\{,\} pour supprimer les cddata/commentaires delimiters/sections
  - visual \<, \c pour placer un comment/cddata autour
           \v placer un tag autour, \5 étendre la selection au matching tag

## ervandew:
diff.vim: meilleure gestion des diffs
  appeler :DiffNextChange et :DiffPrevChange plutôt que ]c [c pour avoir un
  diff par colonne et ne pas sauter des groupements de diff
notebook.vim :Notebook ploum pour gérer des notes
scratch.vim :Scratch buffer
help.vim: Enter et Backspace pour naviguer dans les fichiers help de vim
