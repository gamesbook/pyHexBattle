<?xml version="1.0"?>
<!--
  Author: Derek Hohls
  Date: 17 Jun 2004
  Typical Usage with Instant Saxon: 
    saxon -o Battle.html mem_Battle.xml battle2text.xsl       
-->
<xsl:stylesheet 
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:hbml="http://www.daysofwonder.com/memoir44/"
  exclude-result-prefixes="hbml"
>

<!-- IMPORTS -->  
<xsl:import href="common.xsl"/> 
<xsl:import href="linebreak.xsl"/>  

<!-- SETTINGS -->
<xsl:strip-space elements="*"/>  
<xsl:output method="text" indent="no"/>

<!-- GLOBAL PARAMS --> 
<xsl:param name="dateStyle">EURO</xsl:param>

<!-- GLOBAL VARS -->
<xsl:variable name="newline">
<xsl:text>
</xsl:text>
</xsl:variable>
<xsl:variable name="tab">
<xsl:text>&#009;</xsl:text>
</xsl:variable>

<!-- ROOT START -->
<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>


<xsl:template match="hbml:hexbattle[@type='memoir44']">MEMOIR'44 SCENARIO
==================

<xsl:value-of select="translate(hbml:scenario/hbml:name,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/><xsl:if test="hbml:scenario/hbml:title != ''"> - </xsl:if><xsl:value-of select="hbml:scenario/hbml:title"/>  <xsl:value-of select="hbml:scenario/hbml:period"/> - <xsl:call-template name="formatDate"><xsl:with-param name="year" select="hbml:scenario/hbml:date/@year"/><xsl:with-param name="month" select="hbml:scenario/hbml:date/@month"/><xsl:with-param name="day" select="hbml:scenario/hbml:date/@day"/><xsl:with-param name="style" select="$dateStyle"/></xsl:call-template>
<xsl:value-of select="$newline"/>
<xsl:if test="hbml:meta/hbml:designer/hbml:name != ''">Designed by <xsl:value-of select="hbml:meta/hbml:designer/hbml:name"/> <xsl:value-of select="hbml:meta/hbml:designer/hbml:email"/> </xsl:if>
<xsl:value-of select="$newline"/>
<xsl:value-of select="hbml:meta/hbml:designer/hbml:website"/>

NOTATION
  The board has 9 rows and 13 columns.  Location of all pieces
(terrain, markers, medals, forces) is given by a 3 digit code 
  The top row is numbered 101, 102, 103, ..., 113; the second 
row is 201, 202, ..., 212, and so on.  If a space is not 
covered here it is clear terrain.
  Terrain 'facing' is indicated using a number from [1] to [6],
where [1] is either the top point of a hex, or the top, right-
hand hexside, and other numbers are located in a clockwise 
direction.  
<xsl:apply-templates select="hbml:terrain"/>

SUMMARY OF PIECES
  You will need the following to play this scenario:
<xsl:apply-templates select="hbml:terrain" mode="hexcount"/>
<xsl:apply-templates select="hbml:terrain" mode="markcount"/>
<xsl:apply-templates select="hbml:terrain" mode="medcount"/>
<xsl:apply-templates select="hbml:forces" mode="unitcount"/> 

FORCES
<xsl:apply-templates select="hbml:forces"/>

<xsl:apply-templates select="hbml:notes/hbml:note[@type='historical']"/>

BRIEFING NOTES
<xsl:apply-templates select="hbml:forces/hbml:force" mode="instructions"/>

<xsl:apply-templates select="hbml:notes/hbml:note[@type='victory']"/>
<xsl:apply-templates select="hbml:notes/hbml:note[@type='special']"/>
</xsl:template>

<!-- terrain -->

<xsl:template match="hbml:terrain">
TERRAIN
<xsl:apply-templates select="hbml:hex" mode="terrain">
  <xsl:sort select="@row" data-type="number"/>
  <xsl:sort select="@col" data-type="number"/>    
</xsl:apply-templates>

