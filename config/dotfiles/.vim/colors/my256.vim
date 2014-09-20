" hemisu.vim - Vim color scheme
" ----------------------------------------------------------
" Author:	Noah Frederick (http://noahfrederick.com/)
"    + Customisations by Damien Robert
" Version:	3.4
" License:	Creative Commons Attribution-NonCommercial
" 			3.0 Unported License       (see README.md)
" ----------------------------------------------------------

" Setup ----------------------------------------------------{{{
" Reset syntax highlighting
hi clear
if exists("syntax_on")
	syntax reset
endif

" Declare theme name
let g:colors_name="my256"

"}}}
" The Colors -----------------------------------------------{{{
" Define reusable colors
let s:lemon=           { "gui": "#FFFFD7", "cterm": "230"  }
let s:lemonfaint=      { "gui": "#DFDFAF", "cterm": "187"  }

let s:black=           { "gui": "#000000", "cterm": "16"  }
let s:almostBlack=     { "gui": "#121212", "cterm": "233" }
let s:darkGrey=        { "gui": "#444444", "cterm": "238" }
let s:middleDarkGrey=  { "gui": "#767676", "cterm": "243" }
let s:middleLightGrey= { "gui": "#949494", "cterm": "246" }
let s:lightGrey=       { "gui": "#BCBCBC", "cterm": "250" }
let s:almostWhite=     { "gui": "#EEEEEE", "cterm": "255" }
let s:white=           { "gui": "#FFFFFF", "cterm": "231" }

let s:darkPink=        { "gui": "#870000", "cterm": "88"  }
let s:middleDarkPink=  { "gui": "#FF005F", "cterm": "197" }
let s:middleLightPink= { "gui": "#D75F5F", "cterm": "167" }
let s:lightPink=       { "gui": "#FFAFAF", "cterm": "217" }

let s:darkBlue=        { "gui": "#00005F", "cterm": "17"  }
let s:middleDarkBlue=  { "gui": "#005F87", "cterm": "24"  }
let s:middleLightBlue= { "gui": "#87dfdf", "cterm": "116" }
let s:lightBlue=       { "gui": "#afffdf", "cterm": "158" }

let s:darkGreen=       { "gui": "#5F5F00", "cterm": "58"  }
let s:middleDarkGreen= { "gui": "#5F8700", "cterm": "64"  }
let s:middleLightGreen={ "gui": "#AFD75F", "cterm": "149" }
let s:lightGreen=      { "gui": "#AFFFAF", "cterm": "157" }

let s:darkYellow=       { "gui": "#D78700", "cterm": "172" }
let s:middleDarkYellow= { "gui": "#D7D700", "cterm": "184" }
let s:middleLightYellow={ "gui": "#D7D7AF", "cterm": "187" }
let s:lightYellow=      { "gui": "#FFFF00", "cterm": "226" }

let s:darkTan=         { "gui": "#5F0000", "cterm": "52"  }
let s:middleDarkTan=   { "gui": "#87005F", "cterm": "89"  }
let s:middleLightTan=  { "gui": "#D700D7", "cterm": "164" }
let s:lightTan=        { "gui": "#FFAFD7", "cterm": "218" }
let s:violet=          { "gui": "#AF0087", "cterm": "126" }

" Assign to semantic categories based on background color
if &g:background=="dark"
	" Dark theme
	let s:bg=s:black
	let s:norm=s:almostWhite
	let s:almostnorm=s:lightGrey
	let s:dimmed=s:middleLightGrey
	let s:comment=s:middleDarkGrey
	let s:subtle=s:darkGrey
	let s:faint=s:almostBlack
	let s:normRed=s:middleLightPink
	let s:normGreen=s:middleLightGreen
	let s:normBlue=s:middleLightBlue
	let s:normYellow=s:middleLightYellow
	let s:normTan=s:middleLightTan
	let s:faintRed=s:darkPink
	let s:faintGreen=s:darkGreen
	let s:faintBlue=s:darkBlue
	let s:faintYellow=s:darkYellow
	let s:faintTan=s:darkTan
	let s:strongRed=s:lightPink
	let s:strongGreen=s:lightGreen
	let s:strongBlue=s:lightBlue
	let s:strongYellow=s:lightYellow
	let s:strongTan=s:lightTan
