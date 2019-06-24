---
title: "Next macOS to use zsh by default"
date: "2019-06-04T15:39:55+10:00"
abstract: "This is great news! And for bash fans, the same advise they gave me for 10.4 Tiger applies."
year: "2019"
category: Software
tag:
- apple
- bash
- bsd
- bourne-shell
- mac-os-x
- macos
- os-x
- shells
- zsh
location: Sydney
---
I haven't followed WWDC 2019 beyond the long-awaited [Mac Pro announcement](https://rubenerd.com/relief-for-the-2019-mac-pro/), but I'm stoked for this news.

* `zsh` is a far better interactive shell than `bash`. It's more extensible, its auto-complete is faster, `autopushd` is wonderful, and from my selfish perspective it closer matches `ksh`, my [current shell](https://rubenerd.com/bzip2-and-kornshell-fun/) family of choice.

* It's MIT/BSD-ish licenced. I prefer this to the GPL for reasons that are beyond the scope of this post, but clearly so does Apple based on their development and support for llvm and Darwin's BSD userland.

* For scripts, people should be writing [Bourne-shell code](https://linux.die.net/man/1/checkbashisms "Check your code with checkbashisms!") anyway. I know I'm fighting a losing battle here, but portability and correctness are important.

* `bash` may be a pun, but it sounds aggressive. Pronouncing `zsh` sounds like a hipster fruit juice.

`bash` fans may be disappointed or frustrated by the decision. But to them I repeat their advice given simultaneously nicely, and condescendingly, when 10.4 Tiger replaced `tcsh`: you'll still be able to run it, and you can always swap it back if you want. 

