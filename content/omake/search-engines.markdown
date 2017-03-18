---
layout: omake
title: "Search engines"
---
I had to remove all non-HTTPS search engines here to prevent mixed content errors. I'm looking at you CocoaPods, CPAN, Hurricane Electric et.al!

<div id="omake-search">

<form method="get" action="https://duckduckgo.com/"><fieldset>
<input type="text"role="textbox" name="q" maxlength="255" />
<input type="submit" value="DuckDuckGo" />
</fieldset></form>

<form action="https://www.amazon.co.jp/s" method="get"><fieldset>
<input type="text" name="field-keywords" />
<input type="submit" value="Amazon Japan" />
</fieldset></form>

<form action="https://www.amazon.co.uk/s" method="get"><fieldset>
<input type="text" name="field-keywords" />
<input type="submit" value="Amazon UK" />
</fieldset></form>

<form action="https://www.amazon.com/s" method="get"><fieldset>
<input type="text" name="field-keywords" />
<input type="submit" value="Amazon US" />
</fieldset></form>

<form method="get" action="https://blekko.com/ws/"><fieldset>
<input type="text" name="q" maxlength="255" />
<input type="submit" value="Blekko" />
</fieldset></form>

<form method="get" action="https://www.bing.com/search"><fieldset>
<input type="text" name="q" maxlength="255" />
<input type="submit" value="Bing (Chandler?)" />
</fieldset></form>

<form method="get" action="https://www.bing.com/images/search"><fieldset>
<input type="text" name="q" maxlength="255" />
<input type="submit" value="Bing Images" />
</fieldset></form>

<form method="get" action="http://manpages.debian.org/cgi-bin/man.cgi"><fieldset>
<input type="text" role="textbox" maxlength="255" name="query" />
<input type="submit" value="Debian manpages" />
</fieldset></form>

<form method="GET" action="https://packages.debian.org/search"><fieldset>
<input type="text" name="keywords" value="" />
<input type="submit" value="Debian Packages" />
</fieldset></form>

<form method="get" action="https://search.dmoz.org/cgi-bin/search"><fieldset>
<input type="text" name="search" maxlength="255" />
<input type="submit" value="dmoz" />
</fieldset></form>

<form action="https://www.ebay.com.au/sch/i.html" method="get"><fieldset>
<input type="text" name="_nkw" />
<input type="submit" value="eBay Australia" />
</fieldset></form>

<form action="https://www.ebay.com/sch/i.html" method="get"><fieldset>
<input type="text" name="_nkw" />
<input type="submit" value="eBay US" />
</fieldset></form>

<form method="get" action="https://secure.flickr.com/search/"><fieldset>
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="Flickr" />
</fieldset></form>

<form method="get" action="https://www.freebsd.org/cgi/man.cgi"><fieldset>
<input type="text" role="textbox" maxlength="255" name="query" />
<input type="submit" value="FreeBSD manpages" />
</fieldset></form>

<form method="get" action="https://www.google.com/search"><fieldset>
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="Google Images" /> 
<input type="hidden" name="tbm" value="isch" />
</fieldset></form>

<form method="get" action="https://scholar.google.com/scholar"><fieldset>
<input type="hidden" name="pws" value="0" />
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="Google Scholar" />
</fieldset></form>

<form method="get" action="https://www.google.com.au/search"><fieldset>
<input type="hidden" name="pws" value="0" />
<input type="text" role="textbox" name="q" maxlength="255" /> 
<input type="submit" value="Google Australia" /> 
<input type="hidden" name="hl" value="en-AU" />
</fieldset></form>

<form method="get" action="https://www.google.com.sg/search"><fieldset>
<input type="hidden" name="pws" value="0" />
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="Google Singapore" /> 
<input type="hidden" name="hl" value="en-SG" />
</fieldset></form>

<form action="https://www.gumtree.com.au/s-search-results.html" method="get"><fieldset>
<input type="text" name="keywords" />
<input type="submit" value="Gumtree Australia" />
</fieldset></form>

<form method="get" action="https://www.ibm.com/developerworks/library/"><fieldset>
<input type="hidden" name="contentarea_by" value="All Zones" />
<input type="hidden" name="sort_by" value="Date" />
<input type="hidden" name="sort_order" value="2" />
<input type="text" name="search_by" />
<input type="submit" value="IBM developerWorks Technical Library" />
</fieldset></form>

