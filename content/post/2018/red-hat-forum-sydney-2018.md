---
title: "Red Hat Forum Sydney 2018"
date: "2018-11-21T22:31:36+11:00"
abstract: "The Multicloud, and Ansible at scale."
thumb: "https://rubenerd.com/files/2018/redhatforum2018-ansible@1x.jpg"
year: "2018"
category: Software
tag:
- australia
- ansible
- automation
- networking
- red-hat
- sydney
- work
location: sydney
---
I was able to steal away some work time and go to the Red Hat Forum 2018 in Sydney. Even for a FreeBSD guy these conferences always have great talks. Conveniently, my two favourites were back to back in the same hall this year.

### The Multicloud

<p><img src="https://rubenerd.com/files/2018/redhatforum2018-multicloud@1x.jpg" srcset="https://rubenerd.com/files/2018/redhatforum2018-multicloud@1x.jpg 1x, https://rubenerd.com/files/2018/redhatforum2018-multicloud@2x.jpg 2x" alt="Brian Hutson showing a multicloud environment." style="width:500px; height:333px;" /></p>

Juniper's Brian Hutson talked on the advantages and necessity of multicloud infrastructure. Think of it as hybrid cloud, but with multiple IaaS vendors thrown into the mix, like OrionVM and AWS; or heaven forbid, those other ones.

Some of his key talking points on multicloud:

* ~85% of enterprises see it as an ideal
* The best of all worlds for features
* Redundancy in the event one goes down

But that it introduces potential security pain points:

* Explosion of policies to govern each type of workload
* A degree of application traffic opacity: *what's going on?*
* Operational complexity: *how does it all work?*
* Lateral threats at scale: *microsegmentation*
* Incident response is still largely a manual process
* Budget

Naturally Junpier had an answer in the form of Contrail Enterprised Mulicloud and OpenContrail, which I can't speak for and haven't used. But the points he raised were interesting, and speak to concerns I deal with clients about. The key seems to be visibility, however you achieve that.

### Ansible at Scale

<p><img src="https://rubenerd.com/files/2018/redhatforum2018-ansible@1x.jpg" srcset="https://rubenerd.com/files/2018/redhatforum2018-ansible@1x.jpg 1x, https://rubenerd.com/files/2018/redhatforum2018-ansible@2x.jpg 2x" alt="Richard Hailstorm showing an Ansible best practice tree structure." style="width:500px; height:333px;" /></p>

But my favourite talk was Richard Hailstorm's presentation on Ansible at Scale. It was a very different venue from the cozy Tokyo University of Science when Benedict Reuschling did his [Ansible workshops at AsiaBSDCon]!

Before getting into the technical aspects, I appreciated Richard's emphasis on the human element to scaling automation. With the tech there's the culture, people, and processes that govern how effective a system operates. And the key is engage with security teams early.

I think we all learned Ansible hacking away on our laptops, and most of my playbooks operate as such. He commented this was fine, but for large projects with multiple contributers it can lead to *Spaghetti Ansible* which he admitted sounded tastier than it is.

Richard made the case for Ansible Tower by highlighting shortcomings with that approach, but it could equally apply for well structured playbooks and roles in version control. So I was keen to hear his best practices and recommendations for larger scale Ansible:

* Git and Ansible, like much of open source, is open to how you want to use it. The key is to build a consistent structure that works for your specific needs.

* Put variables in `group_vars/` instead of `inventory`. It keeps things clean, and Ansible Tower can interface with it if you end up deciding to use it.

* Keep your configuration and inventories local to the folder, not in `/etc/ansible`, for portability.

* Set your `.gitignore` to only include `requirements.yml` in `roles/`. At scale, roles should be farmed out to their own repos that can be version controlled, tested, and improved by different teams.

* Use the usual Git branches and pull requests when working on larger projects, such as Master, Testing, and Prod. This was called out specifically because Tower lets you choose a specific branch as a base for a project. 

From his slide, this was his recommended repository structure that's pretty straight forward if you've used Ansible before.

<pre style="line-height:1em !important">
ansible
 ├─── group_vars
 │     ├─── all.yml
 │     ├─── dev.yml
 │     ├─── prod.yml
 │     └─── web.yml
 ├─── inventory
 ├─── library
 ├─── rolls
 │     └─── requirements.yml
 ├─── .gitignore
 ├─── ansible.cfg
 ├─── deploy.yml
 └─── update.yml
</pre>

I also asked him and his team back at the booth some more questions:

* They said you can technically merge your deployment and update scripts given Ansible is idempotent, but that it's recommended to have update scripts separate for performance and clarity.

* And yes, I was allowed to take stickers, hats, and other schwag. I now have a *Red* Red Hat *Hat*. I got one of the engineers to admit the logo may be [changing soon], so it may soon be a collector's item.

Thanks everyone at the event for putting on a good show.

[Ansible workshops at AsiaBSDCon]: https://twitter.com/Rubenerd/status/972973372605792256
[changing soon]: https://rubenerd.com/ibm-plans-to-buy-red-hat/ "IBM plans to buy Red Hat"

