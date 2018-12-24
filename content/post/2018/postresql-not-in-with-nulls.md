---
title: "PostgreSQL NOT IN with NULL"
date: "2018-08-23T09:55:41+10:00"
abstract: "I’d been doing this wrong for ages. Whoops!"
year: "2018"
category: Software
tag:
- bsd
- databases
- freebsd
- linux
- netbsd
- postgres
- sql
- written-in-sydney
---
Earlier this week my colleague clued me into a potential Postgres pitfall I'd yet to be bitten by, but it could happen.

Say you're doing a once-off query like this. Yes, it's a contrived, simplified example.

    SELECT book, isbn 
    FROM inventory 
    WHERE isbn NOT IN (
        SELECT isbn FROM orders
    )

This superficially works, but Postgres will not match `NULL` values in this subquery when using `NOT IN`. Ouch!

So the only way to be safe is to check the field is also `NOT NULL`:

    SELECT book, isbn 
    FROM inventory 
    WHERE isbn NOT IN (
        SELECT isbn FROM orders 
        WHERE isbn IS NOT NULL
    )

Or the more robust alternative, short of doing a proper join, is to strategically deploy `NOT EXISTS`:

    SELECT book, isbn 
    FROM inventory 
    WHERE NOT EXISTS (
        SELECT isbn FROM orders 
        WHERE inventory.isbn = orders.isbn
    )

I did some digging, and also found this [interesting article on Explain Extended] on the performance implicaitons of using these different queries.

[interesting article on Explain Extended]: https://explainextended.com/2009/09/16/not-in-vs-not-exists-vs-left-join-is-null-postgresql/

