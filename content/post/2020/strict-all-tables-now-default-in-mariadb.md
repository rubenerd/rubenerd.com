---
title: "STRICT_ALL_TABLES now default in MariaDB"
date: "2020-02-14T08:37:04+11:00"
abstract: "This is clearly good news."
year: "2020"
category: Software
tag:
- databases
- mariadb
- mysql
- percona
location: Sydney
---
<p><img src="https://rubenerd.com/files/2020/photo-table-join@1x.jpg" srcset="https://rubenerd.com/files/2020/photo-table-join@1x.jpg 1x, https://rubenerd.com/files/2020/photo-table-join@2x.jpg 2x" alt="Some tables joining. HAHA! Hah! Hah." style="width:500px; height:333px;" /></p>

I've used MySQL and its offshoots in tandem with Postgres for most of my career and for personal projects, but with the fairly large caveat that it's running in this mode, defined in `my.cnf`:

    [mysqld]
    sql-mode = "STRICT_ALL_TABLES"

From the [MariaDB docs](https://mariadb.com/kb/en/sql-mode/):

> Strict mode. Statements with invalid or missing data are aborted and rolled back. For a non-transactional storage engine with a statement affecting multiple rows, this may mean a partial insert or update if the error is found in a row beyond the first.

I never had the data loss or issues that Postgres friends warned me about, even with large-scale deployments. But I will readily admit that not accepting this strict mode by default made me nervous. Enabling it never made difference in operation, so why not?

*(That's not strictly speaking true, I trialled a few self-hosted blog platforms and wikis back in the day that stopped having problems when I turned this off. But that told me that I shouldn't be using them).*

I noticed recently though that this has changed:

> With strict mode set (**default from MariaDB 10.2.4**), statements that modify tables (either transactional for `STRICT_TRANS_TABLES` or all for `STRICT_ALL_TABLES`) will fail, and an error will be returned instead. The `IGNORE` keyword can be used when strict mode is set to convert the error to a warning.

This is great news, and I'm only a few years late celebrating. The *Tyranny of the Default* means people weren't running in this mode before. Being default means more people will be.

