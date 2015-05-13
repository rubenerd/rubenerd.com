#!/usr/bin/env perl

use strict;
use warnings;

foreach my $file (<*html*>) {
    my @split = split(m/\-/, $file);
    my $rename = "@split[3..$#split]";
    $rename =~ s/\ /\-/g;
    `mv $file $rename`; 
    
    #open(HANDLE, $file);

    #foreach my $line (<HANDLE>) {
    #    if ($line =~ m/^date/) {
    #        $line =~ s/T|\:|\+/\-/g;
    #        $line =~ s/\"|\ //g;
    #        my @parts = split(m/\-/, $line);
    #        my $date = "@parts[1..5]";
    #        $date =~ s/\ //g;
    #        print "Setting date of $file to $date ...\n";
    #        system("touch -t $date $file");
    #    }
    #}
}
