#!/usr/bin/perl -w

use strict;
use warnings (FATAL => 'all');
use utf8;

#######
## Boilerplate script to batch process text files
## Ruben Schade, March 2005, Simplified BSD licenced

sub main {
  ## Make directory for output files
  system('rm -rf ./OUT');
  system('mkdir ./OUT');

  ## Run through each file
  foreach my $file (<*html>) {
    open(my $fin, $file) || die "Can't open input file";
    open(my $fout, ">./OUT/$file") || die "Can't open output file";
    
    ## Strip out date from permalink
    my @name_with_date = split(m/-/, $file);
    my $permalink = $name_with_date[3];
    for (my $i = 4; $i < @name_with_date; $i++) {
      $permalink = $permalink. "-". $name_with_date[$i];
    }
    $permalink =~ s/\.html//;
    print($permalink);

    foreach my $line (<$fin>) {
      $line =~ s/^--- /---/;                    ## Remove spaces after frontmatter marker
      $line =~ s/category: /categories: \n- /;  ## Change single category to list

      $line =~ s/layout: post/layout: post\npermalink: $permalink/;

      if ($line =~ m/^date:/) {
        $line =~ s/: /:"/;         ## Add start quote, remove space
        $line =~ s/ \n/"\n/;       ## Add end quote
        $line =~ s/ \+/\+/;        ## Remove space before timezone
        $line =~ s/ /T/;           ## Replace remaining space with T
        $line =~ s/date:/date: /;  ## Add space back after date keyword
        $line =~ s/00"\n/\:00"\n/; ## Add colon for timezone
      }
      print $fout $line;
    }

    close($fin);
    close($fout);
  }

  ## That's a wrap
  return 0;
}

exit(&main);

## EOF

