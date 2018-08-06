---
title: "Wildcard and DNS Let’s Encrypt certificates"
date: "2018-08-03T15:12:49+10:00"
abstract: "They’re wonderful, use them!"
year: "2018"
location: Sydney
category: Internet
tag:
- eff
- lets-encrypt
- security
- ssl
- tls
---
I migrated as many services I maintain to *Let's Encrypt* as soon as it was humanly possible. The entire toolchain and ease of use is enough for me to encourage its adoption; the fact they're free is a happy bonus.

*(I donate, so I suppose they're technically not free for me. But the point stands!)*

The only sites I hadn't done yet were ones that needed wildcard certificates, though Let's Encrypt implemented support in January this year. So I thought I'd try them out, and also they're long-since implemented DNS verification:

    # /opt/bin/certbot-auto                                 \
    --server https://acme-v02.api.letsencrypt.org/directory \
    --manual                                                \
    --preferred-challenges dns                              \
    -d *.example.com *.snrub-domain.example.com

Then waited and:
 
    usage: 
    certbot-auto [SUBCOMMAND] [options] [-d DOMAIN] [-d DOMAIN]    

Whoops, I always forget that each domain needs its own `-d`. Let's try again.

<!-- Hugo's markdown parser isn't respecting \n\n again? -->
<pre>Please deploy a DNS TXT record under the name
_acme-challenge.example.com with the following value:  
       
theBIRDisTHEwordBLAHblahBLAHgibberish123456  
      
Before continuing, verify the record is deployed.  
  
Press Enter to Continue
</pre>

Done and done. Then hit Return:

<pre>Waiting for verification...
Cleaning up challenges  
      
IMPORTANT NOTES:
- Congratulations! Your certificate and chain have been saved at:
  /etc/letsencrypt/live/example.com/fullchain.pem
  Your key file has been saved at:
  /etc/letsencrypt/live/example.com/privkey.pem
  Your cert will expire on [DATE]. To obtain a new or tweaked
  version of this certificate in the future, simply run certbot-auto
  again. To non-interactively renew *all* of your certificates, run
  "certbot-auto renew"
- If you like Certbot, please consider supporting our work by:
  Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
  Donating to EFF:                    https://eff.org/donate-le
</pre>

In the words of the person who first said it: *too easy!*