else
	" Light theme
	let s:bg=s:lemon
	let s:norm=s:almostBlack
	let s:almostnorm=s:darkGrey
	let s:dimmed=s:middleDarkGrey
	let s:comment=s:middleLightGrey
	let s:subtle=s:lightGrey
	let s:faint=s:almostWhite
	let s:normRed=s:middleDarkPink
	let s:normGreen=s:middleDarkGreen
	let s:normBlue=s:middleDarkBlue
	let s:normYellow=s:middleDarkYellow
	let s:normTan=s:middleDarkTan
	let s:faintRed=s:lightPink
	let s:faintGreen=s:lightGreen
	let s:faintBlue=s:lightBlue
	let s:faintYellow=s:lightYellow
	let s:faintTan=s:lightTan
	let s:strongRed=s:darkPink
	let s:strongGreen=s:darkGreen
	let s:strongBlue=s:darkBlue
	let s:strongYellow=s:darkYellow
	let s:strongTan=s:darkTan
endif

"}}}
" Utilility Function ---------------------------------------{{{
function! s:h(group, style)
	execute "highlight" a:group
		\ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
		\ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
		\ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
		\ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
		\ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
		\ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
		\ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

"}}}
" Highlights - Vim >= 7 ------------------------------------{{{
if version >= 700
	call s:h("CursorLine",  { "bg": s:faint })
	""call s:h("MatchParen",  { "fg": s:normBlue, "bg": s:faintRed, "gui": "bold" })
	call s:h("MatchParen",  { "fg": s:normBlue, "bg": s:faint, "gui": "bold" , "cterm": "bold" })
	call s:h("Pmenu",       { "bg": s:faint })
	call s:h("PmenuThumb",  { "bg": s:norm })
	call s:h("PmenuSBar",   { "bg": s:subtle })
	call s:h("PmenuSel",    { "bg": s:faintBlue })
	call s:h("ColorColumn", { "bg": s:faintRed })
	call s:h("SpellBad",    { "sp": s:normRed, "gui": "undercurl", "cterm": "undercurl" })
	call s:h("SpellCap",    { "sp": s:normBlue, "gui": "undercurl", "cterm": "undercurl" })
	call s:h("SpellRare",   { "sp": s:strongRed, "gui": "undercurl", "cterm": "undercurl" })
	call s:h("SpellLocal",  { "sp": s:normGreen, "gui": "undercurl", "cterm": "undercurl" })
	hi! link CursorColumn	CursorLine
endif

"}}}
" Highlights - UI ------------------------------------------{{{
call s:h("Normal",       { "fg": s:norm, "bg": s:bg })
call s:h("NonText",      { "fg": s:subtle })
hi! link SpecialKey	NonText

call s:h("Cursor",       { "fg": s:bg, "bg": s:normRed })
call s:h("CursorIM",       { "fg": s:bg, "bg": s:normTan })

call s:h("Visual",       { "bg": s:faintBlue })
call s:h("IncSearch",    { "bg": s:faintBlue })
call s:h("Search",       { "fg": s:faint, "bg": s:normBlue })

call s:h("StatusLine",   { "fg": s:faint, "bg": s:normBlue, "gui": "bold,italic", "cterm": "bold" })
call s:h("StatusLineNC", { "fg": s:almostnorm, "bg": s:faint })

call s:h("VertSplit",    { "fg": s:faint, "bg": s:faint })
call s:h("TabLine",      { "fg": s:dimmed, "bg": s:faint })
call s:h("TabLineSel",   { "gui": "bold", "cterm": "bold" })

call s:h("Folded",       { "fg": s:comment, "bg": s:faint })
call s:h("Directory",    { "fg": s:normBlue })
call s:h("Title",        { "fg": s:strongRed, "gui": "bold", "cterm": "bold" })
hi! link MoreMsg	Title
hi! link Question	MoreMsg
hi! link ModeMsg	MoreMsg

call s:h("ErrorMsg",     { "bg": s:faintRed })
call s:h("WarningMsg",   { "bg": s:faintTan })

call s:h("DiffAdd",      { "bg": s:faintGreen })
call s:h("DiffChange",   { "bg": s:faintRed })
call s:h("DiffDelete",   { "fg": s:normRed, "bg": s:faintRed })
call s:h("DiffText",     { "bg": s:faintRed, "gui": "bold", "cterm": "bold" })

call s:h("User1",        { "fg": s:bg, "bg": s:normGreen })
call s:h("User2",        { "fg": s:bg, "bg": s:normRed })
call s:h("User3",        { "fg": s:bg, "bg": s:normBlue })

hi! link WildMenu	IncSearch
call s:h("LineNr",      { "fg": s:almostnorm, "bg": s:lemonfaint })
call s:h("CursorLineNr", { "fg": s:strongYellow, "bg": s:lemonfaint })

hi! link SignColumn	LineNr
hi! link FoldColumn	LineNr
hi! link TabLineFill	StatusLineNC

"}}}
" Highlights - Generic Syntax ------------------------------{{{
call s:h("Comment",    { "fg": s:comment, "gui": "italic" })

call s:h("Constant",     { "fg": s:strongBlue })
call s:h("String",     { "fg": s:normGreen })
call s:h("Character",     { "fg": s:normGreen })

