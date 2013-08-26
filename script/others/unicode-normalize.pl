#! /usr/bin/perl -w

# Normalize utf-8 input.

require 5.8.1;  # Perl 5.6 has totally insane Unicode behavior
use strict;
use open ':utf8';  # I prefer this to the -Ci command-line flag
use Unicode::Normalize 'normalize';
use Getopt::Std;

binmode STDIN, ":utf8";  # I prefer this to the -CI command line flag
binmode STDOUT, ":utf8";

my %opts;

getopts ("cdk", \%opts);

my $cform = $opts{"c"};
my $dform = $opts{"d"};
if ( $cform && $dform ) {
    print STDERR "-c and -d are incompatible!  Assuming -d.\n";
    exit 2;
}
if ( ! ( $cform || $dform ) ) {
    $cform = 1;
}
my $kform = $opts{"k"};

my $form;
if ( $dform ) {
    $form = "D";
} else {
    $form = "C";
}
if ( $kform ) {
    $form = "K" . $form;
}

while (<>) {
    $_ = normalize($form, $_);
    print $_;
}
