#!/usr/bin/perl

use strict;
my @table;

while(<>) {
  push @table, $_;
}

my $moy, my $som = 0, 0;
foreach my $i (@table) {
  $som += $i;
};
$moy= $som / ($#table+1);
print "Moyenne: $moy\n";
my $variance=0;
foreach my $i (@table) {
  $variance += ($i-$moy) ** 2;
};
$variance = $ variance / ($#table+1);
my $ecart = sqrt($variance);
print "Variance: $variance, $ecart\n";

my @repartition=( [], [], [], []);
foreach my $i (@table) {
  if ($i <= 5) {
    push @{$repartition[0]}, $i
  };
  if (5< $i and $i <= 10) {
    push @{$repartition[1]}, $i
  };
  if (10< $i and $i <= 15) {
    push @{$repartition[2]}, $i
  };
  if (15< $i and $i <= 20) {
    push @{$repartition[3]}, $i
  };
};
for my $i (@repartition) {
  print $#{$i}+1,"\n";
}