<xsl:if test="count(hbml:hex[@type='marker']) != 0">
MARKERS
<xsl:apply-templates select="hbml:hex" mode="marker">
  <xsl:sort select="@row" data-type="number"/>
  <xsl:sort select="@col" data-type="number"/>    
</xsl:apply-templates>  
</xsl:if>  

<xsl:if test="count(hbml:hex[@type='medal']) != 0">
MEDALS
<xsl:apply-templates select="hbml:hex" mode="medal">
  <xsl:sort select="@row" data-type="number"/>
  <xsl:sort select="@col" data-type="number"/>    
</xsl:apply-templates>  
</xsl:if> 

</xsl:template>


<xsl:template match="hbml:hex" mode="terrain"><xsl:if test="@type='terrain'"><xsl:value-of select="@row"/><xsl:choose><xsl:when test="string-length(@col) &lt; 2">0<xsl:value-of select="@col"/></xsl:when><xsl:otherwise><xsl:value-of select="@col"/></xsl:otherwise></xsl:choose> - <xsl:value-of select="translate(@style,'_',',')"/><xsl:if test="@face != ''">[<xsl:value-of select="@face"/>]</xsl:if><xsl:if test=". != ''">(<xsl:value-of select="."/>)</xsl:if><xsl:value-of select="$newline"/></xsl:if>
</xsl:template>

<xsl:template match="hbml:hex" mode="marker"><xsl:if test="@type='marker'"><xsl:value-of select="@row"/><xsl:choose><xsl:when test="string-length(@col) &lt; 2">0<xsl:value-of select="@col"/></xsl:when><xsl:otherwise><xsl:value-of select="@col"/></xsl:otherwise></xsl:choose> - <xsl:value-of select="translate(@style,'_',' ')"/><xsl:if test="@face != ''">[<xsl:value-of select="@face"/>]</xsl:if><xsl:if test=". != ''">(<xsl:value-of select="."/>)</xsl:if><xsl:value-of select="$newline"/></xsl:if>
</xsl:template>

<xsl:template match="hbml:hex" mode="medal"><xsl:if test="@type='medal'"><xsl:value-of select="@row"/><xsl:choose><xsl:when test="string-length(@col) &lt; 2">0<xsl:value-of select="@col"/></xsl:when><xsl:otherwise><xsl:value-of select="@col"/></xsl:otherwise></xsl:choose> - <xsl:value-of select="translate(@style,'_',' ')"/><xsl:if test="@face != ''">[<xsl:value-of select="@face"/>]</xsl:if><xsl:if test=". != ''">(<xsl:value-of select="."/>)</xsl:if><xsl:value-of select="$newline"/></xsl:if>
</xsl:template>

<!-- forces -->

<xsl:template match="hbml:forces">
Axis:
<xsl:apply-templates select="hbml:force[@type='german']"/>
Allied:
<xsl:apply-templates select="hbml:force[@type='allied']"/>  
</xsl:template>

<xsl:template match="hbml:force">
  <xsl:apply-templates select="hbml:unit">
    <xsl:sort select="@row" data-type="number"/>
    <xsl:sort select="@col" data-type="number"/>    
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="hbml:unit"><xsl:value-of select="@row"/><xsl:choose><xsl:when test="string-length(@col) &lt; 2">0<xsl:value-of select="@col"/></xsl:when><xsl:otherwise><xsl:value-of select="@col"/></xsl:otherwise></xsl:choose> - <xsl:value-of select="@type"/><xsl:choose><xsl:when test="@special='ffi'"> [FFI]</xsl:when><xsl:when test="@special='us_rangers'"> [US Rangers]</xsl:when><xsl:when test="@special='br_airborne'"> [Brit. Airborne]</xsl:when><xsl:when test="@special='ger_special'"> [Ger. Special Forces]</xsl:when></xsl:choose><xsl:if test=". != ''"> (<xsl:value-of select="."/>)</xsl:if><xsl:value-of select="$newline"/>
</xsl:template>

<!-- notes -->

<xsl:template match="hbml:notes"/>

<xsl:template match="hbml:note[@type='historical']">
  <xsl:if test="count(hbml:p) &gt; 0">