<form method="get" action="https://konachan.net/post"><fieldset>
<input type="text" role="textbox" name="tags" maxlength="255" />
<input type="submit" value="Konachan" />
</fieldset></form>

<form method="get" action="https://myanimelist.net/anime.php"><fieldset>
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="MyAnimeList: Anime" />
</fieldset></form>

<form method="get" action="https://myanimelist.net/character.php"><fieldset>
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="MyAnimeList: Characters" />
</fieldset></form>

<form method="get" action="https://myanimelist.net/manga.php"><fieldset>
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="MyAnimeList: Manga" />
</fieldset></form>

<form method="get" action="https://myanimelist.net/people.php"><fieldset>
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="MyAnimeList: People" />
</fieldset></form>

<form method="get" action="https://www.mediawiki.org/w/index.php"><fieldset>
<input type="text" role="textbox" name="search" maxlength="255" />
<input type="submit" value="MediaWiki" />
</fieldset></form>

<form method="get" action="https://secure.myfigurecollection.net/search.php"><fieldset>
<input type="text" role="textbox" name="overall" maxlength="255" />
<input type="submit" value="MyFigureCollection" />
</fieldset></form>

<form method="get" action="https://search.oracle.com/search/search"><fieldset>
<input type="hidden" name="search_startnum" />
<input type="hidden" name="search_endnum" />
<input type="hidden" name="num=10" />
<input type="hidden" name="search_dupid" />
<input type="hidden" name="exttimeout=false" />
<input type="hidden" name="actProfId" value="0" /><!-- Q -->
<input type="hidden" name="group" value="Documentation" />
<input type="hidden" name="sw" value="t" />
<input type="hidden" name="search_p_main_operator" value="all" />
<input type="hidden" name="search_p_atname" value="" />
<input type="hidden" name="adn" value="" />
<input type="hidden" name="search_p_op" value="equals" />
<input type="hidden" name="search_p_val" value="" />
<input type="hidden" name="search_p_atname" value="" />
<input type="hidden" name="adn" value="" />
<input type="hidden" name="search_p_op" value="equals" />
<input type="hidden" name="search_p_val" value="" />
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="Oracle" />
</fieldset></form>

<form action="http://pkgsrc.se/search.php" method="get"><fieldset>
<input type="text" name="so" />
<input type="submit" value="NetBSD pkgsrc" />
</fieldset></form>

<form action="https://www.postgresql.org/search/" method="get"><fieldset>
<input id="q" type="text" accesskey="s" value="" maxlength="255" name="q" />
<input type="hidden" value="1" name="a" />
<input id="submit" type="submit" value="Search" name="PostgreSQL" />
</fieldset></form>

<form method="get" action="https://rubygems.org/search"><fieldset>
<input type="hidden" name="utf8" value="✓" />
<input type="text" role="textbox" name="query" maxlength="255" />
<input type="submit" value="RubyGems" />
</fieldset></form>

<form method="get" action="https://www.safaribooksonline.com/search"><fieldset>
<input type="text" role="textbox" name="query" maxlength="255" />
<input type="submit" value="Safari Books Online" />
</fieldset></form>

<form action="https://safebooru.org/index.php"><fieldset>
<input type="hidden" name="page" value="post" />
<input type="hidden" name="s" value="list" />
<input type="text" name="tags" maxlength="255" />
<input type="submit" value="Safebooru" />
</fieldset></form>

<form method="get" action="https://serverfault.com/search/"><fieldset>
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="Server Fault" />
</fieldset></form>

<form method="get" action="https://apple.stackexchange.com/search/"><fieldset>
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="StackExchange: Ask Different" />
</fieldset></form>

<form method="get" action="https://dba.stackexchange.com/search/"><fieldset>
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="StackExchange: DBAs" />
</fieldset></form>

<form method="get" action="https://security.stackexchange.com/search/"><fieldset>
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="StackExchange: Infosec" />
</fieldset></form>

<form method="get" action="https://stackoverflow.com/search/"><fieldset>
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="Stack Overflow" />
</fieldset></form>

<form method="get" action="https://superuser.com/search/"><fieldset>
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="Super User" />
</fieldset></form>

<form method="get" action="https://unix.stackexchange.com/search/"><fieldset>
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="StackExchange: Unix and Linux" />
</fieldset></form>

<form method="get" action="https://twitter.com/search"><fieldset>
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="Twitter" />
</fieldset></form>

