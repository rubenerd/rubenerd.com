---
layout: page
title: "My 1998 Octek Rhino 12+ machine"
---
This page is dedicated to my first computer I built in primary school, as well as a burgeoning archive of all the information I can find about its motherboard. In 2015, the machine underwent a refurbishment and DOS install for nostalgia, because the machine still runs!

### Contents

* [The back story](#story)
* [System specifications](#specs)
* [Board specifications](#board)
* [CPU](#cpu)
* [Memory](#memory)
* [Chipset](#jumpers)


<h3 id="story">Back story and system specs</h3>

There were nothing I wanted more as a kid than my own computer. I'd won a writing contest one year,and had just enough money to cover the cost of some parts. One fateful afternoon in 1998, I went with my old man to Make Fine Computer in Funan Centre, and bought what would become my favourite machine; surpassed but never replaced :).

In 2015, I pulled it out of the cupboard and set about refurbishing it. Most of it was in remarkable operating condition, save for the ISA sound card and some rust on the case. I bought a few replacement components, cleaned it up, and installed MS-DOS 6.20 (the latest version we used). It's now my nostalgia machine, running everything from Windows for Workgroups to Commander Keen.

Below list the components originally installed with the machine, and the refurbishment:

Component     | 1998 Original           | 2015 Refurb
--------------|-------------------------|-----------------
**CPU**       | 200MHz Pentium MMX      | (same) 
**Memory**    | 16MiB PC-100 SDRAM      | 32MiB PC-100 SDRAM<br />16MiB SIMM
**HDD**       | 2GiB Maxtor             | 8GiB CF with IDE adaptor
**Sound**     | ISA Sound Blaster AWE32 | PCI Sound Blaster AWE64
**NIC**       | PCI Compal 10BaseT      | (same)
**Optical**   | 32x Mitsumi CD-ROM      | (same)
**Disks**     | 3.5" 1.44MiB Mitsumi<br />100MB IDE Zip Drive | (same)


<h3 id="specs">Board and specifications</h3>

The machine was built around an Octek Rhino 12+ logic board. This was their mid-level board at the time, with a few interesting features.

They were sold under the "Octec" and "Ocean" brands in some countries, but they're the same. [Csogi][csogi] also says its the same board as the Aristo AM-538, which judging from the photos and specs appears likey.

The chipset is a VT82C580VPX Apollo VPX/97, so named because it supported Microsoft's Multimedia PC 97 standard. This was the last one that didn't mandate those multi-coloured ports.

Much of the specification details on this page are derived from Anantech's excellent chipset page.

[csogi]: http://www.driverforum.com/bios/1962.html

<h3 id="cpu">CPU</h3>

The board is a single Socket 7. Remember the wonderful old days when boards supported multiple CPU manufacturers and types?

The chipset documentation list these features:

CPU Support              | Value
-------------------------|--------------------------------------------
**Number of CPUs** 	     | 1
**AMD CPUs Supported** 	 | K5, K6
**Cyrix CPUs Supported** | 6x86 (M1), 6x86MX (M2) w/ Linear Burst Mode
**Intel CPUs Supported** | Pentium, Pentium MMX

My machine was built with a 200MHz Pentium MMX and what I originally thought was the stock fan, but it has "Octek" on it, suggesting it came with the board. I can't remember. The board, CPU and fan still work flawlessly almost 20 years later.


<h3 id="drives">Drives</h3>

The board supports four IDE/ATA drives in two master/slave pairs, as expected. As with most boards from that time period, there’s a [32GB ceiling][ceiling] on capacity.


Hard Disk Controller           | Value
-------------------------------|----------------
Chip 	                       | VIA South Bridge Controller (VT82C586B)
Busmastering Support           | Yes
UltraDMA Support 	           | Yes
Max. Theoretical Transfer Rate |	PIO Mode 5/DMA Mode 3 (33.3MB/S)

I built my machine originally with a 2GB Maxtor drive. In 2015, I replaced it with a 8GB CompactFlash card, and a [CompactFlash to IDE adaptor][cfadaptor]. This requires a 3.5" floppy drive molex connector, which I had to get a standard molex conversion cable to connect.

I originally installed a 32x CD-ROM, because it was cheap. It still works, but weirdly only plays the first 30 seconds of a music CD before skipping back to the beginning. So much for using this ancient machine as a retro jukebox!

[ceiling]: https://www.wimsbios.com/forum/other-bios-update-issues-f29/octek-rhino-bios-needed-t7281.html

[cfadaptor]: https://en.wikipedia.org/wiki/CompactFlash#Compared_to_other_portable_storage

<h3 id="memory">Memory</h3>

The board includes four memory slots, two DIMMs and two SIMMs. There are a few reported limitations, but only a subset have affected me:

* Some people [claim][dimmsimm] they can't be used at the same time, but I do without issue.

* 72 pin SIMMs need to be [installed][simmpair] in matching pairs. I can confirm that with just one, my board didn't recognise it.

* High density DIMMs [aren't supported][highdimm]. DIMMs with 4 chips on each side won't be recognised. DIMMs with 8 ships should be recognised, though their full capacity may not be if you've run into maximum memory supported. 

Memory                             | Value
-----------------------------------|---------
**Maximum DRAM Supported** 	       | 512MiB
**BEDO DRAM Read Timings (66MHz)** | 5-1-1-1
**EDO DRAM Read Timings (66MHz)**  | 5-2-2-2
**FPM DRAM Read Timings (66MHz)**  | 5-3-3-3
**SDRAM Read Timings (66MHz)**     | 3-1-1-1
**Data Path to Memory**            | 64-bits
**ECC Support** 	               | No

My machine has 1x 128MiB DIMM, 1x 256MiB DIMM (only detected as 128MiB for some reason) and 2x 16MiB SIMMs for 288MiB total.

[dimmsimm]: http://www.computing.net/answers/hardware/old-mb-new-ram/53292.html
[simmpair]: http://www.sysopt.com/showthread.php?57877-RAM-upgrade-for-Rhino-12-motherboard
[highdimm]: http://www.computing.net/answers/hardware/old-mb-new-ram/53292.html


### CRAP



Limitations:



* High density SD-RAM is not supported (4 chips on each side). Needs Low density (8 chips on each side). [Source](http://www.computing.net/answers/hardware/old-mb-new-ram/53292.html)

BIOS Version
Rhino 12+ 	09/03/97-580VPX-SMC669-2A5LDO0AC-00 [Source](http://www.plasma-online.de/english/identify/serial/mainboard/mb_octek.html)

Chipset | VIA VPX 2A5LDO0AC-00 (sometimes relabelled VXPro+) [Source](http://www.kva.kursk.ru/bios1/numbers.shtml) [Source 2](http://www.4pc.info/hardware/award_biosid.php)

* 2x PC100 memory slots (could accept PC133)


<h3 id="chipset">Chipset</h3>

Powering this motherboard is a VT82C580VPX Apollo VPX/97 Chipset. Details below, courtesy of Anantech.

Chipset Packaging   | Value
--------------------|-------------------------------------------------------------
**Number of Chips** | 2 (VT82C595 North Bridge Controller, VT82C586B South Bridge)

CPU Support              | Value
-------------------------|--------------------------------------------
**Number of CPUs** 	     | 1
**AMD CPUs Supported** 	 | K5, K6
**Cyrix CPUs Supported** | 6x86 (M1), 6x86MX (M2) w/ Linear Burst Mode
**Intel CPUs Supported** | Pentium, Pentium MMX



Hard Disk Controller |
---------------------|
Chip 	VIA South Bridge Controller (VT82C586B)
Busmastering Support 	Yes
UltraDMA Support 	Yes
Max. Theoretical Transfer Rate 	PIO Mode 5/DMA Mode 3 (33.3MB/S)

<hr />

<table style="border-collapse:collapse">
    <th colspan="2" style="text-align:left;">Chipset Packaging</th>
    <tr>
        <th style="text-align:left; padding-right:1em">Number of chips</th>
        <td style="text-align:left;">2 (VT82C595 North Bridge Controller, VT82C586B South Bridge)</td>
    </tr>
</table>

<hr />

<p></p>

<table style="border-collapse:collapse">
<th colspan="2" style="text-align:left;">CPU Support</th>
    <tr>
        <th style="text-align:left;">Number of CPUs</th>
        <td>1</td>
    </tr>
    <tr>
        <th style="text-align:left;">AMD CPUs Supported</th>
        <td>K5, K6</td>
    </tr>
    <tr>
        <th style="text-align:left; padding-right:1em">Cyrix CPUs Supported</th>
        <td>6x86 (M1), 6x86MX (M2) w/ Linear Burst Mode</td>
    </tr>
    <tr>
        <th style="text-align:left;">Intel CPUs Supported</th>
        <td style="text-align:left;">Pentium, Pentium MMX</td>
    </tr>
</table>

<p></p>

<hr />


<table style="border-collapse:collapse">
<th colspan="2" style="text-align:left;">Memory</th>
    <tr>
        <th style="text-align:left;">Maximum DRAM Supported</th>
        <td>512MB</td>
      </tr>
      <tr>
        <th style="text-align:left; padding-right:1em">BEDO DRAM Read Timings (66MHz)</th>
        <td>5-1-1-1</td>
      </tr>
      <tr>
        <th style="text-align:left;">EDO DRAM Read Timings (66MHz)</th>
        <td>5-2-2-2</td>
      </tr>
      <tr>
        <th style="text-align:left;">FPM DRAM Read Timings (66MHz)</th>
        <td>5-3-3-3</td>
      </tr>
      <tr>
        <th style="text-align:left;">SDRAM Read Timings (66MHz)</th>
        <td>3-1-1-1</td>
      </tr>
      <tr>
        <th style="text-align:left;">Data Path to Memory</th>
        <td>64-bits</td>
      </tr>
      <tr>
        <th style="text-align:left;">ECC Support</th>
        <td>No</td>
      </tr>
</table>

<hr />
<p></p>

<table style="border-collapse:collapse">
<th colspan="2" style="text-align:left;">Hard Disk Controller</th>
      <tr>
        <th style="text-align:left;">Chip</th>
        <td>VIA South Bridge Controller (VT82C586B)</td>
      </tr>
      <tr>
        <th style="text-align:left;">Busmastering Support</th>
        <td>Yes</td>
      </tr>
      <tr>
        <th style="text-align:left;">UltraDMA Support</th>
        <td>Yes</td>
      </tr>
      <tr>
        <th style="text-align:left; padding-right:1em">Max. Theoretical Transfer Rate</th>
        <td>PIO Mode 5/DMA Mode 3 (33.3MB/S)</td>
      </tr>
</table>

<hr />
<p></p>

<table style="border-collapse:collapse">
<th colspan="2" style="text-align:left;">Cache</th>
    <tr>
        <th style="text-align:left">Type</th>
        <td>Asynchronous/Synchronous Pipeline Burst Cache</td>
    </tr>
    <tr>
        <th style="text-align:left; padding-right:1em">Maximum Supported Size</th>
        <td>2048KB</td>
    </tr>
    <tr>
        <th style="text-align:left">Cacheable DRAM Area</th>
        <td>512MB</td>
    </tr>

</table>

<hr />
<p></p>

<table style="border-collapse:collapse">
<th colspan="2" style="text-align:left;">PCI Interface</th>
    <tr>
        <th style="text-align:left; padding-right:1em">Supported PCI Bus Speeds</th>
        <td>25, 30, 33 MHz</td>
    </tr>
    <tr>
        <th style="text-align:left;">Concurrent PCI</th>
        <td>Yes</td>
    </tr>
    <tr>
        <th style="text-align:left;">Async. PCI Bus Speed</th>
        <td>Yes</td>
    </tr>
    <tr>
        <th style="text-align:left;">PCI Specification</th>
        <td>2.0 (66 MHz max.)</td>
    </tr>
</table>

<hr />
<p></p>

<table style="border-collapse:collapse">
<th colspan="2" style="text-align:left;">Power Management</th>
    <tr>
        <th style="text-align:left;">PC97 Compliance</th>
        <td>Yes</td>
      </tr>
      <tr>
        <th style="text-align:left;">Suspend to Disk</th>
        <td>Yes</td>
      </tr>
      <tr>
        <th style="text-align:left; padding-right:1em">HDD Power Down</th>
        <td>Yes</td>
      </tr>
      <tr>
        <th style="text-align:left;">Modem Wakeup</th>
        <td>Yes</td>
      </tr>
      <tr>
        <th style="text-align:left;">System Suspend</th>
        <td>Yes</td>
      </tr>
    </tr>
</table>

<hr />
<p></p>

<table style="border-collapse:collapse">
<th colspan="2" style="text-align:left;">Write Buffers</th>
    <tr>
        <th style="text-align:left; padding-right:1em">CPU-to-DRAM</th>
        <td>16 QWords</td>
    </tr>
    <tr>
        <th style="text-align:left;">CPU-to-PCI</th>
        <td>6 DWords</td>
    </tr>
    <tr>
        <th style="text-align:left;">PCI-to-DRAM</td>
        <td>48 DWords</td>
    </tr>
</table>

<hr />
<p></p>

<table style="border-collapse:collapse">
<th colspan="2" style="text-align:left;">Bus Speeds</th>
    <tr>
        <th style="text-align:left">Officially Supported Bus Speeds</th>
        <td>50, 60, 66, 75 MHz</td>
      </tr>
      <tr>
        <th style="text-align:left">Unofficially Achieved Bus Speeds</th>
        <td>68, 83.3 MHz</td>
    </tr>
</table>




