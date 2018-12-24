---
title: "Concat VMDKs with VMware Fusion"
date: "2018-05-23T09:27:02+10:00"
abstract: "De-select Split into multiple files"
year: "2018"
category: Software
tag:
- disk-images
- virtual-machines
- vmdk
- vmware-fusion
- written-in-sydney
---
VMware Fusion—and as far as I can remember, VMware Workstation—default to splitting disk images into multiple files. There are benefits to doing this, but it might not be what you want depending on your use case.

If you've been given a bundle with multiple VMDKs:

    $ ls *vmdk
    ==> disk.vmdk
    ==> disk-s001.vmdk
    ==> disk-s002.vmdk
    ==> disk-s003.vmdk
    [..]
    ==> disk-s00[n].vmdk

You can merge them graphically, like a [Boss]\:

1. Open the .vmx file in Fusion to import the VM
2. Go to *Virtual Machine* &rarr; *Settings*
3. Click the first *Hard Disk* under *Removable Devices*
4. Click *▸ Advanced Options*
5. De-select *Split into multiple files*

It will sit there chewing away for a few minutes while it concatenates, depending on the size and number of files. And you'll be left with:

    $ ls *vmdk
    ==> disk.vmdk

Now you can run it through a converter, such as to RAW to boot it on Xen, or something else. *Boom!*


[Boss]: https://bosscoffee.com/ "Boss Coffee is the Boss of Them All"

