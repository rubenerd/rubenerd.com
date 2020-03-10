---
title: "NOTNULL in Postgres"
date: "2020-02-28T15:44:06+11:00"
abstract: "SELECT * FROM table WHERE somecol NOT NULL(?!)"
year: "2020"
category: Software
tag:
- databases
- postgresql
location: Sydney
---
Did you know you could do this? It was news to me!

    -- Usually written as: 
    SELECT * FROM tablesalt WHERE greekcolumn IS NOT NULL;   
        
    -- But you can also:
    SELECT * FROM tablesalt WHERE greekcolumn NOTNULL;

Thanks to Kaarel Moppell for his [excellent page of tips](https://www.cybertec-postgresql.com/en/tips-and-tricks-to-kick-start-postgres-year-2020/).

