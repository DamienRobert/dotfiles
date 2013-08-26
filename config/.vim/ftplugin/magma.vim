set foldmethod=marker 
set cindent 
"set indentexpr=''

function! MyMagmaFoldExpr(line)
    let str = getline(a:line)
    if str =~ '^\/\/\*\*'
        return  '>1'
    elseif str =~ '^\/\/\/\/\*\*'  
        return '>2'
    else
    let str2 = getline(a:line+1)
      if str2 =~ '^\/\/\*\*'
          return  '0'
      elseif str2 =~ '\/\*\*\*\**\/'  
        return '0'
      else
        return foldlevel(a:line-1)
      end if
    endif
endfun    
