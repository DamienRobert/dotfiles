#!/usr/bin/perl
use strict;
#playlist_info.pl stream use wget to look at the headers and find title and
#genre of stream

sub help { 
  print STDERR <<EOHelp;
  playlist_info.pl stream récupère les infos icy-*
EOHelp
};

while ($_ = $ARGV[0], defined($_) && /^-/) {
  shift;
  last if /^--$/;
  if (/^-h/) { &help(); exit 0 };
}

sub playlist_info{
  my $playlist=$_[0];
  my $stream;
  #open $stream, "curl $playlist |" or die "Impossible d'ouvrir $playlist";
  open $stream, "wget --timeout=5 2>&1 --server-response -O - $playlist  |" or die "Impossible d'ouvrir $playlist";
  my $name="";
  my $genre="";
  my $binary=0;
  while (<$stream>) {
    #print "!name: $name, genre: $genre, binary: $binary!\n";
    chomp;
    next if (/^ *$/);
    s///;
    #print "!$_!\n";
    if (/icy:(.*)$/i) {
      print $1;
    }
    if (/^ *icy-name:(.*) *$/i) {
      $name=$1;
      #print "NAME: $name";
    };
    if (/^ *icy-genre:(.*) *$/i) {
      $genre=$1;
    };
    if ($binary && !/^ *icy/i) {
      close $stream;
    }
    if (/^Saving to: .*STDOUT/) {
      $binary=1;
    }
  }
  if (!$name and !$genre) {
    return "";
  }
  $name=$playlist if (!$name);
  return "$name [$genre]";
}

my $playlist=$ARGV[0];
print playlist_info($playlist),"\n";
