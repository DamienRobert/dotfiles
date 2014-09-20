#!/usr/bin/perl
use strict;

sub help { 
  print STDERR <<EOHelp;
  permutations.pl word wordlist look for all (sub)-permutations of word
  that are in wordlist.
EOHelp
};

while ($_ = $ARGV[0], defined($_) && /^-/) {
  shift;
  last if /^--$/;
  if (/^-h/) { &help(); exit 0 };
}

my @letters=split(//, $ARGV[0]);
my @allwords=();
my @words;
my $dico=$ARGV[1];

sub process {
  my $actu=shift;
  my $n=shift;
  my @reste=@_;
  #print "process: actu->$actu, reste -> @reste, n->$n\n";
  if ($n eq 0) {
    push(@words,$actu);
  }
  else { 
    foreach my $i (0..$#reste) {
      my @new_reste=@reste[0..($i-1),($i+1)..($#reste)];
      my $new_actu="$actu$reste[$i]";
      #print "appel: $new_actu, @new_reste\n";
      &process($new_actu,$n-1,@new_reste);
    }
  }
}

foreach my $n (3..$#letters+1) {
  @words=();
  &process("",$n,@letters);
  push(@allwords,@words);
}
#print "@words \n";

#my $s="^\$";
#foreach my $i (@allwords) {
#  $s="$s|(^$i\$)";
#};
#my $s=join('|',@allwords);
#print "$s\n";
#system ("egrep", "-i", "$s", "/usr/share/dict/words");
#system ("egrep '^[@letters]\$' /usr/share/dict/words | egrep -i '$s'");
#print ("egrep '^[@letters]\$' /usr/share/dict/words | egrep -i '$s'");
#my @possible=split(/ */,`egrep '^[@letters]*\$' /usr/share/dict/words`);
#my @possible=`egrep '^[@letters]*\$' /usr/share/dict/words`;
my @possible=`egrep '^[@letters]*\$' $dico`;
chomp(@possible);

my %unique, my %results;
@unique{ @possible } = ();        # hash slice
# on vire les doublons
@results{ @allwords } = ();        # hash slice
my @parcours=keys(%results);
foreach my $target (@parcours) {
  #print "essai: $target\n";
  if( exists $unique{$target} ) {
    print "$target\n";
  }
}

# foreach my $target (@allwords) {
#   if( grep { "$_" eq "$target" } @possible ) {        
#     print "$target\n";
#   }
# }


