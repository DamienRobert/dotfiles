#! /usr/bin/perl -w

use strict;

my $unidata = "$ENV{HOME}/var/unicode/UnicodeData.txt" // $ENV{"UNIDATA"};
open F, "<", $unidata or die "Can't open $unidata";
my @unidata;
while (<F>) {
    my @l = split /\;/;
    my $n = hex($l[0]);
    $unidata[$n] = $l[1] unless $l[1] =~ /^\<.*\>$/;
}
close F;

sub putunichar {
    my $c = shift;
    if ( defined($unidata[$c]) ) {
	printf "U+%04X %s\n", $c, $unidata[$c];
    } elsif ( $c>=0xAC00 && $c<=0xD7AF ) {
	my $n = $c-0xAC00;
	my $l = int($n/(21*28));
	my $v = (int($n/28))%21;
	my $t = $n%28;
	my @partL = ( "G", "GG", "N", "D", "DD", "R", "M", "B", "BB", "S",
		      "SS", "", "J", "JJ", "C", "K", "T", "P", "H" );
	my @partV = ( "A", "AE", "YA", "YAE", "EO", "E", "YEO", "YE", "O", "WA",
		      "WAE", "OE", "YO", "U", "WEO", "WE", "WI", "YU", "EU", "YI",
		      "I" );
	my @partT = ( "", "G", "GG", "GS", "N", "NJ", "NH", "D", "L", "LG",
		      "LM", "LB", "LS", "LT", "LP", "LH", "M", "B", "BS", "S",
		      "SS", "NG", "J", "C", "K", "T", "P", "H" );
	printf "U+%04X HANGUL SYLLABLE %s%s%s\n", $c, $partL[$l], $partV[$v], $partT[$t];
    } elsif ( ( $c>=0x3400 && $c<=0x4DB5 )
	      || ( $c>=0x4E00 && $c<=0x9FCB )
	      || ( $c>=0x20000 && $c<=0x2A6D6 )
	      || ( $c>=0x2A700 && $c<=0x2B734 )
	      || ( $c>=0x2B740 && $c<=0x2B81D ) ) {
	printf "U+%04X CJK UNIFIED IDEOGRAPH-%04X\n", $c, $c;
    } else {
	printf "U+%04X\n", $c;
    }
}

sub dosinglechar {
    # Process a single (ASCII) character.
    my $char = shift;
    $char = ord($char);
    putunichar $char;
}

sub dodoublechar {
    my $ch1 = shift;
    my $ch2 = shift;
    $ch1 = ord($ch1);
    $ch2 = ord($ch2);
    putunichar ((($ch1-0300)<<6)|($ch2-0200));
}

sub dotriplechar {
    my $ch1 = shift;
    my $ch2 = shift;
    my $ch3 = shift;
    $ch1 = ord($ch1);
    $ch2 = ord($ch2);
    $ch3 = ord($ch3);
    putunichar ((($ch1-0340)<<12)|(($ch2-0200)<<6)|($ch3-0200));
}

sub doquadruplechar {
    my $ch1 = shift;
    my $ch2 = shift;
    my $ch3 = shift;
    my $ch4 = shift;
    $ch1 = ord($ch1);
    $ch2 = ord($ch2);
    $ch3 = ord($ch3);
    $ch4 = ord($ch4);
    putunichar ((($ch1-0360)<<18)|(($ch2-0200)<<12)|(($ch3-0200)<<6)|($ch4-0200));
}

sub doquintuplechar {
    my $ch1 = shift;
    my $ch2 = shift;
    my $ch3 = shift;
    my $ch4 = shift;
    my $ch5 = shift;
    $ch1 = ord($ch1);
    $ch2 = ord($ch2);
    $ch3 = ord($ch3);
    $ch4 = ord($ch4);
    $ch5 = ord($ch5);
    putunichar ((($ch1-0370)<<24)|(($ch2-0200)<<18)|(($ch3-0200)<<12)|(($ch4-0200)<<6)|($ch5-0200));
}

sub dosextuplechar {
    my $ch1 = shift;
    my $ch2 = shift;
    my $ch3 = shift;
    my $ch4 = shift;
    my $ch5 = shift;
    my $ch6 = shift;
    $ch1 = ord($ch1);
    $ch2 = ord($ch2);
    $ch3 = ord($ch3);
    $ch4 = ord($ch4);
    $ch5 = ord($ch5);
    $ch6 = ord($ch6);
    putunichar ((($ch1-0374)<<30)|(($ch2-0200)<<24)|(($ch3-0200)<<18)|(($ch4-0200)<<12)|(($ch5-0200)<<6)|($ch6-0200));
}

while ( <> ) {
  GOBBLE:
    while ( 1 ) {
	if ( s/^([\300-\337])([\200-\277])//s ) {
	    dodoublechar $1, $2;
	} elsif ( s/^([\340-\357])([\200-\277])([\200-\277])//s ) {
	    dotriplechar $1, $2, $3;
	} elsif ( s/^([\360-\367])([\200-\277])([\200-\277])([\200-\277])//s ) {
	    doquadruplechar $1, $2, $3, $4;
	} elsif ( s/^([\370-\373])([\200-\277])([\200-\277])([\200-\277])([\200-\277])//s ) {
	    doquintuplechar $1, $2, $3, $4, $5;
	} elsif ( s/^([\374-\375])([\200-\277])([\200-\277])([\200-\277])([\200-\277])([\200-\277])//s ) {
	    dosextuplechar $1, $2, $3, $4, $5, $6;
	} elsif ( s/^(.)//s ) {
	    dosinglechar $1;
	} else {
	    last GOBBLE;
	}
    }
}
