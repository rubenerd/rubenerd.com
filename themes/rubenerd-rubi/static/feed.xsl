<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="html" />
  <xsl:template match="/rss/channel">
    <xsl:element name="html">
      <head>
        <xsl:element name="meta" />
        <title><xsl:value-of select="title" /> Feed</title>
      </head>
    </xsl:element>
    <body>
      <h1><xsl:value-of select="title" /> Feed</h1>
      <p>You're viewing an RSS feed, a machine-readable data file that can be used to subscribe to my <a href="https://rubenerd.com/">blog</a> and <a href="https://rubenerd.com/show/">podcast</a>. Paste one of the following URLs into your feed reader, and you'll always get the latest stuff!</p>

      <h2>Available feeds</h2>
      <p><strong>For blog posts: </strong> <code><a href="https://rubenerd.com/feed/">https://rubenerd.com/feed/</a></code><br />
      <strong>For podcast episodes: </strong> <code><a href="http://showfeed.rubenerd.com/">http://showfeed.rubenerd.com/</a></code></p>

      <h2>Latest posts</h2>
      <ol>
        <xsl:for-each select="/rss/channel/item">
          <li><a href="{link}"><xsl:value-of select="title" /></a>, <small><xsl:value-of select="pubDate" /></small></li>
        </xsl:for-each>
      </ol>

      <p>Return to <a href="https://rubenerd.com/">Rubenerd.com</a>.</p>   
 
    </body>
  </xsl:template>
</xsl:stylesheet>
