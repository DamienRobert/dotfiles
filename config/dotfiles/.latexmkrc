# vim: filetype=perl
push @generated_exts, ('thm','lol','maf','mtc');

$out_dir='out';
$pdflatex="pdflatex -file-line-error %O %S; cp %D .";
$pdf_previewer="evince %O %S 2>/dev/null";
$makeindex="texindy %O -o %D %S";

$pdf_mode=1;
$recorder=1;
$cleanup_includes_generated=1;
$cleanup_includes_cusdep_generated=1;
$always_view_file_via_temporary=0;
