let b:atp_OutDir = substitute(fnameescape(fnamemodify(resolve(expand("%:p")),":h")) . "/out/", '\\\s', ' ' , 'g')
let b:atp_autex=0
