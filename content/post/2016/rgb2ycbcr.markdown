---
title: "rgb2ycbcr and rgrep"
date: "2016-09-05T08:41:00+10:00"
year: "2016"
category: Software
tag:
- bsd
- freebsd
- grep
- linux
- mac-os-x
- netbsd
- os-x
- serendipity
- written-in-sydney
---
I was trying to tab complete `rgrep`, but got this command instead. From its man(1) page:

> rgb2ycbcr  converts RGB color, greyscale, or bi-level TIFF images to YCbCr 
> images by transforming and sampling pixel data. If multiple files are 
> specified on the command line each source file is converted to a separate 
> directory in the destination file.

This would have really helped me a few years ago, because the Gimp didn't do CMYK. I'm not sure if it does now.

Regarding `rgrep`, I've aliased it to `grep -R`. I haven't checked if `ack` has compatible options to alias to that.

