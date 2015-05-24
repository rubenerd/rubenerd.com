#!/usr/bin/perl -w

use strict;
use warnings;
use 5.010;

## Alternative to say $#files;
##say scalar @files;

sub main {
    open(OUT,">out.html");

    print OUT "---\n".
        'title: "Jaiku 2008-08"'. "\n".
        'date: "2008-08-16T07:05:00+08:00"'. "\n".
        "categories:\n".
        "- Museum\n".
        "tags:\n".
        "- from-jaiku\n".
        "---\n".
        "<p>These originally appeared on <a href=\"http://rubenerd.jaiku.com/\">Jaiku</a>, which Google bought and shut down.</p>\n".
        "<dl>\n\n";

    foreach my $file (<*html>) {
        open(POST,$file);
        my $post_data = "";

        foreach my $line (<POST>) {
            if ($line =~ m/^title/) {
                print("Processing: $line");
                $post_data .=  "<dt>". &pull_quote($line). "</dt>\n";
            } elsif ($line =~ m/^date/) {
                my $date = &pull_date($line);
                $post_data .= '<dd><time datetime="'. $date. '">'. $date. "</time> ";
            } elsif ($line =~ m/^\<p\>/) {
                $post_data .= 'on <a href="'. &process_permalinks($line). '">Jaiku</a></dd>'. "\n\n";
            }
        }

        close(POST); 
        print OUT "$post_data";
    }

    print OUT "</dl>\n";
    close(OUT);
}

sub pull_quote {
    my $line = shift;
    my @split = split(m/\"/, $line);
    return $split[1];
}

sub pull_date {
    my $date = shift;
    chomp $date;
    $date =~ s/date: //;
    return $date;
}

sub process_permalinks {
    my $line = shift;
    my @split = split(m/\"/, $line);
    my $line = $split[3];
    return $line;
}

exit(&main());












