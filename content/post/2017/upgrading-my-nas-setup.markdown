---
draft: true
title: "Upgrading my NAS setup"
date: "2017-01-06T11:16:00+10:00"
category: Hardware
tag:
- hp-microservers
- nas
---
I've been using a pair Gen8 HP Microservers as NAS devices for a few years, but Clara and I are starting to reach their storage limits.

### Building the ultimate NAS

When I started my current job in 2014, my boss introduced me to the HP Microserver line. They came at just the right time, my venerable Mac Pro was beginning to have power supply issues, and as much as Core Storage improved things, I still didn't trust HFS+.

I can't speak more highly of these adorable little servers. They fit four full sized hard drives, a server grade motherboard, Xeon CPU support and ECC memory into a quarter of the space of a contemporary desktop tower. Best of all, they're generally cheaper than most NAS boxes.

On top of these, I run FreeBSD with GELI for encryption, and ZFS for the file systems, volume management and RAID. ZFS is the only file system I trust, especially now [so much of my life] has been scanned, physically thrown away and entrusted to its care.

And finally, the machines use Infiniband cards in their individual PCIE slots for backups between them, more to learn how IB worked than any pressing bandwidth concerns. Hey, if I'm going to overengineer a NAS, may as well go all the way!

### Drive capacity and arrangement

The main concern at the end of 2016 was space. Clara lives with me now, and we've been merging our backups and media collections. Space was already getting a bit tight, but now we're only a few hundred gigs away from nerdpocolypse.

<table>
<thead>
<tr>
<th>Server</th>
<th>ZFS</th>
<th>Drive 1</th>
<th>Drive 2</th>
<th>Drive 3</th>
<th>Drive 4</th>
</tr>
</thead>
<tbody>
<tr>
<td>Mio</td>
<td>RAID0</td>
<td>4TB</td>
<td>4TB</td>
<td>2TB</td>
<td>2TB</td>
</tr>
<tr>
<td>Kyou</td>
<td>RAIDZ1</td>
<td>3TB</td>
<td>3TB</td>
<td>3TB</td>
<td>3TB</td>
</tr>
</table>

For those who don't know, RAID0 is basically a mirrored pair. On Mio, she has 6TB of redundant storage (2× 2TB, and 2× 4TB). It's fantastic; when I lost a 2TB drive to hardware failure, I swapped it out for a new drive, and ZFS quickly copied the data back to restore redundancy. I could use RAID10 here (striped across two mirrored pairs), but I prefer to KISS.

Kyou used RAIDZ1, the equivalent to RAID5. This setup stripes data across all four drives, with a little over a quarter of the space for checksums. A single drive can be lost, and its data rebuilt mathematically. The advantage here is you have three drives worth of space instead of two, but its computationally expensive to rebuild after a drive failure, and has the perverse side effect of thrashing your other drives when doing so. If this causes another drive loss, you've lost the whole array.

RAIDZ1 was an acceptable compromise for a media server, because its all data I could feasibly re-download from elsewhere.


### Upgrading

Both Microservers are now out of usable space. ZFS starts to fragment like a fame monster if you use more than 90%. I figured rebuilding them with larger drives would give me the opportunity to rethink how they're laid out.

I've been fine with RAIDZ1 in Kyou, but I'd feel more comfortable using her in mirrored pairs. That means though even if I upgraded all her drives to 4TB, she'd have 1TB less space than she does now. That's something I can solve by offloading some of her data to Mio.

Mio is easy, because she already has mirrored pairs. The plan here is to upgrade her with 2 6TB drives and retire her 2TB ones. This would increase her space to 10TB, easily enough to absorb the shortfall from Kyou.

The other interesting possibility is Seagate's new Shingled drives. If you haven't checked them out, the tech is fascinating, if a little terrifying. Their performance is terrible for random writes, but media files are WORM anyway. The corrections ZFS would do as a mirror may get hairy though, so the initial cost saving would be repaid there.

So the resulting capacities would be like this:

<table>
<thead>
<tr>
<th>Server</th>
<th>ZFS</th>
<th>Drive 1</th>
<th>Drive 2</th>
<th>Drive 3</th>
<th>Drive 4</th>
</tr>
</thead>
<tbody>
<tr>
<td>Mio</td>
<td>RAID0</td>
<td>4TB</td>
<td>4TB</td>
<td>6TB</td>
<td>6TB</td>
</tr>
<tr>
<td>Kyou</td>
<td>RAID0</td>
<td>4TB</td>
<td>4TB</td>
<td>4TB</td>
<td>4TB</td>
</tr>
</table>

My family knows me too well, and bought me 4TB drives for Christmas! That just leaves the 6TB drives, which are still AU $300+. Who needs food?

[so much of my life]: https://rubenerd.com/goodbye-junk/

