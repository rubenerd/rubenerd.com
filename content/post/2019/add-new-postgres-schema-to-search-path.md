---
title: "Add new Postgres schema to search path"
date: "2019-04-29T07:59:28+10:00"
abstract: "SET search_path to schema"
year: "2019"
category: Software
tag:
- databases
- oracle
- postgresql
location: Sydney
---
Speaking of things I always, *always* forget for some reason, use this to put a new schema in your search path:

    SET search_path TO schema;

From the [PostgreSQL docs](https://www.postgresql.org/docs/9.3/ddl-schemas.html)\:

> When objects are referenced in any other context without schema qualification (table modification, data modification, or query commands) the search path is traversed until a matching object is found. Therefore, in the default configuration, any unqualified access again can only refer to the public schema.

I guess I don't need it often enough to commit to memory. Conversely, I still reference the non-existant [DUAL](https://docs.oracle.com/cd/B19306_01/server.102/b14200/queries009.htm) table even though I haven't touched an Oracle DB for [almost a decade](https://rubenerd.com/oracle-notnull-pk/).

