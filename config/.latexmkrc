# vim: filetype=perl
push @generated_exts, ('thm','lol','maf','mtc');

###### programmes #####
$makeindex="texindy %O -o %D %S";
#$biber="biber --output_directory %Z %O %S";

$out_dir='out';
$pdflatex="pdflatex -file-line-error %O %S; cp %D .";
$pdf_previewer="start okular --unique %O %S 2>/dev/null";

#$clean_ext='bcf xml blg ilg log',
#$clean_ext='%R.synctex.gz %R.output.synctex.gz',

$pdf_mode=1;
$recorder=1;
$cleanup_includes_generated=1;
$cleanup_includes_cusdep_generated=1;
$always_view_file_via_temporary=1;
