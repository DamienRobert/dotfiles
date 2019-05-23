#!/usr/bin/perl

use IO::Handle;

my$chld_out;
open($chld_out,  "ocaml|");

$chld_out->autoflush(1);
STDOUT->autoflush(1);

#while(<$chld_out>) {
while(read $chld_out, $_, 1) {
  print ;
}
if(undef($_)) {
  print "Erreur de lecture: $!\n";
}
