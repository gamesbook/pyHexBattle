<?xml version="1.0"?>
<!--
  Author: Derek Hohls
  Date: 17 Jun 2003
  Typical Usage with XT: 
    xt bc_Battle.xml battle2text.xsl Battle.txt     
-->
<xsl:stylesheet 
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:hbml="http://users.erols.com/jadf/bc/"
  exclude-result-prefixes="hbml"
  >
  
<xsl:strip-space elements="*"/>  
<xsl:output method="text" indent="no"/>

<xsl:variable name="newline">
<xsl:text>
</xsl:text>
</xsl:variable>
<xsl:variable name="tab">
<xsl:text>&#009;</xsl:text>
</xsl:variable>

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="hbml:hexbattle[@type='battlecry']">BATTLE OF <xsl:value-of select="translate(hbml:scenario/hbml:name,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/><xsl:if test="hbml:scenario/hbml:title != ''"> - </xsl:if><xsl:value-of select="hbml:scenario/hbml:title"/>  <xsl:value-of select="hbml:scenario/hbml:period"/> - <xsl:value-of select="hbml:scenario/hbml:date"/>
<xsl:value-of select="$newline"/>
<xsl:if test="hbml:meta/hbml:designer/hbml:name != ''">Designed by <xsl:value-of select="hbml:meta/hbml:designer/hbml:name"/> <xsl:value-of select="hbml:meta/hbml:designer/hbml:email"/> </xsl:if>

NOTATION
  The top row is numbered 101, 102, 103, ..., 113, the second row is
201, 202, ..., 212, and so on.  If a space is not covered here it
is clear terrain.
  Terrain 'facing' is indicated using a number from [1] to [6], where
[1] is either the top point of a hex, or the top, right-hand hexside,
and other numbers are located in a clockwise direction.
  
TERRAIN
<xsl:apply-templates select="hbml:terrain"/>

FORCES
<xsl:apply-templates select="hbml:forces"/>

STAFFING NOTES

Union Player: <xsl:value-of select="hbml:forces/hbml:force[@type='union']/hbml:commander"/>, <xsl:value-of select="hbml:forces/hbml:force[@type='union']/hbml:special/hbml:cards"/> command cards <xsl:if test="hbml:forces/hbml:force[@type='union']/hbml:special/hbml:instructions != ''">(<xsl:value-of select="hbml:forces/hbml:force[@type='union']/hbml:special/hbml:instructions"/>)</xsl:if>
Confederate Player: <xsl:value-of select="hbml:forces/hbml:force[@type='confederate']/hbml:commander"/>, <xsl:value-of select="hbml:forces/hbml:force[@type='confederate']/hbml:special/hbml:cards"/> command cards <xsl:if test="hbml:forces/hbml:force[@type='confederate']/hbml:special/hbml:instructions != ''">(<xsl:value-of select="hbml:forces/hbml:force[@type='confederate']/hbml:special/hbml:instructions"/>)</xsl:if>

<xsl:apply-templates select="hbml:notes"/>

</xsl:template>

<!-- processed elswhere -->

<xsl:template match="hbml:meta">
</xsl:template>

<xsl:template match="hbml:scenario">
</xsl:template>

<xsl:template match="hbml:note">
</xsl:template>

<!-- terrain -->

<xsl:template match="hbml:terrain">
  <xsl:apply-templates select="hbml:hex">
    <xsl:sort select="@row" data-type="number"/>
    <xsl:sort select="@col" data-type="number"/>    
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="hbml:hex"><xsl:if test="@type='terrain'"><xsl:value-of select="@row"/><xsl:choose><xsl:when test="string-length(@col) &lt; 2">0<xsl:value-of select="@col"/></xsl:when><xsl:otherwise><xsl:value-of select="@col"/></xsl:otherwise></xsl:choose> - <xsl:value-of select="translate(@style,'_',',')"/><xsl:if test="@face != ''">[<xsl:value-of select="@face"/>]</xsl:if><xsl:if test=". != ''">(<xsl:value-of select="."/>)</xsl:if><xsl:value-of select="$newline"/></xsl:if>
</xsl:template>

<!-- forces -->

<xsl:template match="hbml:forces">
Union:
  <xsl:apply-templates select="hbml:force[@type='union']"/>
Confederate:
  <xsl:apply-templates select="hbml:force[@type='confederate']"/>  
</xsl:template>

<xsl:template match="hbml:force">
  <xsl:apply-templates select="hbml:unit">
    <xsl:sort select="@row" data-type="number"/>
    <xsl:sort select="@col" data-type="number"/>    
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="hbml:unit"><xsl:value-of select="@row"/><xsl:choose><xsl:when test="string-length(@col) &lt; 2">0<xsl:value-of select="@col"/></xsl:when><xsl:otherwise><xsl:value-of select="@col"/></xsl:otherwise></xsl:choose> - <xsl:value-of select="@type"/><xsl:if test=". != ''">(<xsl:value-of select="."/>)</xsl:if><xsl:value-of select="$newline"/>
</xsl:template>

<!-- notes -->

<xsl:template match="hbml:notes">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="hbml:note[@type='special']">
  <xsl:if test="count(hbml:p) &gt; 0">
<xsl:value-of select="$newline"/>  
Special Rule:
<xsl:apply-templates/>
  </xsl:if>
</xsl:template>

<xsl:template match="hbml:p"><xsl:apply-templates/><xsl:value-of select="$newline"/></xsl:template>

<xsl:template match="hbml:comment"><xsl:apply-templates/></xsl:template>

<!--
<xsl:template match="hbml:">
  <xsl:apply-templates/>
</xsl:template>
-->

</xsl:stylesheet>


