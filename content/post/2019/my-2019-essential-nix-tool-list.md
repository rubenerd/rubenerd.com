---
title: "My 2019 essential tool list"
date: "2019-07-16T07:57:30+10:00"
abstract: "Tools I use on FreeBSD, NetBSD, Debian, and macOS."
year: "2019"
category: Software
tag:
- apple
- bsd
- freebsd
- linux
- macos
- netbsd
location: Sydney
---
Every few years I collate a list of the shell tools I use, in the hopes it might be useful to someone. These install on my [FreeBSD], [NetBSD], [macOS], and [Debian] boxes, unless otherwise stated. Most package names are derived from [pkgsrc], but should be similar in others package managers. BSD/MIT licenced packages or similar have a <span style="color:green">green ♥</span> because they make me especially happy.

This list does not include fully-fledged ncurses or console applications, like IRC clients or music players. As FedEx would say, those are for another post. Ah man, so good.

[FreeBSD]: https://www.freebsd.org/
[NetBSD]: https://www.netbsd.org/
[macOS]: https://www.apple.com/macos/
[Debian]: https://www.debian.org/
[pkgsrc]: https://pkgsrc.se/


### Utilities
* [`ag`](https://geoff.greer.fm/ag/): fast `grep` alternative <span style="color:green">️♥</span>
* [`ansible`](https://www.ansible.com/): easiest orchestration system <!-- GPL -->
* [`aria2`](https://aria2.github.io/): parallel `curl`/`fetch`/`wget` replacement with torrent support <!-- GPL -->
* [`checkbashisms`](https://sourceforge.net/projects/checkbaskisms/): to verify script portability <!-- GPL -->
* [`colordiff`](https://www.colordiff.org/): nice syntax highlighting for `diff` <!-- GPL -->
* [`colorize`](https://github.com/raszi/colorize): nice syntax highlighting for logs
* [`fd`](https://github.com/sharkdp/fd): high-performance `find` alternative <span style="color:green">️♥</span>
* [`htop`](https://hisham.hm/htop/): nicer `top`, especially useful for visualising CPUs <!-- GPL -->
* [`lsof`](https://people.freebsd.org/~abe/): list open files <span style="color:green">️♥</span>
* [`lzop`](https://www.lzop.org/): ultra fast compression for temporary file transfers
* [`oksh`](https://github.com/ibara/oksh): Portable OpenBSD KornShell, my current preferred shell <span style="color:green">️♥</span>
* [`p7zip`](https://p7zip.sourceforge.net/): for extracting 7zip files Windows people send me <!-- LGPL -->
* [`plzip`](https://www.nongnu.org/lzip/plzip.html) for parallel compression with safe integrity checks <!-- GPL -->
* [`sqlite3`](https://sqlite.org): alongside other things, I also use for personal DBs
* [`sudo`](https://www.sudo.ws/): auditable super user interface
* [`tmux`](https://github.com/tmux/tmux/wiki): detach sessions, like `screen` <span style="color:green">️♥</span>
* [`tree`](http://mama.indstate.edu/users/ice/tree/): display directories as trees, DOS style <!-- GPL -->
* [`watch`](https://gitlab.com/procps-ng/procps/): periodically run process to review changes <!-- GPL -->

### Disks
* [`dcfldd`](http://dcfldd.sourceforge.net/): no more piping `dd` to `lv` for copying blocks with a progress bar <!-- GPL -->
* [`ddrescue`](https://www.gnu.org/software/ddrescue/): data recovery and robust disk copying <!-- GPL -->
* [`fio`](https://linux.die.net/man/1/fio): flexible IO performance tester <!-- GPL -->
* [`iotop`](http://guichaz.free.fr/iotop/): easy disk activity monitor <!-- GPL -->
* [`qemu-utils`](https://www.qemu.org/download/): disk image conversion from the legendary emulator <!-- GPL -->
* [`smartmontools`](https://www.smartmontools.org/): SMART drive monitoring and reporting <!-- GPL -->
* [`testdisk`](https://www.cgsecurity.org/wiki/TestDisk): partition analyser and recovery tool <!-- GPL -->

### Entirely pointless
* [`cmatrix`](https://www.asty.org/cmatrix/): Matrix emulator (pity that movie didn't have sequels) <!--GPL -->
* [`cowsay`](https://web.archive.org/web/20071026043648/http://www.nog.net/~tony/warez/cowsay.shtml): echoes Copy on Write drive structures... yes, that's it
* [`figlet`](http://www.figlet.org/): cute text banners in a variety of different styles/fonts
* [`lolcat`](https://github.com/busyloop/lolcat): such colour, so rainbow <span style="color:green">️♥</span>
* [`neofetch`](https://github.com/dylanaraps/neofetch): pretty system information <span style="color:green">️♥</span>

### Writing, blogging, podcasting
* [`docbook`](https://docbook.org/): still the standard for online technical docs
* [`exiftool`](https://sno.phy.queensu.ca/~phil/exiftool/): reads EXIF data from images 
* [`eyeD3`](https://pypi.org/project/eyeD3/): for batch processing ID3 tags in MP3s
* [`ffmpeg4`](https://ffmpeg.org/): video processing Swiss Army Kife
* [`go-hugo`](https://gohugo.io/): fastest static site generator 
* [`ImageMagick`](https://www.imagemagick.org/): image processing Swiss Army Knife
* [`jpegoptim`](https://github.com/tjko/jpegoptim): lossless [sic] JPEG image optimiser
* [`mkdocs`](https://www.mkdocs.org/): web documentation generator from Markdown <span style="color:green">️♥</span>
* [`normalize`](https://www.nongnu.org/normalize): normalise, incorrectly spelled, across audio files
* [`pngcrush`](https://pmt.sourceforge.io/pngcrush): lossless PNG optimiser
* [`svgcleaner`](https://github.com/RazrFalcon/SVGCleaner): correct, minify SVG images
* [`tesseract`](https://github.com/tesseract-ocr/tesseract): simple to use image OCR <span style="color:green">️♥</span>
* [`wn`](https://wordnet.princeton.edu/): the WordNet lexical database of English <span style="color:green">️♥</span>
* [`youtube-dl`](https://youtube-dl.org/): download videos from YouTube, Vimeo, etc <span style="color:green">️♥</span>

### Networking (for a non-networking guy!)
* [`2ping`](https://www.finnie.org/software/2ping/): bi-directional `ping` testing
* [`arping`](https://github.com/ThomasHabets/arping): layer 2 ping (Thomas Habets version)
* [`bwm_ng`](https://github.com/vgropp/bwm-ng): next-gen bandwidth monitor
* [`links`](http://links.twibright.com): quick console browsing in a pinch; I don't need `elinks`
* [`mosh`](https://mosh.org/): interactive SSH replacement for high-latency connections
* [`mtr`](https://www.bitwizard.nl/mtr/): `traceroute` and `ping` in one tool
* [`ncftp`](http://www.ncftpd.com/ncftp/): because yes, FTP still exists in 2019
* [`nmap`](https://nmap.org/): port scanner for firewall testing... yes, that'll do
* [`rsync`](https://rsync.samba.org): still the best sane data transferer
* [`sshfs`](https://github.com/libfuse/sshfs): quick and dirty remote disk mounts over SSH
* [`sshuttle`](https://github.com/sshuttle/sshuttle): quick and dirty VPN over ssh
* [`tcpdump`](https://www.tcpdump.org/): quick way to inspect NIC traffic without Wireshark <span style="color:green">️♥</span>

### OS specific
* [`debian-goodies`](https://packages.debian.org/stretch/debian-goodies): lots of useful apt package tools *(Debian)*
* [`docproj`](https://www.freshports.org/textproc/docproj): metapackage for FreeBSD documentation *(FreeBSD)* <span style="color:green">️♥</span>
* [`firehol`](https://github.com/ktsaou/firehol): simple Linux iptables *(Debian)*
* [`iocage`](https://iocage.io): super easy, ZFS-enabled jail interface  *(FreeBSD)* <span style="color:green">️♥</span>
* [`mactex`](https://www.tug.org/mactex/): everything you need for LaTeX on Mac *(macOS)*
* [`mas`](https://github.com/mas-cli/mas): shell interface to the Mac App Store *(macOS)* <span style="color:green">️♥</span>
* [`pkgsrc`](http://pkgsrc.se): replaced Homebrew with it, thanks NetBSD! *(macOS)* <span style="color:green">️♥</span>
* [`reprepro`](https://wiki.debian.org/DebianRepository/SetupWithReprepro): apt repository and package generator *(Debian)*
* [`tag`](https://github.com/jdberry/tag/): manipulate macOS extended attribute tags *(macOS)* <span style="color:green">️♥</span>

