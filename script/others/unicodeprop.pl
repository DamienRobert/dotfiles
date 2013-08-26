#!/usr/bin/perl -w

use strict;
use Encode 'decode';
use Unicode::UCD 'charinfo';

binmode STDOUT,"utf8";

die "Usage: $0 [ character | character-code ]\n" if $#ARGV != 0;

$_=shift;

my $unicode;

if($_ =~ /^(0[xb])?[\dA-Fa-f]+$/ && length($_)>1) {
  $unicode=$_;
  $unicode=oct($unicode) if $unicode=~ /^0/;
} else {
  my $char=Encode::decode("UTF-8",$_);
  $char=$_ if(!defined($char));
  $unicode=ord($char);
}

die "Invalid character.\n" if not defined charinfo($unicode);

my %charinfo=%{charinfo($unicode)};

print "0x".$charinfo{"code"};
print " ".chr($unicode) if chr($unicode) ne "";
print " ".$charinfo{"name"} if $charinfo{"name"};
print " (".$charinfo{"category"}.")" if $charinfo{"category"};
if ($charinfo{"decomposition"}) {
  print " ";
  $_=$charinfo{"decomposition"};
  s/([0-9A-F]+)/0x$1/g;
  s/ /+/g;
  print;
}
print " (= ".$charinfo{"numeric"}.")" if $charinfo{"numeric"} ne "";
