---
draft: true
title: "Windows 3.1 Cardfile"
date: "2017-04-07T08:39:00+10:00"
abstract: "Remeber Cardfile? I used tons of these!"
category: Infocomm
tag:
- software
- cardfile
- notational-velocity
- nvalt
- windows
- windows-31
---
Remember Cardfile? It was an accessory included in Windows 3.x that presented a series of cards with headings in a cascading stack. You could embed images, arrange them as you wanted, and store multiple stacks in different files.

Hyperlinks were the only critically missing feature, then maybe they could have taken on HyperCard or the WWW.

I used to use them for everything; I grokked them in a way I couldn't with regular text files (or even WordPerfect documents). I kept addresses, primary school notes, stories, ideas, everything in these cards. Years later, I use [Notational Velocity] for the same purpose.

<p style="font-style:italic">(I used the <a href="http://brettterpstra.com/projects/nvalt/">nvALT</a> fork, but it’s gone off the reservation of late. Notational Velocity is abandonware, but still runs great on Sierra).</p>

I don't know what I was searching for to come across it, but Microsoft support has a [Windows 3.1 Card File] Format page! 

> This article documents the file format used by Microsoft Windows version 3.1 Cardfile. Please note that the Cardfile file format (.CRD) may change in future versions. All numbers in this document, including those in the descriptive text, should be interpreted as hexadecimal numerals. All data pointers and count bytes in the file are unsigned binary/hexadecimal integers in least-to-most significant format. All text in the file is saved in low ASCII format. In the text section of a card's data, <CR> is always followed by <LF>.

The first 9 bytes describe the Cardfile document's signature, the last object's ID, and number of cards in the file. After that, you have a block of null terminated cards.

I wonder if anyone leveraged a buffer overflow in Cardfile?

[Notational Velocity]: http://notational.net/ 
[Windows 3.1 Card File]: https://support.microsoft.com/en-us/help/99340/windows-3.1-card-file-format

