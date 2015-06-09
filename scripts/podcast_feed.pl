#!/usr/bin/env perl -w

use strict;
use warnings;

## Directory containing podcast episode files
my $podcast_directory = "../content/post/show";

## Directory for feed output
my $feed = "../public/show/feed";

## Template for feeed
my $template = "../layouts/taxonomy/podcast.rss.xml";


sub main {
    ## Prepare directory for feed to reside
    `mkdir -p $feed`;

    ## Open export feed file and template
    open(my $feed_handle, ">$feed/index.xml");
    open(my $template_handle, "$template");

    ## Array to store all episode information
    my @episodes;

    ## Parse each episode and add to array
    ## Use unshift instead of push, to invert order
    foreach my $episode_file (<$podcast_directory/*html>) {
        unshift(@episodes, &parse($episode_file));
    }

    ## Run through template, and embed files
    foreach my $line (<$template_handle>) {
        if ($line =~ m/range first/) {
            print $feed_handle @episodes; 
        } else {
            print $feed_handle $line;
        }
    }

    ## Close feed
    close($feed_handle);

    ## That's a wrap
    return 0;
}


sub parse {
    my $file = shift;
    my $export = "<item>\n";

    open(my $file_handle, $file);

    foreach my $line (<$file_handle>) {
        if ($line =~ m/^title/) {
            $export .= '<title>'. &parse_line($line). '</title>'. "\n";
        }
    }

   close($file_handle);
   return $export;
}


sub parse_line {
    my $line = shift;
    chomp $line;
 
    ## Get second piece from "title: something", and remove quotes
    my @values = split(m/: /, $line);
    $values[1] =~ s/"//g;

    return $values[1];
}


exit(&main());
