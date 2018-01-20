---
title: "Trip back in time: cost of encryption"
date: "2016-12-14T12:09:00+10:00"
year: "2016"
category: Internet
tag: 
- old-drafts
- encryption
- privacy
- security
---
I found this random snippet of text in a 2011 archive folder, of all places. I think it was for one of my earliest university assignments.

> Part of the appeal of storage of plaintext data for cloud providers is its relative simplicity, and the advantages it offers for additional services. Data can be uploaded by clients through simple interfaces, manipulated by the cloud provider directly for the purposes of searching and other value-added services, and in certain cases can even be used to reduce storage redundancy (Soghoian 2011).
> 
> As with any additional service, introducing encryption during any part of the storage or transmission process introduces new costs for the cloud provider, which they may or may not be able to justify. If a majority of their customer install base don't demand it (refer to section 3.5), it makes little business sense to implement encryption. Economies of scale then dictate that those services not offering encryption will be cheaper than those that do, which further entrenches customers in less expensive, less private systems.
> 
> Additionally, if the services a cloud provider wishes to offer (such as full text email search) requires access to unencrypted data, the cloud provider may perceive their business needs as being in direct conflict with a minority of their customers wanting encryption to render their data more private (Soghoian 2011).
> 
> Encryption introduces overhead during the transmission process, and additional server database stores for the encryption keys and additional authentication must be provisioned and secured. Encryption can be a memory and CPU intensive process (Schneier 2003), which could potentially lead to greater cooling costs and reduced life spans for servers.

> For those who require absolute data privacy, this can be a significant issue when choosing a cloud provider.

The last line aside, most of this is no longer true.

Encrypted traffic is but a tiny fraction of a server's overall load in 2016. Even if it was though, HTTPS is all but mandated today. For those who want privacy on public cloud services like Dropbox, you can use a sparse bundle or other encrypted container.

