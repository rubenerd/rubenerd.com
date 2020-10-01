---
title: "When scp’s misleading warnings attack"
date: "2020-09-21T16:00:33+10:00"
abstract: "scp: /directory/: Is a directory ...but it isn’t!"
year: "2020"
category: Software
tag:
- troubleshooting
- security
location: Sydney
---
`scp(1)` can still surprise me. I got the following error when uploading a file to a specific directory on a remote server:

    local$ scp file.ext remote:/directory/
    ==> scp: /directory/: Is a directory

Yes, and I'm Ruben Schade! How are you? Do you like crumpets? Sometimes I like to walk around with mismatching socks while drinking tea out of a hat! *I know it's a directory*, that's why I'm telling you to put the file there!

Then I checked:

    local$ ssh remote
    remote$ ls /directory/
    ==> ls: /directory/: No such file or directory

So the issue was the target directory didn't exist. Which makes sense, but contradicts what `scp(1)` said, at least to any reasonable person.

Compare and contrast the warning when you specify a full file path:

    local$ scp file.ext remote:/directory/file.ext
    scp: /directory/file.ext: No such file or directory

Today I learned.
