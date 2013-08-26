#!/usr/bin/perl
#output the rank of the letter in the alphabet mod 10

use strict;

my $word=$ARGV[0];
print "$word\n";

foreach my $s (split('',$word)) {
   print ((ord($s)-ord('a')+1) % 10);
}
