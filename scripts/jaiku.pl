#!/usr/bin/perl -w

use strict;
use warnings;

foreach my $file (<*html>) {
    open (IN,$file);
    open (OUT,">./OUT/$file");

    foreach my $line (<IN>) {
        if ($line =~ m/category: jaiku/) {
            print OUT "category: museum\ntags:\n- from-jaiku\n";
        } else {
            print OUT $line;
        }
    }

    close(IN);
    close(OUT);
}
