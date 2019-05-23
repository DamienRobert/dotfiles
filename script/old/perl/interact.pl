#!/usr/bin/perl
#Pour intéragir avec un programme

use IPC::Open2;
use IO::Handle;

my($chld_out, $chld_in);
$pid = open2($chld_out, $chld_in, @ARGV);
print "@ARGV\n";

$chld_out->autoflush(1);
STDOUT->autoflush(1);

while(read $chld_out, $_, 1) {
  print;
  if (/\n/) {
     my $time=time();
     print "$time\n";
     date;
  }
}

if(undef($_)) {
  die "Erreur de lecture: $!\n";
}
waitpid $pid, 0
