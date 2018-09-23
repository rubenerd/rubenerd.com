---
title: "Retina image downscaling with CSS"
date: "2017-12-02T11:45:22+11:00"
year: "2017"
location: Sydney
abstract: ""
year: "2017"
location: Sydney
category: Thoughts
tag:
- 
---
I learned a new CSS trick today! It's possible to make lower resolution images not look like blurry crap on Retina-class displays, and all it takes is a typical phonebook-length list of attributes. From [Phrogz on Stack Overflow]\:

    .pixelated {
        image-rendering:optimizeSpeed;             /* Legal fallback */
        image-rendering:-moz-crisp-edges;          /* Firefox        */
        image-rendering:-o-crisp-edges;            /* Opera          */
        image-rendering:-webkit-optimize-contrast; /* Safari         */
        image-rendering:optimize-contrast;         /* CSS3 Proposed  */
        image-rendering:crisp-edges;               /* CSS4 Proposed  */
        image-rendering:pixelated;                 /* CSS4 Proposed  */
        -ms-interpolation-mode:nearest-neighbor;   /* IE8+           */
    }

You can view my [previous Windows 2000 blog post] on a Retina screen and a modern browser to see this.

Why is this necessary? What a handsome question. Let's say you have a standard, non-Retina display that looks like this:

<pre style="line-height:1em">
╔═══════════════════╗
║                   ║
║                   ║
║                   ║
║                   ║
║                   ║
╚═══════════════════╝
</pre>

The equivalent Retina display would be the same size, but with twice the pixel density. So its effective resolution compared to the above display is this:

<pre style="line-height:1em">
╔══════════════════════════════════════╗
║                                      ║
║                                      ║
║                                      ║
║                                      ║
║                                      ║
║                                      ║
║                                      ║
║                                      ║
║                                      ║
║                                      ║
╚══════════════════════════════════════╝
</pre>

Text and vector graphics look gorgeous on these higher resolution displays, because they have twice the level of vertical and horizontal detail to play with in the same size.

The challenge is what to do with raster images. If you display a photo in the same pixel-for-pixel space, it'd be a quarter of the size:

<pre style="line-height:1em">
  Non-Retina             Retina
╔═══════════════════╗  ╔═══════════════════╗
║ ┌──────────────┐  ║  ║ ┌───────┐         ║
║ │ Image        │  ║  ║ │ Image │         ║
║ │              │  ║  ║ └───────┘         ║
║ └──────────────┘  ║  ║                   ║
║                   ║  ║                   ║
╚═══════════════════╝  ╚═══════════════════╝
</pre>

This would break site designs, and make detail difficult to see. So web browsers and macOS elected to stretch images so they were the same size on Retina screens:

<pre style="line-height:1em">
  Non-Retina             Retina
╔═══════════════════╗  ╔═══════════════════╗
║ ┌──────────────┐  ║  ║ ┌──────────────┐  ║
║ │ Image        │  ║  ║ │ Image        │  ║
║ │              │  ║  ║ │              │  ║
║ └──────────────┘  ║  ║ └──────────────┘  ║
║                   ║  ║                   ║
╚═══════════════════╝  ╚═══════════════════╝
</pre>

Theoretically, this should be fine. **The whole point of doubling the resolution was you could just double the size of an image's pixels**, and it'd look the same as an equivilent non-Retina screen. No complicated maths, no interpolation, just double and be done.

Except, browser rendering engines decided not to do this. Instead, they stretch images like you would in Photoshop, so the end result is a muddy, low clarity image.

With these new CSS directives, we can do pixel doubling on these older or non-Retina images! I'm tempted to tag images on *Rubénerd* older than 2011 with "classic" or something, then set these CSS attributes on them.

[Phrogz on Stack Overflow]: https://stackoverflow.com/questions/3900436/image-scaling-by-css-is-there-a-webkit-alternative-for-moz-crisp-edges/8888964#8888964
[previous Windows 2000 blog post]: https://rubenerd.com/files/2017/vmware-fusion-windows-2000-kb835732/

