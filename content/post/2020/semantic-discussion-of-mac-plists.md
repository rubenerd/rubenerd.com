---
title: "Semantic discussion of macOS plists"
date: "2020-07-19T09:04:51+10:00"
abstract: "Having flat keys and values under dict never made much sense to me."
year: "2020"
category: Internet
tag:
- apple
- macos
- standards
- xml
location: Sydney
---
I learned something about XML today, and macOS's plists are a perfect way to illustrate it. Or more specifically, I corrected a misunderstanding I've had about XML for more than a decade.

macOS uses XML files to store **key**:**value** dictionaries in the form of property lists. This is a basic example:

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
        "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>Word</key>
        <string>Bird</string>
        <key>Heard</key>
        <true/>
    </dict>

These have always struck me as a bit strage, despite having written and parsed them for years. There's nothing mapping the **key** and its value, in this case a **string** and a boolean **true**. These are entirely discrete values in a flat XML document like this, meaning it places the burden on the client to create that relationship while parsing.

RDF, and later HTML Microdata, solved this problem with [triples](https://en.wikipedia.org/wiki/Resource_Description_Framework#Statement_reification_and_context) that consist of a subject, predicate, and object. The above values would be implemented akin to this in RDF:

    <dict>
        <string key="word">Bird</string>
        <true key="heard"/>
    </dict>

If you wanted to keep the same syntax, another way would be to wrap the **key** and values in a new element, such as **property**. This would remove ambiguity as to what value belongs to what property, and renders the XML more robust against being parsed out of order:

    <dict>
        <property>
            <key>Word</key>
            <string>Bird</string>
        </property>
        <property>
            <key>Heard</key>
            <true/>
        </property>
    </dict>

Which leads me to my silly little revelation this morning as I sit here having a coffee.

I've always parsed XML sequentially for convenience, and assumed third party modules did too. But I'd always assumed that, strictly speaking, element order was insignificant in XML like SQL, another three-letter abbreviation. It was incumbent upon XML schema designers to include a sequential attribute if order was significant, such as an incrementing identifier, or a time stamp.

This has had a real effect on my own schemas. Requiring ordered attributes precludes the use of UUIDs, because they're not sequential by design. I've also wrapped every key and value in their own elements, or used XML attributes to make the data more robust. If this ordering were the case, a plist **key** and **string** directly under the same **dict** element could theoretically be parsed in any order, thereby destroying the intrinsic relationship that comes from being ordered in a key:value sequence.

I'm relieved to admit I had this wrong. [Section 2](https://www.w3.org/TR/xml-infoset/#infoitem) of the W3C's xml-infoset recommendation mentions this with regards to XML Information Items:

> **[children]** An ordered list of child information items, in document order.

So while an XML relationship doesn't strictly exist for a **plist** **key** and its value(s), parsing it in the presented order will return an ordered set.

Apple's plists are valid XML and have been in use for decades, so my qualms are comically late and meaningless in practice. Yay! I'd still prefer a formal relationship between these attributes, but at least they make a bit more sense to me now.

