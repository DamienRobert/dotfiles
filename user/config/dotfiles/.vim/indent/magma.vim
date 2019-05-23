"------------------------------------------------------------------------------
"  Description: Vim Magma indent file copié de la version ada
"    Help Page: ft-vim-indent
"------------------------------------------------------------------------------

" Only load this indent file when no other was loaded.
if exists("b:did_indent") || version < 700
   finish
endif

let b:did_indent = 45
let g:magma#Comment= "^\/\/.*"

setlocal indentexpr=GetMagmaIndent()
setlocal indentkeys-=0{,0}
setlocal indentkeys+=0=~then,0=~end,0=~elif,0=~when,0=~exception,0=~begin,0=~is,0=~record,0=~try,0=~catch

" Only define the functions once.
if exists("*GetMagmaIndent")
   finish
endif

let s:MagmaBlockStart = '^\s*\(if\>\|while\>\|repeat\>\|until\>\|else\>\|elif\>\|do\>\|for\>.*\<do\>\|intrinsic\>\|procedure\>\|function\>\|then\>\|case\>\|when\>\|try\>\|catch\>\)'

" Section: s:MainBlockIndent {{{1
"
" Try to find indent of the block we're in
" prev_indent = the previous line's indent
" prev_lnum   = previous line (to start looking on)
" blockstart  = expr. that indicates a possible start of this block
" stop_at     = if non-null, if a matching line is found, gives up!
" No recursive previous block analysis: simply look for a valid line
" with a lesser or equal indent than we currently (on prev_lnum) have.
" This shouldn't work as well as it appears to with lines that are currently
" nowhere near the correct indent (e.g., start of line)!
" Seems to work OK as it 'starts' with the indent of the /previous/ line.
function s:MainBlockIndent (prev_indent, prev_lnum, blockstart, stop_at)
   let lnum = a:prev_lnum
   let line = substitute( getline(lnum), g:magma#Comment, '', '' )
   while lnum > 1
      if a:stop_at != ''  &&  line =~ '^\s*' . a:stop_at  &&  indent(lnum) < a:prev_indent
	 return a:prev_indent
      elseif line =~ '^\s*' . a:blockstart
	 let ind = indent(lnum)
	 if ind < a:prev_indent
	    return ind
	 endif
      endif

      let lnum = prevnonblank(lnum - 1)
      " Get previous non-blank/non-comment-only line
      while 1
	 let line = substitute( getline(lnum), g:magma#Comment, '', '' )
	 if line !~ '^\s*$'
	    break
	 endif
	 let lnum = prevnonblank(lnum - 1)
	 if lnum <= 0
	    return a:prev_indent
	 endif
      endwhile
   endwhile
   " Fallback - just move back one
   return a:prev_indent - &sw
endfunction MainBlockIndent

" Section: s:EndBlockIndent {{{1
"
" Try to find indent of the block we're in (and about to complete),
" including handling of nested blocks. Works on the 'end' of a block.
" prev_indent = the previous line's indent
" prev_lnum   = previous line (to start looking on)
" blockstart  = expr. that indicates a possible start of this block
" blockend    = expr. that indicates a possible end of this block
function s:EndBlockIndent( prev_indent, prev_lnum, blockstart, blockend )
   let lnum = a:prev_lnum
   let line = getline(lnum)
   let ends = 0
   while lnum > 1
      if getline(lnum) =~ '^\s*' . a:blockstart
	 let ind = indent(lnum)
	 if ends <= 0
	    if ind < a:prev_indent
	       return ind
	    endif
	 else
	    let ends = ends - 1
	 endif
      elseif getline(lnum) =~ '^\s*' . a:blockend
	 let ends = ends + 1
      endif

      let lnum = prevnonblank(lnum - 1)
      " Get previous non-blank/non-comment-only line
      while 1
	 let line = getline(lnum)
	 let line = substitute( line, g:magma#Comment, '', '' )
	 if line !~ '^\s*$'
	    break
	 endif
	 let lnum = prevnonblank(lnum - 1)
	 if lnum <= 0
	    return a:prev_indent
	 endif
      endwhile
   endwhile
   " Fallback - just move back one
   return a:prev_indent - &sw
endfunction EndBlockIndent

" Section: s:StatementIndent {{{1
"
" Return indent of previous statement-start
" (after we've indented due to multi-line statements).
" This time, we start searching on the line *before* the one given (which is
" the end of a statement - we want the previous beginning).
function s:StatementIndent( current_indent, prev_lnum )
   let lnum  = a:prev_lnum
   while lnum > 0
      let prev_lnum = lnum
      let lnum = prevnonblank(lnum - 1)
      " Get previous non-blank/non-comment-only line
      while 1
	 let line = substitute( getline(lnum), g:magma#Comment, '', '' )

	 if line !~ '^\s*$'
	    break
	 endif
	 let lnum = prevnonblank(lnum - 1)
	 if lnum <= 0
	    return a:current_indent
	 endif
      endwhile
      " Leave indent alone if our ';' line is part of a ';'-delineated
      " aggregate (e.g., procedure args.) or first line after a block start.
      if line =~ s:MagmaBlockStart || line =~ '(\s*$'
	 return a:current_indent
      endif
      if line =~ ';\s*$'
         let ind = indent(prev_lnum)
         if ind <= a:current_indent
            return ind
         endif
      endif
   endwhile
   " Fallback - just use current one
   return a:current_indent
endfunction StatementIndent


" Section: GetMagmaIndent {{{1
"
" Find correct indent of a new line based upon what went before
"
function GetMagmaIndent()
   " Find a non-blank line above the current line.
   let lnum = prevnonblank(v:lnum - 1)
   let ind = indent(lnum)
   let package_line = 0

   " Get previous non-blank/non-comment-only
   while 1
      let line = substitute( getline(lnum), g:magma#Comment, '', '' )
      if line !~ '^\s*$'
	 break
      endif
      let lnum = prevnonblank(lnum - 1)
      if lnum <= 0
	 return ind
      endif
   endwhile

   " Get default indent (from prev. line)
   let ind = indent(lnum)
   let initind = ind

   " Now check what's on the previous line
   if line =~ ';\s*$'
     " Statement end (but not 'end' ) - try to find current statement-start indent
      let ind = s:StatementIndent( ind, lnum )
   elseif line =~ s:MagmaBlockStart  ||  line =~ '(\s*$'
          let ind = ind + &sw
   else
      " A statement continuation - move in one
     let plnum = prevnonblank(lnum - 1)
     " Get previous non-blank/non-comment-only line
     while 1
        let pline = substitute( getline(plnum), g:magma#Comment, '', '' )

        if pline !~ '^\s*$'
           break
        endif
        let plnum = prevnonblank(plnum - 1)
        if plnum <= 0
           return ind
        endif
     endwhile
     if pline =~ ';\s*$'
        let ind = ind + 2*&sw
     endif
   endif

   " Check current line; search for simplistic matching start-of-block
   let line = getline(v:lnum)
   if line =~ '^\s*\(else\|elsif\)\>'
      let ind = s:MainBlockIndent( ind, lnum, 'if\>', '' )
   elseif line =~ '^\s*when\>'
      " Align 'when' one /in/ from matching block start
      let ind = s:MainBlockIndent( ind, lnum, 'case\>', '' ) + &sw
   elseif line =~ '^\s*end\>\s*\<if\>'
      " End of if statements
      let ind = s:EndBlockIndent( ind, lnum, 'if\>', 'end\>\s*\<if\>' )
   elseif line =~ '^\s*end\>\s*\<for\>'
      " End of loops
      let ind = s:EndBlockIndent( ind, lnum, '\(for\>.*\)\?\<do\>', 'end\>\s*\<for\>' )
   elseif line =~ '^\s*end\>\s*\<while\>'
      " End of loops
      let ind = s:EndBlockIndent( ind, lnum, '\(while\>.*\)\?\<do\>', 'end\>\s*\<while\>' )
   elseif line =~ '^\s*until\>'
      " End of loops
      let ind = s:EndBlockIndent( ind, lnum, 'repeat\>', 'until\>' )
   elseif line =~ '^\s*end\>\s*\<procedure\>'
      " End of procedures
      let ind = s:EndBlockIndent( ind, lnum, 'procedure\>', 'end\>\s*\<procedure\>' )
   elseif line =~ '^\s*end\>\s*\<function\>'
      " End of functions
      let ind = s:EndBlockIndent( ind, lnum, 'function\>', 'end\>\s*\<function\>' )
   elseif line =~ '^\s*end\>\s*\<intrinsic\>'
      " End of intrinsics
      let ind = s:EndBlockIndent( ind, lnum, 'intrinsic\>', 'end\>\s*\<intrinsic\>' )
   elseif line =~ '^\s*end\>\s*\<case\>'
      " End of case statement
      let ind = s:EndBlockIndent( ind, lnum, 'case\>', 'end\>\s*\<case\>' )
   elseif line =~ '^\s*end\>\s*\<try\>'
      " End of try statement
      let ind = s:EndBlockIndent( ind, lnum, 'try\>', 'end\>\s*\<try\>' )
   elseif line =~ '^\s*end\>'
      " General case for end
      let ind = s:MainBlockIndent( ind, lnum, '\(if\|while\|for\|do\|case\|try\|catch\|function\|procedure\|intrinsic\)\>', '' )
   elseif line =~ '^\s*catch\>'
      let ind = s:MainBlockIndent( ind, lnum, 'try\>', '' )
   elseif line =~ '^\s*then\>'
      let ind = s:MainBlockIndent( ind, lnum, 'if\>', '' )
   endif

   return ind
endfunction GetMagmaIndent

finish " 1}}}

"------------------------------------------------------------------------------
"   Copyright (C) 2006	Martin Krischik
"
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: textwidth=78 wrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
" vim: foldmethod=marker
