---
title: "VMware Windows 2000 KB835732 additions error"
date: "2017-12-02T11:02:49+11:00"
abstract: "Install the Update Rollup 1 for SP4, and it’ll work"
category: Infocomm
tag:
- software
- virtualisation
- vmware
- vmware-fusion
- windows
- windows-2000
---
Windows 2000 still has official Guest Additions support on VMware Fusion 10, the latest release at the time of writing. But if you try installing on a fresh Windows 2000 VM, even with the latest SP4, you'll get this error:

<p><img src="https://rubenerd.com/files/2017/vmwarefusion10-win2kerror.png" alt="VMware Product Installation error: Microsoft Runtime DLLs cannot be installed on this operating system. Please see Microsoft KB835732 for details." style="width:500px; height:260px; image-rendering:optimizeSpeed; image-rendering:-moz-crisp-edges; image-rendering:crisp-edges; image-rendering:pixelated; -ms-interpolation-mode:nearest-neighbor;" /></p>

The quick solution is installing the [Update Rollup 1 for SP4] that Microsoft released in lieu of an official Service Pack 5. I'm not sure which update in that pack adds the right dependency, but I'm happy!

As an aside, I still posit Microsoft's UI department peaked with Windows 2000. Everything since, from Luna to Aero and the new Windows 8+ Metro have been downgrades in usability, efficiency, and class. BeOS still reigns supreme, though.

[Update Rollup 1 for SP4]: https://support.microsoft.com/en-us/help/891861/update-rollup-1-for-windows-2000-sp4-and-known-issues

