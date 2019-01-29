---
title: "Elements.pm"
date: "2016-01-13T10:29:00+10:00"
abstract: "The greatest hash of all time"
year: "2016"
category: Software
tag:
- chemistry
- hashes
- perl
location: sydney
---
Perl legend (monk, you could say) Brian D. Foy [recently commited] this amazing hash to his Elements.pm:

    my %elements = map { state $n = 0; $n++; $_ => $n, $n => $_ } qw(
    H                                                                                                He    
    Li Be                                                                           B  C   N  O   F  Ne    
    Na Mg                                                                          Al Si   P  S  Cl  Ar    
    K  Ca                                           Sc Ti  V Cr Mn Fe Co Ni Cu Zn  Ga Ge  As Se  Br  Kr    
    Rb Sr                                            Y Zr Nb Mo Tc Ru Rh Pd Ag Cd  In Sn  Sb Te   I  Xe    
    Cs Ba La Ce Pr Nd Pm Sm Eu Gd Tb Dy Ho Er Tm Yb Lu Hf Ta W  Re Os Ir Pt Au Hg  Tl Pb  Bi Po  At  Rn    
    Fr Ra Ac Th Pa U  Np Pu Am Cm Bk Cf Es Fm Md No Lr Rf Ha Sg Bh Hs Mt Ds Rg Cn Uut Fl Uup Lv Uus Uuo    
    );

I'll bet he can't wait till those new elements get new names with 2 character abbreviations!

[recently commited]: https://github.com/briandfoy/chemistry-elements/blob/6963313deec4585d6aad3a25f199ca4ce2a23590/lib/Chemistry/Elements.pm#L210-L218

