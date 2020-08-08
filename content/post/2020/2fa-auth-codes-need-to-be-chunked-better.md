---
title: "Two-factor auth codes need to be chunked better"
date: "2020-06-25T20:20:43+10:00"
abstract: "Visually it’d be much easier if these codes were broken up."
year: "2020"
category: Internet
tag:
- accessibility
- security
- usability
location: Sydney
---
Two-factor authentication over SMS is problematic and increasingly insecure, but it's still in wide use, and better than one-factor authentication. So while we still get these codes sent to us, how can we make them easier to use?

Most sites send a code like this:

> 832416

My favourite maths teacher in high school taught us that chunking is the best way to remember numbers. She said most of us would read the above number in our heads as this:

> Eight Three Two Four One Six

That's six discrete numbers to remember, and potentially mess up. So she challenged us to read the entire thing out loud as a class, as a single number:

> Eight hundred and thirty-two thousand, four hundred and sixteen.

We all laughed at how absurd this long sentence was, but we soon realised she'd done it on purpose. Sneaky Ms Harris. By stringing together numbers like this, we'd read out 832 and 416. Drop the word *thousand*, and you only have two numbers to remember. 2FA developers, please put a space in your numbers.

And while we're at it, I find three two-digit numbers even easier to remember:

> 83 24 16

Eighty-three, twenty-four, and sixteen. *Donezo*.

Curiously, most 2FA tokens I get today are just a single long number. It would be trivial to present these as two or three numbers, and make a huge difference to accessibility and usability. Heck you could probably even extend it to eight digits if this technique were applied.

