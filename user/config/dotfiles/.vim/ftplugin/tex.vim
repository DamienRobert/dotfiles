"on ne veut pas que Alt + touche amène au menu
"set winaltkeys=no
"let g:Tex_UsePython=0
let g:tex_flavor = "pdflatex"

"je n'aime pas qu'il remplace ... par cdots ou ldots
"call IMAP('...', '...', 'tex')
"marche pas, il faut faire:
let g:Tex_SmartKeyDot=0
"je ne veux pas de smart backspace
let g:Tex_SmartKeyBS=0
" variables utiles pour désactier les macros:
"let g:Tex_EnvironmentMaps=0
let g:Tex_FontMaps=0
let g:Tex_SectionMaps=0

" je désactive des trucs imap pénibles
" appelé dans after/
"call IMAP('((', '((', 'tex')
"call IMAP('[[', '[[', 'tex')
"call IMAP('{{', '{{', 'tex')

" Si on veut tout désactiver
"let g:Imap_FreezeImap=1

"setlocal efm+=%E%f:%l:\ %m
setlocal iskeyword+=_,-,:,@-@,48-57
"/vim/syntax/tex.vim m'override ça, donc il faut configurer cette variable!
let g:tex_isk='_,-,:,48-57,a-z,A-Z,192-255'

setlocal spellfile=~/.vim/spell/latex.utf-8.add

"on remplace `  par ² dans les raccourcis
"meilleure idée: on fait un mapping
"let g:Tex_Leader = "²"
imap <buffer> ² `

"je veux du forward search
let g:Tex_UseEditorSettingInDVIViewer= 1

"je ne veux pas qu'il m'amène à la première erreur automatiquement
let g:Tex_GotoError=0

"reglage du fold
"let Tex_FoldedEnvironments="Th,Prop,Cor,Lemma,PU,Def,Rem,Ex,Rappel,Proof"
"let Tex_FoldedEnvironments="verbatim,comment,eq,gather,align,figure,table,thebibliography,keywords,abstract,titlepage"
let Tex_FoldedEnvironments="verbatim,comment,figure,table,thebibliography,keywords,abstract,titlepage,theorem,proposition,definition,remark,example,proof,lemma,algorithm,complexity,tikzpicture"
"let Tex_FoldedMisc="item,preamble,<<<,comments"
"let Tex_FoldedMisc="preamble,<<<"
let Tex_FoldedMisc="<<<"

"reglage du F7
let g:Tex_Com_pscal = "\\prodscal{<++>}{<++>}<++>"
let g:Tex_Com_verb = "\\verb@<++>@<++>"

"reglage du F5
"let g:Tex_Env_Proof = "%\<CR>\\begin{Proof}\<CR><++>\<CR>\\end{Proof}\<CR><++>"

"pour faire du forward-search dans le dvi
let g:Tex_CompileRule_dvi = 'latex --src-specials -interaction=nonstopmode $*'
"let g:Tex_ViewRule_dvi = "xdvi -editor \"gvim --servername LATEX --remote-silent +%l %f\""
let g:Tex_ViewRule_dvi = 'xdvi -editor "gvim --servername LATEX --remote-silent"'
"let g:Tex_CompileRule_pdf = 'pdflatex -file-line-error --src-specials -interaction=nonstopmode $*'
"let g:Tex_CompileRule_pdf = 'pdflatex -file-line-error --synctex=1 -interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'mylatexmk $*'
let g:Tex_ViewRule_pdf = 'okular'
"let g:Tex_ViewRuleComplete_pdf = 'silent! !okular --unique '.mainfnameRoot.'.pdf\#src:'.line('.').expand("%").' &'

let g:Tex_MultipleCompileFormats ="dvi,pdf"

" on fait du pdflatex
let g:Tex_DefaultTargetFormat="pdf"

"je (ne) veux (pas) qu'il me folde automatiquement mon texte
let g:Tex_AutoFolding = 1

"on remplace certains raccourcis
"item
imap <buffer> `A <Plug>Tex_InsertItemOnThisLine
"mathbf
imap <buffer> `B <Plug>Tex_MathBF
"mathcal ou cite
imap <buffer> `C <Plug>Tex_MathCal
"transform ( en \left(\right)<++>, sinon fait un label
imap <buffer> <F8> <Plug>Tex_LeftRight
imap <buffer> `` {}
imap <buffer> <C-l> <Plug>IMAP_JumpBack
imap <buffer> <C-j> <Plug>IMAP_JumpForward
"fermer les fenetres ouvertes par la compilation
"REM: raccourcis par défaut:
"F5 pour les environnements
"F7 pour les commandes
"F6 pour refresh folds "n'a pas l'air de trop marcher, de toute façon ,rf est là pour ça
"F9 pour la complétion

"je veux les menus en utf8
let g:Tex_UseUtfMenus=1
let g:Tex_NestPackagesMenu=0
"je regroupe tous les menus
let g:Tex_MenuPrefix='&LaTeX-Suite.'

syntax sync fromstart
"on finit les parenthèses
"(le noremap est important!!!!)
"il faudrait trouver un moyen pour bien positionner le curseur
"inoremap <buffer> $ $$<++>
"inoremap <buffer> ( ()<++>
"inoremap <buffer> { {}<++>
"

""""""""""""""""" new latex-suite forks """""""""""""""""
let g:Tex_EnvEndWithCR=1
let g:EnvLabelprefix_figure="fig:"
let g:EnvLabelprefix_table="tab:"
let g:EnvLabelprefix_theorem="thm:"
let g:EnvLabelprefix_definition="def:"
let g:EnvLabelprefix_lemma="lem:"
let g:EnvLabelprefix_proposition="prop:"
let g:EnvLabelprefix_corollary="cor:"
let g:EnvLabelprefix_assumption="ass:"
let g:EnvLabelprefix_remark="rem:"
let g:EnvLabelprefix_equation="eq:"
let g:EnvLabelprefix_eqnarray="eq:"
let g:EnvLabelprefix_aling="eq:"
let g:EnvLabelprefix_multline="eq:"
