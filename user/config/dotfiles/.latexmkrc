# vim: filetype=perl
push @generated_exts, ('thm','lol','maf','mtc');

$out_dir='out';
$pdflatex="pdflatex -file-line-error %O %S && cp %D .";
$xelatex="xelatex -file-line-error %O %S && cp %D .";
$lualatex="lualatex -file-line-error %O %S && cp %D .";
$dvipdf = "dvipdfm %O -o %D %S && cp %D .";
$ps2pdf = "ps2pdf %O %S %D && cp %D .";
$makeindex="texindy %O -o %D %S";
$pdf_previewer="xdg-open %O %S 2>/dev/null";

$pdf_mode=1; #Set 4 for lualatex, 5 for xelatex
$recorder=1; #default
$cleanup_includes_generated=1;
$cleanup_includes_cusdep_generated=1;
$always_view_file_via_temporary=0; #default
