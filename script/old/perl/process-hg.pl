#!/usr/bin/perl
use strict;

sub help {
  print STDERR <<EOHelp;
    $0 vieux_repertoire nouveau_repertoire
EOHelp
};

my $orig;
my $opt_update=0; my $opt_lsbackups=0;
my @other_opt;
while ($_ = $ARGV[0], defined($_) && /^-/) {
  shift;
  last if /^--$/;
  if (/^-h$/) { &help(); exit 0; next };
  if (/^-o$/) { $orig=shift;next };
  if (/^-update$/) { $opt_update=1;next };
  if (/^-lsbackups$/) { $opt_lsbackups=1;next };
  #if (/^-rmbackups$/) { $opt_rmbackups=1 };
  push(@other_opt, $_);
};

while(<>) {
  chomp;
  my $file=$_;
  unless (/^#/ or /^ *$/) {
    if ($opt_lsbackups) {
      system("ls ${_}-old*.nobackup");
    }
    elsif ($opt_update) {
      print("! update-hg.pl @other_opt -o $orig $file\n");
      system("update-hg.pl",@other_opt,"-o","$orig","$file");
    }
    else {
      print ("! compare-hg.pl @other_opt -o $orig $file\n");
      system("compare-hg.pl",@other_opt,"-o","$orig","$file");
    }
  };
};