<xsl:value-of select="$newline"/>  
HISTORICAL BACKGROUND
<xsl:apply-templates/>
  </xsl:if>
</xsl:template>

<xsl:template match="hbml:note[@type='historical']/hbml:p">
  <xsl:call-template name="breakText">
    <xsl:with-param name="strMsg" select="text()"/>
    <xsl:with-param name="numChars" select="64"/>
  </xsl:call-template>
</xsl:template>


<xsl:template match="hbml:forces/hbml:force[@type='german']" mode="instructions">
Axis Player:<xsl:if test="count(hbml:special/hbml:instructions/hbml:p) != 0"><xsl:apply-templates select="hbml:special/hbml:instructions/hbml:p" mode="instruct"/></xsl:if>
</xsl:template>

<xsl:template match="hbml:forces/hbml:force[@type='allied']" mode="instructions">

Allied Player:<xsl:if test="count(hbml:special/hbml:instructions/hbml:p) != 0"><xsl:apply-templates select="hbml:special/hbml:instructions/hbml:p" mode="instruct"/></xsl:if>
</xsl:template>

<xsl:template match="hbml:special/hbml:instructions/hbml:p" mode="instruct">
<xsl:if test="text() != ''">
* <xsl:call-template name="breakText">
  <xsl:with-param name="strMsg" select="text()"/>
  <xsl:with-param name="numChars" select="64"/>
</xsl:call-template>
</xsl:if>
</xsl:template>



<xsl:template match="hbml:note[@type='victory']">
  <xsl:if test="count(hbml:p) &gt; 0">
<xsl:value-of select="$newline"/>  
CONDITIONS OF VICTORY:
<xsl:apply-templates/>
  </xsl:if>
</xsl:template>

<xsl:template match="hbml:note[@type='victory']/hbml:p">
  <xsl:call-template name="breakText">
    <xsl:with-param name="strMsg" select="text()"/>
    <xsl:with-param name="numChars" select="64"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="hbml:note[@type='special']">
  <xsl:if test="count(hbml:p) &gt; 0">
<xsl:value-of select="$newline"/>  
SPECIAL RULES:
<xsl:apply-templates/>
  </xsl:if>
</xsl:template>

<xsl:template match="hbml:note[@type='special']/hbml:p">
  <xsl:call-template name="breakText">
    <xsl:with-param name="strMsg" select="text()"/>
    <xsl:with-param name="numChars" select="64"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="hbml:comment"><xsl:apply-templates/></xsl:template>

<!-- count of pieces -->

<xsl:template match="hbml:forces" mode="unitcount"/>

<xsl:template match="hbml:terrain" mode="hexcount">
Terrain:
<xsl:variable name="hedgerowTot"><xsl:value-of select="count(hbml:hex[@style='hedgerow'])"/></xsl:variable>
<xsl:if test="$hedgerowTot != 0">* <xsl:value-of select="$hedgerowTot"/> x Hedgerow<xsl:value-of select="$newline"/></xsl:if>
<xsl:variable name="woodsTot"><xsl:value-of select="count(hbml:hex[@style='woods'])"/></xsl:variable>
<xsl:if test="$woodsTot != 0">* <xsl:value-of select="$woodsTot"/> x Woods<xsl:value-of select="$newline"/></xsl:if>  
<xsl:variable name="hillTot"><xsl:value-of select="count(hbml:hex[@style='hill'])"/></xsl:variable> 
<xsl:if test="$hillTot != 0">* <xsl:value-of select="$hillTot"/> x Hill <xsl:value-of select="$newline"/></xsl:if>
<xsl:variable name="townTot"><xsl:value-of select="count(hbml:hex[@style='town'])"/></xsl:variable>
<xsl:if test="$townTot != 0">* <xsl:value-of select="$townTot"/> x Town<xsl:value-of select="$newline"/></xsl:if>  
<xsl:variable name="villageTot"><xsl:value-of select="count(hbml:hex[@style='village'])"/></xsl:variable>
<xsl:if test="$villageTot != 0">* <xsl:value-of select="$villageTot"/> x Village<xsl:value-of select="$newline"/></xsl:if>  
<xsl:variable name="river_straightTot"><xsl:value-of select="count(hbml:hex[@style='river_straight'])"/></xsl:variable>
<xsl:if test="$river_straightTot != 0">* <xsl:value-of select="$river_straightTot"/> x Straight River<xsl:value-of select="$newline"/></xsl:if>
<xsl:variable name="river_curveTot"><xsl:value-of select="count(hbml:hex[@style='river_curve'])"/></xsl:variable>
<xsl:if test="$river_curveTot != 0">* <xsl:value-of select="$river_curveTot"/> x Curved River<xsl:value-of select="$newline"/></xsl:if>    
</xsl:template>

