function! SlSpace()
    if exists("*GetSpaceMovement")
        return "(" . GetSpaceMovement() . ")"
    else
        return ""
    endif
endfunc

function! SyntasticStatuslineFlagStatus()
  if exists("*SyntasticStatuslineFlag")
     return SyntasticStatuslineFlag()
  else
     return ""
  endif
endfunc

function! FugitiveStatus()
  if exists("*fugitive#statusline")
     return fugitive#statusline()
  else
     return ""
  endif
endfunc

function! NewVersionInfoStatus()
  if version >= 730 
    return "%q"
  else
  "the 7.2 version does not know %q
    return ""
  endif
endfunc

set statusline=%<%n:%m%f\ %y%r%h%w%{NewVersionInfoStatus()}\ %{FugitiveStatus()}%{SlSpace()}%{SyntasticStatuslineFlagStatus()}%=%-10.(%2.c:%l/%L%)\ %P
