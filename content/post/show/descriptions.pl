#!/usr/bin/perl 

use strict;
use warnings;

my $licence = '<p class="show-license">License for this track: Creative Commons Attribution-ShareAlike 3.0 Unported License (creativecommons.org/licenses/by-sa/3.0/). Attribution: by Ruben Schade – more info at onsug.com</p>'. "\n\n";

my $release = "\n\n". '<p class="show-release">Released DATE on The Overnightscape Underground (onsug.com), an Internet talk radio channel focusing on a freeform monologue style, with diverse and fascinating hosts; this host notwithstanding!</p>'. "\n\n";


open(my $desc_fh, ">descriptions.txt");

foreach my $file (<*html>) {
    open(my $in_fh, $file);

    print $desc_fh ("\n\n--------------------------------------------------------------------------------------------------------\n");

    my $end_frontmatter = 0; 

    my $duration = "00:00";
    my $download = "http://SOMETHING/";
    my $title = "TITLE HERE";
    my $summary = "SUMMARY";
    my $url;
    my $date;

    foreach my $line (<$in_fh>) {
        $duration = &get_quote($line) if ($line =~ m/^enclosure_duration:/);
        $download = &get_quote($line) if ($line =~ m/^enclosure_url:/);        
        $date = &get_quote($line)     if ($line =~ m/^date/);
        $url = &get_quote($line)      if ($line =~ m/^enclosure_file/);

        $line =~ s/"show-description">/"show-description"><span class="show-duration" style="font-weight:bold">$duration<\/span> – /;
        $line =~ s/float:right/float:left/;
        $line =~ s/0 0 10px 20px;/;/;

        if ($line =~ m/^title/) {
            $title = &make_title($line);
            print "1. Title is now $title\n";
        }
        elsif ($line =~ m/^summary/) {
            $summary = &get_quote($line);
            $summary =~ s/\!$//;
            $summary =~ s/\.//;
            $title =~ s/: /: $summary/;
        }
        elsif ( ($line =~ m/^---/) && ($end_frontmatter == 1) ) {
            print $desc_fh "$title\n\n";
            print $desc_fh "$url\n\n";
            $end_frontmatter++;
        }
        elsif ($line =~ m/^---/) {
            $end_frontmatter++;
        }
        elsif ($end_frontmatter == 2) {
            unless ( ($line =~ m/You can also/) || ($line =~ m/Download MP3/) || ($line =~ m/Download episode/) || ($line =~ m/show-summary/) ) {
                print $desc_fh $line;
            }
        }

    }

    #print $desc_fh $licence;

    print $desc_fh &make_release($date);

    close($in_fh);
}

close($desc_fh);


sub get_quote {
   my $line = shift;

   my @split = split(m/"/, $line);
   return $split[1];
}


sub make_title {
   my $line = shift;
   $line = &get_quote($line);

   $line =~ s/Jan/01/;
   $line =~ s/Feb/02/;
   $line =~ s/Mar/03/;
   $line =~ s/Apr/04/;
   $line =~ s/May/05/;
   $line =~ s/Jun/06/;
   $line =~ s/Jul/07/;
   $line =~ s/Aug/08/;
   $line =~ s/Sep/09/;
   $line =~ s/Oct/10/;
   $line =~ s/Nov/11/;
   $line =~ s/Dec/12/;

   $line =~ s/2015/15/;
   $line =~ s/2009/09/;
   $line =~ s/2008/08/;
   $line =~ s/2007/07/;
   $line =~ s/2006/06/;
   $line =~ s/2005/05/;
   $line =~ s/2004/04/;

   ## For Rubenerd Show 021 (Mon 12/Jan/2015)
   if ($line =~ m/\(/) {
       $line =~ s/\// /g;
       $line =~ s/\(/ /g;
       $line =~ s/\)/ /g;
       
       my @split = split(m/ /, $line);
       return "$split[0] $split[1] $split[2]:  ($split[6]/$split[5]/$split[7])";
   }
   
   ## For Rubénerd Show 280 2014.01.01
   else {
       $line =~ s/\./ /g;
       $line =~ s/\-/ /g;
       my @split = split(m/ /, $line);
       return "$split[0] $split[1] $split[2]:  ($split[4]/$split[5]/$split[3])";
   }

}


sub make_release {
    ## 2015-05-01T12:00:00+10:00
    my $date = shift;
    my @split = split(m/\-/, $date);
    
    my @months = qw/ZERO January Feburary March April May June July August September October November December/;
    my $month = @months[$split[1]];

    my $year = $split[0];

    my $return = $release;
    $return =~ s/DATE/$month $year/;
    return $return; 
}

