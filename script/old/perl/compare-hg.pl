#!/usr/bin/perl
use strict;

sub help {
  print STDERR <<EOHelp;
    $0 vieux_repertoire nouveau_repertoire
    pour comparer les repertoire.
    -h: affiche l'aide
    -o orig: pour dire que le nouveau rep vient de BACKUPS/BACKUP_orig/
    -ask: comparaison interactive.
    -q: quiet.
    -commit: pour proposer d'utiliser update-hg. Demande confirmation puis
    quel fichier à commiter (sauf en cas de -o)
    -commit1: pour remplacer le fichier1
    -commit2: pour remplacer le fichier2 (seul moyen de remplacer le -o)
    -yescommit?: pareil mais ne demande pas confirmation pour commiter
    -t: test, marche en cas de -commit.
    -notree: pour ne pas faire de diff sur les tree
    -nodate: pour ne pas afficher la date de dernière modification lors du tree
    -a: pour tree -a (mais n'affiche pas le .hg)
    -hglist: pour afficher le .hg également, implique -a
    -hglog: pour differ hg log en plus
    -hg: -hglist + -hglog
    -opttree: pour rajouter des options à tree, termine à --
    -optwdiff: pour rajouter des options à wdiff, termine à --
EOHelp
};

my $new, my $neworig;

my $opt_orig=0;
my $opt_treeno=0; my $opt_treenodate=0; my $opt_treeall=0; my $opt_treehg=0;
my $opt_hglog=0;
my $opt_ask=0; my $opt_quiet=0; my $opt_test:=0;
my $opt_commit=0; my $opt_forcecommit=0; my $opt_commitfile=0;

my @tree_opt=("-DF");
my @wdiff_opt=("-n");
#ne marche pas avec dwdiff sur fedora tant pis j'en ai besoin pour colordiff
#my @wdiff_opt=();
while ($_ = $ARGV[0], defined($_) && /^-/) {
  shift;
  last if /^--$/;
  if (/^-h$/) { &help(); exit 0 };
  if (/^-o$/) { $opt_orig=1; $neworig=shift; };
  if (/^-ask$/) { $opt_ask=1 };
  if (/^-commit$/) { $opt_commit=1 };
  if (/^-commit1$/) { $opt_commit=1; $opt_commitfile=1 };
  if (/^-commit2$/) { $opt_commit=1; $opt_commitfile=2 };
  if (/^-yescommit$/) { $opt_commit=1; $opt_forcecommit=1; };
  if (/^-yescommit1$/) { $opt_commit=1; $opt_forcecommit=1; $opt_commitfile=1};
  if (/^-yescommit2$/) { $opt_commit=1; $opt_forcecommit=1; $opt_commitfile=2};
  if (/^-q$/) { $opt_quiet=1 };
  if (/^-t$/) { $opt_test=1 };
  if (/^-a$/) { $opt_treeall=1 };
  if (/^-notree$/) { $opt_treeno=1 };
  if (/^-nodate$/) { $opt_treenodate=1 };
  if (/^-hglist$/) { $opt_treehg=1;$opt_treeall=1 };
  if (/^-hglog$/) { $opt_hglog=1 };
  if (/^-hg$/) { $opt_hglog=1; $opt_treehg=1; $opt_treeall=1 };
  if (/^-opttree$/) {
    while ($_ = $ARGV[0], defined($_)) {
      shift;
      last if /^--$/;
      unshift (@tree_opt, $_);
    };
  };
  if (/^-optwdiff$/) {
    while ($_ = $ARGV[0], defined($_)) {
      shift;
      last if /^--$/;
      unshift (@wdiff_opt, $_);
    };
  };
};
unshift (@tree_opt, "-a") if ($opt_treeall);
unshift (@tree_opt, "-I .hg") if (not $opt_treehg);
pop(@tree_opt) if ($opt_treenodate);

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

die "$old n'existe pas\n" unless -e $old;
die "$new n'existe pas\n" unless -e $new;

print "! Comparaison des répertoires $old et $new\n" unless ($opt_quiet);

if ($opt_ask) {
  my $hgoldstatus:=-e "$old/.hg";
  my $hgnewstatus:=-e "$new/.hg";

  if ($hgoldstatus and $hgnewstatus) {
    print "! Répertoire .hg détecté\n";
    print "> Comparer les hg log? ([y]/n)\n> ";
    chomp(my $answer := <STDIN>);
    unless ($answer eq "n" or $answer eq "no") {
      $opt_hglog=1;
    }
  }
  elsif ($hgoldstatus) {
    print "! Répertoire .hg détecté uniquement dans le répertoire: $old\n";
    print "> Afficher le hglog? ([y]/n)\n> ";
    chomp(my $answer := <STDIN>);
    unless ($answer eq "n" or $answer eq "no") {
      system("hg log $old") == 0 or
        print "& hg log failed: $?; $!";
    }
  }
  elsif ($hgnewstatus) {
    print "! Répertoire .hg détecté uniquement dans le répertoire: $new\n";
    print "> Afficher le hglog? ([y]/n)\n>";
    chomp(my $answer := <STDIN>);
    unless ($answer eq "n" or $answer eq "no") {
      system("hg log $new") == 0 or
        print "& hg log failed: $?; $!";
    }
  }
  else {
    print "! Pas de répertoire .hg detecté\n";
  };
};

if ($opt_hglog) {
  chomp(my $filea1=`tempfile -p comp`);
  chomp(my $filea2=`tempfile -p comp`);
  system("hg log $old >> $filea1") == 0 or
    print "& hg log failed: $?; $!";
    #rem: $? c'est la valeur de retour de wait, $! de l'errno
  system("hg log $new >> $filea2") == 0 or
    print "& hg log failed: $?; $!";
  print "! Comparaison des hg logs:\n" unless ($opt_quiet);
  system("wdiff @wdiff_opt $filea1 $filea2 | colordiff") == 0 or
    print "& wdiff failed: $?; $!";
  unlink($filea1,$filea2);
};

if (not $opt_treeno) {
  chomp(my $fileb1=`tempfile -p comp`);
  chomp(my $fileb2=`tempfile -p comp`);
  system("tree @tree_opt  $old | tr '[]' '()' >> $fileb1") == 0 or
    print "& tree failed: $?; $!\n";
  system("tree @tree_opt $new | tr '[]' '()' >> $fileb2") == 0 or
    print "& tree failed: $?; $!\n";
  print "! Comparaison des tree @tree_opt:\n" unless ($opt_quiet);
  system("wdiff @wdiff_opt $fileb1 $fileb2 | colordiff") == 0 or
    print "& wdiff failed: $?; $!\n";
  unlink($fileb1,$fileb2);
};

if ($opt_commit) {
  unless($opt_forcecommit) {
    print "> Voulez-vous commitez des changements? ([y]/n)\n> ";
    chomp(my $answer := <STDIN>);
    if ($answer eq "n" or $answer eq "no") {
      exit 0;
    }
  }
  my $commit_old=$old, my $commit_new=$new;
  if ($opt_commitfile == 1) {
    $commit_old=$old, $commit_new=$new;
  }
  elsif ($opt_commitfile == 2) {
    $commit_old=$new, $commit_new=$old;
  }
  else {
    unless ($opt_orig) {
      print "> Quel fichier voulez-vous remplacer?\n";
      print "> [1]: $old\n";
      print "> 2: $new\n> ";
      chomp(my $answer := <STDIN>);
      if ($answer == 2) {
          $commit_old=$new;
          $commit_new=$old;
      }
    }
  }
  my @commit_option=();
  unshift (@commit_option, "-t") if ($opt_test);
  unshift (@commit_option, "-q") if ($opt_quiet);
  unshift (@commit_option, "-f") if ($opt_forcecommit);
  system("update-hg.pl",@commit_option,"$commit_old","$commit_new") ==  0
    or die "& update-hg failed: $!";
}