call s:h("Function",   { "gui": "bold", "cterm": "bold" })
call s:h("Identifier",   { "fg": s:dimmed, "gui": "bold", "cterm": "bold" })

call s:h("Statement",       { "fg": s:normRed })
call s:h("Keyword",    { "fg": s:normRed, "gui": "bold", "cterm": "bold" })

call s:h("Preproc",    { "fg": s:strongGreen })
call s:h("Include",    { "fg": s:strongGreen, "gui": "bold", "cterm": "bold" })
hi! link Define		Include
hi! link Macro		Include
hi! link PreCondit	Include

call s:h("Type",       { "fg": s:strongRed })
call s:h("Typedef",    { "fg": s:strongRed, "gui": "bold", "cterm": "bold" })

call s:h("Special",    { "fg": s:normBlue })
call s:h("Tag",    { "fg": s:normBlue, "gui": "bold", "cterm": "bold"})
call s:h("SpecialChar",    { "fg": s:normGreen, "gui": "bold", "cterm": "bold" })
call s:h("SpecialComment",    { "fg": s:comment, "gui": "bold,italic", "cterm": "bold" })
call s:h("Delimiter",  { "fg": s:dimmed })
call s:h("Debug",    { "fg": s:normTan })

call s:h("Underlined", { "fg": s:normBlue, "gui": "underline", "cterm": "underline" })
hi! link Error		ErrorMsg
call s:h("Todo",       { "fg": s:strongTan, "gui": "bold", "cterm": "bold" })
"}}}
" Highlights - HTML ----------------------------------------{{{
" Was Function
hi! link htmlTag     Type
" Was Identifier
hi! link htmlEndTag  htmlTag
" Was hi def htmlItalic  term=italic cterm=italic gui=italic
" But in most terminal italic is rendered by reverse color, which is ugly
" so i use bold instead
hi! def htmlItalic  term=bold cterm=bold gui=italic
"}}}
" Highlights - XML ----------------------------------------{{{
" Was function
hi! link xmlTagName  Statement
" Was Identifier
" Unfortunately xmlEndTag is also for xmlEndTagName, so I can't put the <>
" in a different color as for html
hi! link xmlEndTag  xmlTagName
" Was function
hi! link xmlTag     xmlTagName
"}}}
" Highlights - CSS -----------------------------------------{{{
" was Function
hi! link cssBraces	Delimiter
" was Function
hi! link cssClassName	Statement
" is Special
"hi! link cssSelectorOp	Delimiter
"}}}
" Highlights - Shell ---------------------------------------{{{
" shOperator is Operator
"hi! link shOperator	Delimiter
" was shconditional -> Conditional
hi! link shCaseBar	Delimiter
"}}}
" Highlights - JavaScript ----------------------------------{{{
" was nothing
hi! link javaScriptValue	Constant
"was keyword
hi! link javaScriptNull		Constant 
"was function
hi! link javaScriptBraces	Delimiter
"}}}
" Highlights - Tex ----------------------------------------{{{
" Was hi texItalBoldStyle		gui=bold,italic cterm=bold,italic
" But in most terminal italic is rendered by reverse color, which is ugly
" so i use bold instead
hi! def texItalBoldStyle  gui=bold,italic cterm=bold
"}}}
" Highlights - Help ----------------------------------------{{{
" Was Statement
hi! link helpSectionNmbr     Typedef
" Was Comment
hi! link helpExample   String
" Was Statement
hi! link helpExampleItem       Typedef
" Was Statement
hi! link helpHeadline  Title
" Was Preproc
hi! link helpSectionDelim      Comment
" Was String
hi! link helpHyperTextEntry    Statement
" Was Subtitle -> Identifier
hi! link helpHyperTextJump     Tag
" Was String
hi! link helpURL       Underlined
"}}}
" Highlights - Gitcommit ----------------------------------{{{
" was Keyword
hi! link gitcommitSummary       Define
" }}}
" Highlights - NERDTree ----------------------------------{{{
" was Include
hi! link NERDTreeLink       Preproc
" }}}
" Highlights - Gundo ----------------------------------{{{
" was Special
hi! link diffRemoved       DiffDelete
" was empty
hi! link diffAdded       DiffAdd
" }}}
" Highlights - Ruby ----------------------------------{{{
"was Constant
hi! link rubyPseudoVariable       Identifier
"was Statement
hi! link rubyBeginEnd		PreProc
"was Statement
hi! link rubyAccess		PreProc
"was Statement
hi! link rubyAttribute		PreProc
"was Statement
hi! link rubyEval		PreProc
"was Special
hi! link rubyStringEscape	SpecialChar
"}}}

" vim: fdm=marker
