#!/usr/bin/perl
use strict;

sub help {
  print STDERR <<EOHelp;
    $0 vieux_repertoire nouveau_repertoire
    pour update ce repertoire, en le backupant.
    -h: affiche l'aide
    -o orig: pour dire que le nouveau rep vient de BACKUPS/BACKUP_orig/
    -t: pour afficher les lignes de commandes sans les executer
    -q: pour ne pas afficher les lignes de commandes
    -f: pour ne pas demander confirmation
EOHelp
};

my $new, my $neworig;

my $opt_orig=0; my $opt_test=0; my $opt_quiet=0; my $opt_force=0;
while ($_ = $ARGV[0], defined($_) && /^-/) {
  shift;
  last if /^--$/;
  if (/^-h/) { &help(); exit 0 };
  if (/^-o$/) { $opt_orig=1; $neworig=shift; };
  if (/^-t/) { $opt_test=1 };
  if (/^-q/) { $opt_quiet=1 };
  if (/^-f/) { $opt_force=1 };
}

my $old=shift;
$new=shift if (not $opt_orig);

my $olddir=`dirname $old`; chomp($olddir);
my $oldfile=`basename $old`; chomp($oldfile);

if ($opt_orig) {
  chomp(my $rac=`cd $olddir; pwd`);
  my $HOME=$ENV{"HOME"};
  $rac=~s/^$HOME//;
  my $newdir="$HOME/BACKUPS/BACKUP_$neworig/$rac";
  $new="$newdir/$oldfile";
};

my $date=`date +%F-%Hh%Mm%Ss`;chomp($date);
my $oldcopy="$olddir/$oldfile-old$date.nobackup";

print "! Remplacement de $old par $new (backup dans $oldcopy)\n"
  unless ($opt_quiet);
unless($opt_force) {
  print "> Voulez-vous continuer? ([y]/n)\n> ";
  chomp(my $answer := <STDIN>);
  if ($answer eq "n" or $answer eq "no") {
    exit 0;
  }
};

if (system ("ls", $new) == 0) {
  warn "$new n'existe pas: $?, $!";
  print "> Voulez-vous continuer? ([y]/n)\n> ";
  chomp(my $answer := <STDIN>);
  if ($answer eq "n" or $answer eq "no") {
    exit 0;
  }
}

print "! mv $old $oldcopy\n" if (not $opt_quiet);
system ("mv", $old, $oldcopy) == 0 or
  warn "& mv failed: $?; $!" if (not $opt_test);
print "! cp -a $new $old\n" if (not $opt_quiet);
system ("cp","-a", $new, $old) == 0 or
  warn "& cp failed: $?, $!" if (not $opt_test);
