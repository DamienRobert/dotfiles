#!/usr/bin/perl
use strict;

my $hgserver="";
my $hgdir="";
my $hgorig=$ENV{HOME};

sub help {
  print STDERR <<EOHelp;
    $0 origine destination autres_fichiers*
    pour copier les fichier de origine à destination
    -h: affiche l'aide
    -o option: pour ajouter une option
    -x exclusion: pour rajouter un pattern d'exclusion
    -X: pour ne pas inclure les fichiers par défauts
EOHelp
};

while ($_ = $ARGV[0], defined($_) && /^-/) {
  shift;
  last if /^--$/;
  if (/^-h/) { &help(); exit 0 };
  if (/^-s/) {
    $hgserver = shift;
    if ($hgserver eq "Feanor-Local") {
      $hgserver = "~/BACKUPS/BACKUP-Feanor/";
    }
  };
  if (/^-d/) {
    $hgdir = shift;
    if ($hgdir eq ".") {
      $hgdir = $ENV{PWD};
      #chomp($hgdir);
    }
  };
  if (/^-o/) {
    $hgorig = shift;
  };
}

my $hgpath=shift;
$hgdir =~ s/$hgorig//;

print "hg pull $hgserver$hgdir$hgpath\n";
