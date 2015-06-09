#!/usr/bin/perl -w

foreach my $file (<*html>) {
    open (IN, $file);

    my $duration;

    foreach my $line (<IN>) {
        $line =~ s/,//g;
        $line =~ s/<\/a><\/p>//g;

        #if ($line =~ m/class\=\"mp3\"/) {
        if ( !($line =~ m/^enclosure/ ) && 
           ($line =~ m/archive\.org\/download\//) &&
           ($line =~ m/mp3/ ) ) {
            my @split = split(m/\ /, $line);
            
            foreach my $part (@split) {
                if ($part =~ m/[0-9]:[0-9]/) { 
                    $duration = $part;
                }
            }
        }
    }

    close (IN);
    open (IN, $file);
    open (OUT, ">./OUT/$file");
    
    foreach my $line (<IN>) {
        print OUT $line;
        if ($line =~ m/enclosure_size/) {
            print OUT "enclosure_duration: \"$duration\"\n";
        }
    }
}

