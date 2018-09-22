---
title: "jOOQ SQL for Java"
date: "2018-01-12T16:36:43+11:00"
abstract: "It makes SQL look and work like Java"
year: "2018"
location: Sydney
category: Software
tag:
- java
- sql
---
The [jOOQ] framework is pretty cool; it makes SQL look and work like Java. 

This is an example from their page in raw SQL:

      SELECT AUTHOR.FIRST_NAME, AUTHOR.LAST_NAME, COUNT(*)
        FROM AUTHOR
        JOIN BOOK ON AUTHOR.ID = BOOK.AUTHOR_ID
       WHERE BOOK.LANGUAGE = 'DE'
         AND BOOK.PUBLISHED > DATE '2008-01-01'
    GROUP BY AUTHOR.FIRST_NAME, AUTHOR.LAST_NAME
      HAVING COUNT(*) > 5
    ORDER BY AUTHOR.LAST_NAME ASC NULLS FIRST
       LIMIT 2
      OFFSET 1

And jOOQ-ified:

    create.select(AUTHOR.FIRST_NAME, AUTHOR.LAST_NAME, count())
      .from(AUTHOR)
      .join(BOOK).on(AUTHOR.ID.equal(BOOK.AUTHOR_ID))
      .where(BOOK.LANGUAGE.eq("DE"))
      .and(BOOK.PUBLISHED.gt(date("2008-01-01")))
      .groupBy(AUTHOR.FIRST_NAME, AUTHOR.LAST_NAME)
      .having(count().gt(5))
      .orderBy(AUTHOR.LAST_NAME.asc().nullsFirst())
      .limit(2)
      .offset(1)

Syntax highlighting would have made this better. But you get the jist.

At this stage, I'd normally comment about my brief history in Java. I'd mention that I did work as a Java developer in an enterprise setting briefly, and save from a severe bout of CamelCaseItis, it wasn't altogether bad. Maybe something here about Scala and jRuby. I'd then identify my SQL as being tolerable, but enough to be dangerous. Finally, I'd mention this project being kinda cool, and its chaining of methods reminding me a bit of Ruby, followed with a pun about ActiveRecord.

But I won'd do that this time.

[jOOQ]: http://www.jooq.org/ "jOOQ project page"

