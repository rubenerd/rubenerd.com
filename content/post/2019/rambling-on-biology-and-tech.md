---
title: "Rambling on biology and tech"
date: "2019-09-06T17:26:15+10:00"
abstract: "It's sophisticated, fault-tolerant, and secure! And yet it’s still just a calculator."
year: "2019"
category: Hardware
tag:
- architecture
- design
- high-availability
- philosophy
location: Sydney
---
At work today we were running through an architecture diagram for a new client deployment in Sydney and Melbourne. The idea was to use Sydney as the primary, and fail over to Melbourne in a disaster recovery scenario. It sounds simple enough, until you start thinking what fail over means, and what constitutes primary/secondary. Is it at the database level? The applications? What happens to the networks? What about the storage? It can make your head spin when you think through everything that <del>can</del> will go wrong; not to mention human processes which are even more important.

But it wasn't till I was going home afterwards that I made another mental leap. We like to think our systems are sophisticated, fault-tolerant, and secure. We've designed, built, and layered a staggering amount of infrastructure on what really amounts to simple logic gates and addition. The core of our systems have billions of transistors spread across machines around the globe connected with fibre optics and copper and wireless and satellites. But ultimately, they're just calculators.

You compare that to a complex machine like our own bodies. We're obviously weaker in many areas, but we tend to keep going for decades. We're regenerative, we self-heal, we grow. Computers fake this with redundancy, but they simply don't match what we do ourselves inside our bodies without even realising or noticing.

I remember watching Star Trek Voyager and being interested in the idea of *bio-neural* circuitry, not to mention the Borg. While science fiction writers and futurists dream of the singularity, will reality be a melding of the technological and biological?

I suppose with you reading these photons I typed on an electronic device to transmit my thoughts, we're already slowly on our way there. 

