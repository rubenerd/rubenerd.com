---
title: "Universally-applicable pip design decisions"
date: "2020-06-28T08:15:59+10:00"
abstract: "Useful console output, error messages should be useful, easily reproducable."
year: "2020"
category: Software
tag:
- programming
- python
location: Sydney
---
pkgsrc lists [these features of pip](https://pkgsrc.se/devel/py-pip), emphasis added:

* All packages are downloaded before installation. Partially-completed installation doesn't occur as a result.
* Care is taken to present **useful output on the console**.
* The reasons for actions are kept track of. For instance, if a package is being installed, pip keeps track of why that package was required.
* **Error messages should be useful.**
* The code is relatively **concise and cohesive**, making it **easier to use programmatically**.
* Packages don't have to be installed as egg archives, they can be installed flat (while keeping the egg metadata).
* Native support for other version control systems (Git, Mercurial and Bazaar)
* Uninstallation of packages.
* Simple to define fixed sets of requirements and **reliably reproduce** a set of packages.

I'd say the emphasised lines would be useful for *any* tool, not least a package manager.
