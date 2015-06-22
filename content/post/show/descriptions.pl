#!/usr/bin/perl 

use strict;
use warnings;

open(my $desc_fh, ">descriptions.txt");

foreach my $file (<*html>) {
    print("Processing $file");

    open(my $in_fh, $file);

    print $desc_fh "\n\n----------------------------------------\n$file\n";

    my $end_frontmatter = 0; 

    foreach my $line (<$in_fh>) {
        if ($line =~ m/^---/) {
            $end_frontmatter++
        }
        elsif ($end_frontmatter == 2) {
            print $desc_fh $line;
        }
    }

    close($in_fh);    
}

close($desc_fh);

