#!/usr/bin/perl
use strict;
use File::Spec;
use Cwd 'abs_path';
#pour enlever des scripts de bin et les mettre dans le bon répertoire
#et faire les liens symboliques qui vont bien

sub help {
  print STDERR <<EOHelp;
  pour enlever des scripts de bin et les mettre dans le bon répertoire
  et faire les liens symboliques qui vont bien
EOHelp
};

my $opt_verbose = 0;
my $opt_test = 0;
while ($_ = $ARGV[0], defined($_) && /^-/) {
  shift;
  last if /^--$/;
  if (/^-v/) { $opt_verbose=1;  };
  if (/^-t/) { $opt_test=1;  };
  if (/^-h/) { &help(); exit 0 };
}

my $HOME=$ENV{"HOME"};
my $dir=shift;
if (not $dir) {
  $dir="$HOME/bin";
}
$dir=Cwd::abs_path($dir);
print "cd $dir\n" if ($opt_verbose);
chdir $dir;

sub dolink {
  my $file = shift; my $dirname = shift;
  #my $filename=`basename "$file"`; chomp($filename);
  my $new="$HOME/$dirname/$file";
  my $new=File::Spec->abs2rel($new);
  print("mv $file $new\n") if ($opt_verbose);
  system("mv","$file","$new")==0 or die "Erreur dans le mv: $!\n" unless ($opt_test);
  print("ln -s $new $dir \n") if ($opt_verbose);
  system("ln", "-s","$new","$dir")==0 or die "Erreur dans le ln: $!\n" unless ($opt_test);
}

for my $i  (glob("*")) {
  next if (-l $i);
  next if (-d $i);
  next if ($i =~ /\~$/);
  if (-x $i) {
    if ($i =~ /\.pl$/) {
      dolink($i, "perl");
    }
    else {
      dolink($i, "script");
    }
  }
}