<xsl:template match="hbml:terrain" mode="markcount">
Markers:
<xsl:variable name="german_hedgehogTot"><xsl:value-of select="count(hbml:hex[@style='german_hedgehog'])"/></xsl:variable>
<xsl:if test="$german_hedgehogTot != 0">* <xsl:value-of select="$german_hedgehogTot"/> x Hedgehog (Axis)<xsl:value-of select="$newline"/></xsl:if>
<xsl:variable name="german_sandbagTot"><xsl:value-of select="count(hbml:hex[@style='german_sandbag'])"/></xsl:variable>
<xsl:if test="$german_sandbagTot != 0">* <xsl:value-of select="$german_sandbagTot"/> x Sandbag (Axis)<xsl:value-of select="$newline"/></xsl:if>
<xsl:variable name="german_wireTot"><xsl:value-of select="count(hbml:hex[@style='german_wire'])"/></xsl:variable>
<xsl:if test="$german_wireTot != 0">* <xsl:value-of select="$german_wireTot"/> x Wire (Axis)<xsl:value-of select="$newline"/></xsl:if> 
<xsl:variable name="allied_hedgehogTot"><xsl:value-of select="count(hbml:hex[@style='allied_hedgehog'])"/></xsl:variable>
<xsl:if test="$allied_hedgehogTot != 0">* <xsl:value-of select="$allied_hedgehogTot"/> x Hedgehog (Allied)<xsl:value-of select="$newline"/></xsl:if>
<xsl:variable name="allied_sandbagTot"><xsl:value-of select="count(hbml:hex[@style='allied_sandbag'])"/></xsl:variable>
<xsl:if test="$allied_sandbagTot != 0">* <xsl:value-of select="$allied_sandbagTot"/> x Sandbag (Allied)<xsl:value-of select="$newline"/></xsl:if>
<xsl:variable name="allied_wireTot"><xsl:value-of select="count(hbml:hex[@style='allied_wire'])"/></xsl:variable>
<xsl:if test="$allied_wireTot != 0">* <xsl:value-of select="$allied_wireTot"/> x Wire (Allied)<xsl:value-of select="$newline"/></xsl:if>    
</xsl:template>

<xsl:template match="hbml:terrain" mode="medcount">
Medals:
<xsl:variable name="german_medalTot"><xsl:value-of select="count(hbml:hex[@style='german_medal'])"/></xsl:variable>
<xsl:if test="$german_medalTot != 0">* <xsl:value-of select="$german_medalTot"/> x Medal (Axis)<xsl:value-of select="$newline"/></xsl:if> 
<xsl:variable name="allied_medalTot"><xsl:value-of select="count(hbml:hex[@style='allied_medal'])"/></xsl:variable>
<xsl:if test="$allied_medalTot != 0">* <xsl:value-of select="$allied_medalTot"/> x Medal (Allied)<xsl:value-of select="$newline"/></xsl:if>    
</xsl:template>

<!-- processed elswhere -->

<xsl:template match="hbml:p"/>

<xsl:template match="hbml:meta"/>

<xsl:template match="hbml:scenario"/>

<xsl:template match="hbml:note"/>

<!--
<xsl:template match="hbml:">
  <xsl:apply-templates/>
</xsl:template>
-->

</xsl:stylesheet>


