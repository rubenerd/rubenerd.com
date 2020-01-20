---
title: "Gotchas when adding a drive to an existing ZFS pool to make a mirror"
date: "2020-01-19T17:34:08+11:00"
abstract: "Using zfs attach not add, and getting the order right"
thumb: "https://rubenerd.com/files/2020/openzfs.png"
year: "2020"
category: Software
tag:
- bsd
- drives
- freebsd
- guides
- openzfs
- zfs
location: Sydney
---
ZFS pools can be made with a single disk, then turned into a mirror after the fact by adding additional drives. This is especially useful for staging or homelabs, where you might not have the money upfront to buy both drives, or want to test it before spending time resilvering. There are a few small gotchas that often get me, which we'll explore here.

For this example, I've got a drive with a single `gpart(8)`-created partition labelled `drive01`. This is encrypted with `geli(8)`, and a zfs pool built on top called `swimming` in a ghastly pun. This is shown below: 

<!-- I give up on Markdown for pre blocks, it never friggen works -->
<pre>
<span style="font-weight:bold;"># zpool list</span>   
  
  pool: swimming
 state: ONLINE
  scan: none requested
config:   
       
NAME               STATE   READ WRITE CKSUM
swimming           ONLINE     0     0     0
  gpt/drive01.eli  ONLINE     0     0     0

</pre>

Now we want to turn this into a mirror using another drive that we've called `drive02` The temptation is to do the below:

<pre>
# echo Don't do this, it's just an example!
<span style="font-weight:bold;"># zpool add swimming /dev/gpt/drive02.eli</span>
</pre>

It's an easy mistake to make, but this will stripe the two disks together into a larger vdev, not create a mirror. I remember in my early days of using ZFS I had a larger pool in production for a year that I thought had redundant storage when it didn't. Whoops. 

Instead, you want to use `zfs attach`. You supply the pool name, the existing drive, and the new drive to mirror to:

<pre>
<span style="font-weight:bold;"># zpool attach swimming /dev/gpt/drive02.eli /dev/gpt/drive01.eli</span>
     
invalid vdev specification
use '-f' to override the following errors:
/dev/gpt/drive01.eli is part of active pool 'swimming'
</pre>

Wait a minute! Don't we *want* `drive01` to be part of this pool? Doesn't it need to be so we can mirror the data across?

No, this is ZFS protecting us from ourselves again. The order is for the first drive to be mirrored to the second, so what we really want is:

<pre>
<span style="font-weight:bold;"># zpool attach swimming /dev/gpt/drive01.eli /dev/gpt/drive02.eli</span>
</pre>

Now when we check, we can see the pool resilvering as we want:

<pre>
<span style="font-weight:bold;"># zpool status</span>
  
  pool: swimming
 state: ONLINE
status: One or more devices is currently being resilvered. The
        pool will continue to function, possibly in a degraded 
        state.
action: Wait for the resilver to complete.
config:   
       
	NAME                 STATE   READ WRITE CKSUM
	swimming             ONLINE     0     0     0
      mirror-0           ONLINE     0     0     0
	    gpt/drive01.eli  ONLINE     0     0     0
	    gpt/drive02.eli  ONLINE     0     0     0
</pre>     
