---
title: "Apple Lossless versus FLAC"
date: "2016-04-26T12:14:00+10:00"
category: Thoughts
tag:
- media
- audio
- alac
- apple
- apple-lossless
- flac
- music
---
As you can [tell by the archive], I've been podcasting (terrible stuff) for a while. I've also got a significant archive of other recoded audio (events, snippets, audio journals) that may one day find themselves in a podcast, or other audio production. For this irreplacable audio, I trust [FLAC].

FLAC is a free, lossless encoder that expands out to the original, uncompressed audio. This contrasts with AAC, MP3 or OGG Vorbis that compresses by irreversably removing information. It's the same as PNG versus JPG, or Carl's Jr versus Burger King (though now I'm a veg, it's a moot point).

<p style="font-style:italic" class="aside">(I’ve gone on record saying FLAC is a waste of time for anime fansubbers. Considering you’re pairing it with video you’ve compressed the crap out of, I see no point using lossless audio that’s audibly indistinguisable to 320kbps lossy AAC).</p>

A shortcoming of FLAC (depending on your view) is its limited commercial support. My beloved [MPV] can play it, but any audio imported into iTunes et.al. won't work. For that, we've had Apple Lossless, thought that's encumbered by royalties and closed source software.

Or at least, so I thought. According to the [official Apple Lossless Audio Codec site], the format has been Apache licenced and royalty free since 2011. This is great news. 

The main draw for FLAC seems to be its CRC information, which allows archived files to report data corruption. ALAC depends on the due dilligence of the file system and OS to copy files correctly; though if you're serious about archiving you're using ZFS anyway.

### ALAC and FLAC performance compared

I use [avconv] and/or [FFmpeg] \(depending on the whims of package managers) for most of my post-production work, so was intruiged to discover I could encode and decode ALAC files with it this whole time!

To test, I let avconv encode a 10 minute WAV file with ALAC and FLAC. ALAC's native file extension is the ambiguous m4a container, so I added alac.

    $ avconv -i electroboom.wav -c:a alac electroboom.alac.m4a
    $ avconv -i electroboom.wav -c:a flac electroboom.flac

The size difference was negligable. The original WAV and a 128Kbps MP3 are included for reference:

    $ ls -lh .
    ==>  42M Apr 26 11:44 electroboom.alac.m4a
    ==> 106M Apr 26 11:42 electroboom.wav
    ==>  41M Apr 26 11:44 electroboom.flac
    ==> 9.6M Feb  2 00:33 electroboom.mp3

So it seems compatibility in some environments is the main draw for ALAC. If you already have a FLAC library, there’s probably not much to be gained converting. As I'm an "Apple fanboi" (or however the trolls are spelling it thesedays), I'll likely switch to ALAC just for convenience. 

[tell by the archive]: https://rubenerd.com/show/
[FLAC]: https://xiph.org/flac/
[MPV]: https://mpv.io/
[official Apple Lossless Audio Codec site]: https://alac.macosforge.org/
[avconv]: https://libav.org/avconv.html
[ffmpeg]: https://ffmpeg.org/

