---
layout: page
title: Software I use
---
This page lists the stuff I use on a regular basis. Head over to the [Engine Room](https://rubenerd.com/omake/engine-room/) for specifics on what runs my site here.

### Contents

* [Daily carry and FreeBSD tower](#carry)
* [Work Macs](#work)
* [Firefox Plugins](#firefox)
* [Console tools](#console)
* [Self-hosted](#self)
* [DOS nostalgia](#dos)


<h3 id="carry">Daily carry and FreeBSD tower</h3>

I always have a tiny Panasonic Let's Note on me, mostly for when I'm on call, but also for personal projects at coffee shops. See [Console tools](#console) below for non-GUI stuff.

* [FreeBSD 12.1-RELEASE](https://freebsd.org/) and -STABLE
* [G\*mp](https://www.freshports.org/graphics/gimp/)
* [Inkscape](https://www.freshports.org/graphics/inkscape/)
* [KeePassXC](https://www.freshports.org/security/keepassxc/)
* [Mozilla Firefox](https://www.freshports.org/www/firefox/)
* [mpv](https://www.freshports.org/multimedia/mpv/)
* [oksh](https://www.freshports.org/shells/oksh/)
* [ScummVM](https://www.freshports.org/games/scummvm/)
* [TeX Live](https://www.freshports.org/print/texlive-full/)
* [Xfce](https://www.freshports.org/x11-wm/xfce4)


<h3 id="work">Work Macs</h3>

My work machines have been MacBook Pros for many years, mostly because there are specific business tools that don't run nicely in Wine, and because I can't stand Windows anymore.

* [macOS](https://www.apple.com/macos/)
* [homebrew cask](https://brew.sh/), for GUI applications
* [pkgsrc](http://pkgsrc.joyent.com/install-on-osx/), for everything else
* [emacs](https://formulae.brew.sh/formula/emacs)
* [GoToMeeting](https://formulae.brew.sh/cask/gotomeeting)
* [LibreOffice](https://formulae.brew.sh/cask/libreoffice)
* [Little Snitch](https://formulae.brew.sh/cask/little-snitch)
* [MacTeX](https://formulae.brew.sh/cask/mactex)
* [MacVim](https://formulae.brew.sh/formula/macvim)
* [Mattermost](https://formulae.brew.sh/cask/mattermost)
* [Microsoft Office](https://formulae.brew.sh/cask/microsoft-office), with Outlook (unfortunately)
* [Mozilla Firefox](https://formulae.brew.sh/cask/firefox)
* [nvALT](https://formulae.brew.sh/cask/nvalt)
* [Terminal.app], with the [Pencil Light] theme by [mattly]
* [The Unarchiver](https://formulae.brew.sh/cask/the-unarchiver)
* [Viscosity](https://formulae.brew.sh/cask/viscosity)
* [xquartz](https://formulae.brew.sh/cask/xquartz)

[mattly]: https://github.com/mattly/iterm-colors-pencil
[Pencil Light]: https://github.com/mbadolato/iTerm2-Color-Schemes
[Terminal.app]: https://en.wikipedia.org/wiki/Terminal_(macOS)


<h3 id="firefox">Firefox plugins</h3>

Been a user since the Phoenix days. Quantum is pretty good.

* [British English Dictionary (Marco Pinto)](https://addons.mozilla.org/en-GB/firefox/addon/british-english-dictionary-2/)
* [Decentraleyes](https://addons.mozilla.org/en-GB/firefox/addon/decentraleyes/)
* [HTTPS Everywhere](https://addons.mozilla.org/en-GB/firefox/addon/https-everywhere/)
* [KeePassXC-Browser](https://addons.mozilla.org/en-GB/firefox/addon/keepassxc-browser/)
* [NoScript Security Suite](https://addons.mozilla.org/en-SG/firefox/addon/noscript/)
* [Tree Style Tab](https://addons.mozilla.org/en-GB/firefox/addon/tree-style-tab/)
* [uBlock Origin](https://addons.mozilla.org/en-GB/firefox/addon/ublock-origin/)


<h3 id="console">Console tools (personal and work)</h3>

These all reference their [pkgsrc](https://pkgsrc.se/) pages, though are also available on FreeBSD Ports, Debian apt, and Homebrew.

* **archivers/** [lz4], [lzip]
* **audio/** [eyeD3], [flac], [normalize]
* **benchmarks/** [dnsperf], [fio]
* **games/** [cmatrix]
* **devel/** [colordiff], [git], [subversion]
* **editors/** [emacs], [vim]
* **emulators/** [qemu], [wine]
* **filesystems/** [fuse], [fuse-ext2], [fuse-ntfs-3g], [fuse-sshfs]
* **graphics/** [ImageMagick], [jpegoptim], [pngcrush]
* **lang/** [perl5], [python3]
* **misc/** [colorize], [colorls], [cowsay], [figlet], [tmux], [watch]
* **multimedia/** [ffmpeg], [handbrake-cli], [libdvdcss], [MKVtoolnix]
* **net/** [aria2], [arping], [bwm-ng], [mosh], [mtr], [ncftp], [nmap], [openvpn], [rsync], [tcpdump], [youtube-dl]
* **security/** [certbot], [dcfldd], [openssl], [sudo]
* **sysutils/** [ansible], [ddrescue], [pv], [smartmontools], [testdisk], [tree]
* **textproc/** [docbook], [py-mkdocs], [the_silver_searcher], [texlive-collection-latex], [WordNet]
* **(elsewhere)**: [checkbashisms], [dnstwist], [internetarchive], [plzip]

[ansible]: https://pkgsrc.se/sysutils/ansible
[aria2]: https://pkgsrc.se/net/aria2
[arping]: https://pkgsrc.se/net/arping
[bwm-ng]: https://pkgsrc.se/net/bwm-ng
[certbot]: https://pkgsrc.se/security/py-certbot
[checkbashisms]: https://sourceforge.net/projects/checkbaskisms/files/2.0.0.2/
[cmatrix]: https://pkgsrc.se/games/cmatrix
[colordiff]: https://pkgsrc.se/devel/colordiff
[colorize]: https://pkgsrc.se/misc/colorize
[colorls]: https://pkgsrc.se/misc/colorls
[cowsay]: https://pkgsrc.se/misc/cowsay
[dcfldd]: https://pkgsrc.se/security/dcfldd
[dnsperf]: https://pkgsrc.se/benchmarks/dnsperf
[ddrescue]: https://pkgsrc.se/sysutils/ddrescue
[dnstwist]: https://github.com/elceef/dnstwist
[docbook]: https://pkgsrc.se/textproc/docbook
[eyeD3]: https://pkgsrc.se/audio/eyeD3
[emacs]: https://pkgsrc.se/editors/emacs
[ffmpeg]: https://pkgsrc.se/multimedia/ffmpeg4
[figlet]: https://pkgsrc.se/misc/figlet
[fio]: https://pkgsrc.se/benchmarks/fio
[fuse]: https://pkgsrc.se/filesystems/fuse
[fuse-ext2]: https://pkgsrc.se/filesystems/fuse-ext2
[fuse-ntfs-3g]: https://pkgsrc.se/filesystems/fuse-ntfs-3g
[fuse-sshfs]: https://pkgsrc.se/filesystems/fuse-sshfs
[flac]: https://pkgsrc.se/audio/flac
[git]: https://pkgsrc.se/devel/git-base
[handbrake-cli]: https://pkgsrc.se/multimedia/handbrake
[ImageMagick]: https://pkgsrc.se/graphics/ImageMagick
[internetarchive]: https://archive.org/services/docs/api/internetarchive/cli.html
[libdvdcss]: https://pkgsrc.se/multimedia/libdvdcss
[jpegoptim]: https://pkgsrc.se/graphics/jpegoptim
[lz4]: https://pkgsrc.se/archivers/lz4
[lzip]: https://pkgsrc.se/archivers/lzip
[MKVtoolnix]: https://pkgsrc.se/multimedia/mkvtoolnix
[mosh]: https://pkgsrc.se/net/mosh
[mtr]: https://pkgsrc.se/net/mtr
[ncftp]: https://pkgsrc.se/net/ncftp3
[nmap]: https://pkgsrc.se/net/nmap
[normalize]: https://pkgsrc.se/audio/normalize
[openssl]: https://pkgsrc.se/security/openssl
[openvpn]: https://pkgsrc.se/net/openvpn
[perl5]: https://pkgsrc.se/lang/perl5
[pngcrush]: https://pkgsrc.se/graphics/pngcrush
[plzip]: https://www.nongnu.org/lzip/plzip.html
[pv]: https://pkgsrc.se/sysutils/pv
[py-mkdocs]: https://pkgsrc.se/textproc/py-mkdocs
[python3]: https://pkgsrc.se/lang/python38
[qemu]: https://pkgsrc.se/emulators/qemu
[rsync]: https://pkgsrc.se/net/rsync
[smartmontools]: https://pkgsrc.se/sysutils/smartmontools
[sshuttle]: https://github.com/sshuttle/sshuttle
[subversion]: https://pkgsrc.se/devel/subversion
[sudo]: https://pkgsrc.se/security/sudo
[tcpdump]: https://pkgsrc.se/net/tcpdump
[testdisk]: https://pkgsrc.se/sysutils/testdisk
[texlive-collection-latex]: https://pkgsrc.se/meta-pkgs/texlive-collection-latex
[the_silver_searcher]: https://pkgsrc.se/textproc/the_silver_searcher
[tree]: https://pkgsrc.se/sysutils/tree
[tmux]: https://pkgsrc.se/misc/tmux
[vim]: https://pkgsrc.se/editors/vim
[watch]: https://pkgsrc.se/misc/watch
[wine]: https://pkgsrc.se/emulators/wine
[WordNet]: https://pkgsrc.se/textproc/WordNet
[youtube-dl]: https://pkgsrc.se/net/youtube-dl


<h3 id="self">Self-hosted</h3>

Virtual cloud servers on [OrionVM](https://www.orionvm.com/) in Australia and the US, and AWS in Singapore.

* [FreeBSD 12.1-RELEASE](https://freebsd.org/)
* [Debian 10 Buster](https://debian.org/)
* [Gitea](https://docs.gitea.io/en-us/), for self-hosted Git
* [Hugo](https://gohugo.io/), for blogging
* [Lychee](https://lychee.electerious.com/), for family photo management
* [MariaDB](https://mariadb.org/), because it's easier having one DB for everything
* [PleX](https://www.freshports.org/multimedia/plexmediaserver/), on my HP Microserver at home
* [TinyTinyRSS](https://tt-rss.org/), for blog reading

I'm still looking for decent self-hosted versions of Apple Music, et.al.


<h3 id="dos">DOS nostalgia box</h3>

I still run DOS for nostalgia and fun on my old beige tower from the 1990s. This section will be spun off into its own page at some point. Some links are pending.

* MS-DOS 6.20 [sic], the last version we got on floppies
* Brown Bag Software PowerMenu 2.1
* [Central Point PC Tools 8.0](https://en.wikipedia.org/wiki/PC_Tools_(Central_Point_Software))
* Compex ReadyLINK RL2000-PCI drivers
* [FastVid](http://www.mdgx.com/umb.htm#FVD), for accelerated PCI VGA performance
* [Iomegaware](https://archive.org/details/iomegaware-oem-1.1.3) for Zip, Jaz, and Ditto drives
* [Matrox Mystique graphics drivers](https://www.matrox.com/en/video/apps/drivers/graphics/previous/legacy/older_operating_system), for Windows 3.1x
* [Microsoft Mouse](https://winworldpc.com/product/microsoft-mouse/9x), because CuteMouse et.al. still have problems
* [mTCP](https://www.brutman.com/mTCP/mTCP.html), for bootstrapping new installs
* [SHSUCD](http://adoxa.altervista.org/shsucdx/index.html), for CD-ROMs and ISOs
* [Sound Blaster AWE64 drivers](https://archive.org/details/creative-sound-blaster-awe64-plug-and-play), used for my AWE32 card
