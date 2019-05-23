#!/usr/bin/perl

use strict;
my @result=`netstat -pte |grep ESTABLISHED`;
my %hash;

shift @result; shift @result;
foreach my $i (@result) {
  chomp($i);
  my @s=split(' ', $i);
  my $proto=$s[0];
  my $recvq=$s[1];
  my $sendq=$s[2];
  my $laddr=$s[3];
  my $faddr=$s[4];
  my $state=$s[5];
  my $user =$s[6];
  my $inode=$s[7];
  my $prog  =$s[8];
  my $key="$prog($user)";
  if (! exists $hash{$key}) {
    $hash{$key}=[$faddr];
  }
  else
  {
    my $ref=$hash{$key};
    $hash{$key}=[@$ref, $faddr];
  }
}

my @tosort=keys(%hash);
my @sorted= sort {scalar @{$hash{$a}} <=> scalar @{$hash{$b}}} @tosort;
for my $i (reverse(@sorted)) {
  my @r=@{$hash{$i}};
  print (scalar @r, ": ", "$i", " -> ", join(', ',@r), "\n");
};
