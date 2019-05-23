#!/usr/bin/perl
use strict;
#pour sauvegarder des données

my $rsync="rsync";
#my @rsync_opt="-ravzbHAXcP";
my @rsync_opt="-ravzbHcP";
#AX n'est pas reconnu par clipper encore

##-vaczP
## safe-links:  ignore symlinks that point outside the tree
##-r: pour copier les directory
##(-R: pour les copier de manière relative)
##-a: archive (garde les perms,...)
##-v: verbose
##-u: update (ne copie que les fichiers plus jeunes)
##-z: compresse le transfert
##-b: backups
##-H: préserve les hard links
##-c: pour un check sum plutôt qu'une comparaison par date/taille
##-P: pour indiquer le transfert et garder les fichiers partiellement dl

##eventuellement
##-ptl au lieu de -a (pour pas avoir le -og)
##--partial
##-bwlimit= #bandwith

#my @rsync_exclude=('*~','*.swp','*.log','.hg');
my @rsync_exclude=('*~','*.swp','*.log', '*.nobackup');

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

#my @files=("FichiersConfig","bin","progs");
my @files=();
while ($_ = $ARGV[0], defined($_) && /^-/) {
  shift;
  last if /^--$/;
  if (/^-h/) { &help(); exit 0 };
  if (/^-o/) { my $newopt=shift; push (@rsync_opt, $newopt) };
  if (/^-x/) { my $newex=shift; push (@rsync_exclude, $newex) };
  if (/^-X/) { @files=(); };
}

if ($#ARGV+1<2) {
  print STDERR "format non reconnu\n";
  &help();
  exit 1;
}


my @rsync_exclude_com=();
for my $i (@rsync_exclude) {
  push (@rsync_exclude_com, "--exclude");
  push (@rsync_exclude_com, $i);
}
my @rsync_command=($rsync, @rsync_opt, @rsync_exclude_com,
"--backup-dir=.rsync_backup/","--delete-after");
#print @rsync_command; exit 0;



my $origine=shift;
my $destination=shift;
my @autres_files=@ARGV;

print "Command line:", (join " ", @rsync_command), "\n";
print "Origine: $origine\n";
print "Destination: $destination\n";
print "Files supplémentaires: @autres_files\n";

foreach my $i (@files, @autres_files) {
  print "$origine$i -> $destination\n";
  system(@rsync_command, "$origine$i", "$destination");}
