#!/usr/bin/perl
use strict;
use File::Spec;
#pour enlever des scripts de bin et les mettre dans le bon répertoire
#et faire les liens symboliques qui vont bien

sub help {
  print STDERR <<EOHelp;
  pour enlever des scripts de bin et les mettre dans le bon répertoire
  et faire les liens symboliques qui vont bien
EOHelp
};

print "Canon path:";
print(File::Spec->canonpath(@ARGV));
print "\n";
print "Catdir:";
print(File::Spec->catdir(@ARGV));
print "\n";
print "Catfile:";
print(File::Spec->catfile(@ARGV));
print "\n";
print "Curdir:";
print(File::Spec->curdir());
print "\n";
print "rootdir:";
print(File::Spec->rootdir());
print "\n";
print "updir:";
print(File::Spec->updir());
print "\n";
print "no_upwards:";
print(File::Spec->no_upwards(@ARGV));
print "\n";
print "path:";
print(File::Spec->path());
print "\n";
print "abs2rel:";
print(File::Spec->abs2rel(@ARGV));
print "\n";
print "rel2abs:";
print(File::Spec->rel2abs(@ARGV));
print "\n";
