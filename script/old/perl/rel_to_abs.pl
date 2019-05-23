#!/usr/bin/perl
use strict;
use File::Spec;
use Cwd 'abs_path';

sub help {
  print STDERR <<EOHelp;
  Pour transformer des liens symboliques relatifs en liens absolus.
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

my $cwd=Cwd::getcwd();
for my $i (@ARGV) {
  if (-l $i) {
    my $link=readlink($i);
    if (not File::Spec->file_name_is_absolute($link)) {
      #my $link=File::Spec->rel2abs(readlink($i));
      #my $link=Cwd::abs_path($i);
      ( my $volume , my $dir, my $file) = File::Spec->splitpath(File::Spec->rel2abs($i));
      print "dir: $dir; file: $file; link: $link\n" if ($opt_verbose);
      #my $newlink=File::Spec->rel2abs($link);
      my $newlink=Cwd::abs_path($i);
      print "ln -snf $newlink $dir\n" if ($opt_verbose);
      system ("ln", "-snf", $newlink, $dir)==0 or die "Erreur dans le ln: $!\n"
      unless ($opt_test);
    }
  }
}
