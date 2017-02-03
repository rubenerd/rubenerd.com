---
title: "afconvert and avconv performance"
date: "2017-01-29T09:02:00+10:00"
abstract: "avconv is cross platform, but fconvert is marginally faster."
category: Software
tag:
- audio
- avconv
- ffmpeg
- mac-os
- mac-os-x
- music
- os-x
- podcasting
- software
---
My [Rubénerd Show] podcast episodes are produced with a series of shell scripts to save me time and effort, so I'm always looking for ways to optimise them.

Today I learned about Apple's `afconvert` utility. The manpage may as well have been written by GNU given its lack of useful info, but "-h" tells you all you need to know.

Currently I use `avconv` (previously `ffmpeg`) to convert CAFs from my iTelephone to an intermediate format. This is then rendered as FLAC for archival purposes, and MP3 for the podcast feed:

    $ avconv -i "source.caf" "output.aiff"

Through some digging, the `afconvert` equivilent is:

    $ afconvert -f caff -d BEI16 "source.caf" "output.aiff"

But how do they stack up? I ran these three times on the same 201.1MiB source file using `afconvert` in macOS Sierra, and the latest `avconv` from Homebrew:

<table>
<thead>
<tr>
<th>Pass</th>
<th>afconvert</th>
<th>avconv</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>0.416s</td>
<td>1.189s</td>
</tr>
<tr>
<td>2</td>
<td>0.577s</td>
<td>1.339s</td>
</tr>
<tr>
<td>3</td>
<td>0.416s</td>
<td>1.302s</td>
</tr>
</table>

The results from this (albeit limited) test are clear, `afconvert` is faster. Whether I'd notice a second or two difference is another question, but I'll be adjusting the scripts to preference `afconvert` when available.

[Rubénerd Show]: https://rubenerd.com/show/

