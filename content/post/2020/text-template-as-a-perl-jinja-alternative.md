---
title: "Text::Template as a Perl Jinja alternative"
date: "2020-06-16T10:42:09+11:00"
abstract: "Jinja2 is Python’s killer app for me. I wanted something the same for Perl."
thumb: "https://rubenerd.com/files/uploads/icon.perlcamelbook.png"
year: "2020"
category: Software
tag:
- perl
- templates
location: Sydney
---
<p style="background:#4095c2 url('https://rubenerd.com/files/2020/perlcamel.png') top right no-repeat; color:#ffffff; font-family:Georgia,serif !important; padding:2em;margin-bottom:1.2em;">Ruben likes<br /><span style="font-size:2.4em; letter-spacing:-1px; margin-bottom:2em;">Programming Perl</span></p>

The Camel Book was my first \*nix programming tome, so even after all these years I couldn't resist making a terrible CSS omage to it! But I digress.

Jinja2 is Python's killer app for me. I'm familiar enough with it from using Ansible scripts and internal work projects, but I'd be the first to admit I only know enough Python to be dangerous. What I'd love is something with similar flexibility and syntax, but using Perl data structures with which I'm more familiar.

I've been playing around with [Text::Template](https://metacpan.org/pod/Text::Template) by Michael Schout, and so far it does *everything* I want. It has substitution, easy iterators, and inline code blocks. You can use it to create everything from mail merged forms to fully-blown website templates.

Here's a simple example of a hash being passed to a template:

    #!/usr/bin/env perl    
        
    use strict;
    use warnings;
    use 5.016;
    use Text::Template;
    binmode(STDOUT, ":utf8");    
        
    ## An example data structure
    my %data(
        name    => 'Kenny Rogers',
        message => 'when to hold it, when to fold it...'
    );    
        
    ## Create a template
    my $template = Text::Template->new(
        ENCODING => 'UTF-8',
        SOURCE   => 'my-template.tmpl',
        TYPE     => 'FILE'
    ) or die "Can't parse template: $Text::Template::ERROR\n";
        
    ## Pass hash to template and print
    my $page = $template->fill_in(HASH => \%data);
    say $page;

And the template:

    Hello {$name}, you told me: {$message}.

Nice! And I can already see how this would integrate with a Moose program. [meta::cpan](https://metacpan.org/pod/Text::Template) has more details.

