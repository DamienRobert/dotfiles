#!/usr/bin/perl
# emule le toplevel de caml
# attention, la détection des comments ne prend pas en cas le truc suivant:
# let ploum = plim (* ploum ploum *) ;;
# dans ce cas le last ne sera pas effectué.

use IPC::Open2;
use IO::Handle;

my($chld_out, $chld_in);
$pid = open2($chld_out, $chld_in, shift);
print "@ARGV\n";

$chld_out->autoflush(1);
STDOUT->autoflush(1);

my $new_line;
my $comment;

while(read $chld_out, $_, 1) {
  print;
  if (/#/ and $new_line) {
    $new_line=0;
    read $chld_out, $_, 1;
    print;
    # s'il on a un # après uen nouvelle ligne, on lit l'espace qui suit
    $comment=0;
    while(<>) {
      # on lit ce que le client entre
      # et on le passe au programme
      print $chld_in $_;
      print ;
      if (/\(\*/) {
        $comment++;
        #print "INCR: $comment\n"
        };
      if (/;;/ and not $comment) {
        last;
      }
      if (/\*\)/) {
        $comment--;
        #print "DECR $comment\n"
        };
    }
    if(! $_) {
      if (undef($_))  { die "Erreur de lecture client: $!\n" }
      close($chld_in);
      # EOF du client
    }
  }
  if (not (/ /)) { $new_line=0; };
  if (/\n/) {
    $new_line=1;
  }
}

if(undef($_)) {
  die "Erreur de lecture ocaml: $!\n";
}
waitpid $pid, 0
