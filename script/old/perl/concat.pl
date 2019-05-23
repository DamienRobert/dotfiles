#!/usr/bin/perl

use strict;
my $file=shift;

    my $pid;
    if (!defined($pid = fork)) {
        die "Cannot fork: $!";
    }
    elsif ($pid) {
# i am the parent
  system("cat \"$file\" > /proc/$pid/fd/0");
    }
    # else I'm the child
  exec @ARGV;