<form method="get" action="https://articles.lib.uts.edu.au/search"><fieldset>
<input type="hidden" name="N" value="0" />
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="UTS Library Articles" />
</fieldset></form>

<form method="get" action="https://find.lib.uts.edu.au/search.do"><fieldset>
<input type="hidden" name="N" value="0" />
<input type="text" role="textbox" name="Ntt" maxlength="255" />
<input type="submit" value="UTS Library Catalogue" />
</fieldset></form>

<form method="get" action="https://www.lib.uts.edu.au/databases/search_databases.py"><fieldset>
<input type="hidden" name="N" value="0" />
<input type="text" role="textbox" name="search" maxlength="255" />
<input type="submit" value="UTS Library Databases" />
</fieldset></form>

<form method="get" action="https://vimeo.com/search/"><fieldset>
<input type="text" role="textbox" name="q" maxlength="255" />
<input type="submit" value="Vimeo" />
</fieldset></form>

<form id="up_search_form" action="https://forums.whirlpool.net.au/forum/?action=search" method="post" role="search"><fieldset>
<input id="up_search_input" type="text" name="q" />
<input type="submit" value="Whirlpool" />
</fieldset></form>

<form method="get" action="https://commons.wikimedia.org/w/index.php"><fieldset>
<input type="text" name="search" maxlength="255" />
<input type="submit" value="Wikimedia Commons" />
</fieldset></form>

<form method="get" action="https://de.wiktionary.org/w/index.php"><fieldset>
<input type="text" role="textbox" name="search" maxlength="255" />
<input type="submit" value="Wikipedia (de)" />
</fieldset></form>

<form method="get" action="https://en.wikipedia.org/w/index.php"><fieldset>
<input type="text" role="textbox" name="search" maxlength="255" />
<input type="submit" value="Wikipedia (en)" />
</fieldset></form>

<form method="get" action="https://ko.wiktionary.org/w/index.php"><fieldset>
<input type="text" role="textbox" name="search" maxlength="255" />
<input type="submit" value="Wikipedia (한국어)" />
</fieldset></form>

<form method="get" action="https://ja.wikipedia.org/w/index.php"><fieldset>
<input type="text" role="textbox" name="search" maxlength="255" />
<input type="submit" value="Wikipedia (日本語)" />
</fieldset></form>

<form method="get" action="https://de.wiktionary.org/w/index.php"><fieldset>
<input type="text" role="textbox" name="search" maxlength="255" />
<input type="submit" value="Wiktionary (de)" />
</fieldset></form>

<form method="get" action="https://en.wiktionary.org/w/index.php"><fieldset>
<input type="text" role="textbox" name="search" maxlength="255" />
<input type="submit" value="Wiktionary (en)" />
</fieldset></form>

<form method="get" action="https://ko.wiktionary.org/w/index.php"><fieldset>
<input type="text" role="textbox" name="search" maxlength="255" />
<input type="submit" value="Wiktionary (한국어)" />
</fieldset></form>

<form method="get" action="https://ja.wiktionary.org/w/index.php"><fieldset>
<input type="text" role="textbox" name="search" maxlength="255" />
<input type="submit" value="Wiktionary (日本語)" />
</fieldset></form>

<form method="get" action="https://en.wikivoyage.org/w/index.php"><fieldset>
<input type="text" role="textbox" name="search" maxlength="255" />
<input type="submit" value="WikiVoyage" />
</fieldset></form>

<form method="get" action="https://search.yahoo.com/search"><fieldset>
<input type="text" name="q" maxlength="255" />
<input type="submit" value="Yahoo!" />
</fieldset></form>

<form method="get" action="https://www.yandex.com/yandsearch"><fieldset>
<input type="text" role="textbox" name="text" maxlength="255" />
<input type="submit" value="Yandex" />
</fieldset></form>

<form method="get" action="https://www.yandex.com/images/search"><fieldset>
<input type="text" role="textbox" name="text" maxlength="255" />
<input type="submit" value="Yandex Images" />
</fieldset></form>

<form method="get" action="https://www.youtube.com/results"><fieldset>
<input type="text" role="textbox" name="search_query" maxlength="255" />
<input type="submit" value="YouTube" />
</fieldset></form>

<form action="https://www.zerochan.net/search"><fieldset>
<input type="text" name="q" maxlength="255" />
<input type="submit" value="Zerochan" />
</fieldset></form>


