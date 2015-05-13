#!/usr/bin/env perl

use strict;
use warnings;

foreach my $show (<*html>) {
  my $found = "false";
  open(SHOW, $show);
  #print ("INSPECTING $show...\n");
  while(<SHOW>) {
    $found = "true" if ($_ =~ m/^enclosure_size/);
  }
  close(SHOW);
  
  print "THIS HAS NO SIZE: $show\n" if ($found eq "false");
}