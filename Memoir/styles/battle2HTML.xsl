<?xml version="1.0"?>
<!--
  Author: Derek Hohls
  Date: 27 Jun 2004
  Typical Usage with Instant Saxon: 
    saxon -o Battle.html mem_Battle.xml battle2HTML.xsl     
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

<!-- SETTINGS -->  
<xsl:output method="html" indent="no"/>

<!-- GLOBAL PARAMS --> 
<xsl:param name="pLf">0</xsl:param>
<xsl:param name="dateStyle">US</xsl:param>

<!-- ROOT START -->
<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="hbml:hexbattle[@type='memoir44']">
<html>
<head>
  <title>Memoir'44 Scenario</title>
  <style type="text/css">
  body {font-family: Arial,Helvetica,san-serif }
  h1, .Dark, hr {font-family:Army,"Times New Roman",Times,serif; color: #9F0004}
  h2, .Footnote {font-family:Gunplay,Verdana,Arial,Helvetica,san-serif; color: #D88E4A}
  .smaller  {font-size: 75%}
  .Footnote {font-size: 66%; text-align: center;}
  </style>
</head>
<body>
  
  <h1 align="center">A Memoir'44 Scenario</h1>
  <h2 class="Dark"><xsl:value-of select="translate(hbml:scenario/hbml:name,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/><xsl:if test="hbml:scenario/hbml:title != ''"> - </xsl:if><xsl:value-of select="hbml:scenario/hbml:title"/>  <xsl:value-of select="hbml:scenario/hbml:period"/> - <span class="smaller"><xsl:call-template name="formatDate"><xsl:with-param name="year" select="hbml:scenario/hbml:date/@year"/><xsl:with-param name="month" select="hbml:scenario/hbml:date/@month"/><xsl:with-param name="day" select="hbml:scenario/hbml:date/@day"/><xsl:with-param name="style" select="$dateStyle"/></xsl:call-template></span></h2>
  
  <xsl:if test="hbml:meta/hbml:designer/hbml:name != ''"><p><b>Designed by <xsl:value-of select="hbml:meta/hbml:designer/hbml:name"/> <xsl:value-of select="hbml:meta/hbml:designer/hbml:email"/></b></p></xsl:if>
  
  <a><xsl:attribute name="href"><xsl:value-of select="hbml:meta/hbml:designer/hbml:website"/></xsl:attribute>
  <xsl:value-of select="hbml:meta/hbml:designer/hbml:website"/></a>
  
  <hr/>

  <xsl:apply-templates select="hbml:notes/hbml:note[@type='historical']"/>
  
  <h2>Setup</h2>
  <p>You will need the following to play this scenario:</p>
  <xsl:apply-templates select="hbml:terrain" mode="hexcount"/>
  <xsl:apply-templates select="hbml:terrain" mode="obscount"/>
  <xsl:apply-templates select="hbml:terrain" mode="medcount"/>
  <xsl:apply-templates select="hbml:forces" mode="unitcount"/>  
  
  <h2>Briefing Notes</h2>
  <xsl:apply-templates select="hbml:forces/hbml:force" mode="instructions"/>
  
  <xsl:apply-templates select="hbml:notes/hbml:note[@type='victory']"/>
  
  <xsl:apply-templates select="hbml:notes/hbml:note[@type='special']"/>
  
  <!-- PROCESS IN SVG ! -->
  <!-- terrain -->
  <!-- forces -->

  <hr/>
  <div class="footnote"><b>Memoir'44</b> is produced by <i><a href="http://www.daysofwonder.com">Days of Wonder</a></i><br/>
  All images, titles, and products are trademarks and/or copyrights of
their respective owners.<br/>
  This is a non-commercial website and no copyright infringements are intended by providing any material that exists here.
</div>
  
</body>
</html>

</xsl:template>


<!-- notes -->

<xsl:template match="hbml:notes"/>

<xsl:template match="hbml:note[@type='historical']">
<xsl:if test="count(hbml:p) &gt; 0">
  <h2>Historical Background</h2>
  <xsl:apply-templates/>
</xsl:if>
</xsl:template>

<xsl:template match="hbml:note[@type='historical']/hbml:p">
<xsl:if test="text() != ''">
  <p><xsl:apply-templates/></p>
</xsl:if>  
</xsl:template>


<xsl:template match="hbml:forces/hbml:force[@type='german']" mode="instructions">
<h3>Axis Player:</h3>
<xsl:if test="count(hbml:special/hbml:instructions/hbml:p) != 0">
<ul>
  <xsl:apply-templates select="hbml:special/hbml:instructions/hbml:p" mode="instruct"/>
</ul>  
</xsl:if>
</xsl:template>

<xsl:template match="hbml:forces/hbml:force[@type='allied']" mode="instructions">
<h3>Allied Player:</h3>
<xsl:if test="count(hbml:special/hbml:instructions/hbml:p) != 0">
<ul>
  <xsl:apply-templates select="hbml:special/hbml:instructions/hbml:p" mode="instruct"/>
</ul>
</xsl:if>
</xsl:template>

<xsl:template match="hbml:special/hbml:instructions/hbml:p" mode="instruct">
<xsl:if test="text() != ''">
  <li><xsl:apply-templates/></li>
</xsl:if>
</xsl:template>


<xsl:template match="hbml:note[@type='victory']">
<xsl:if test="count(hbml:p) &gt; 0"> 
  <h2>Conditions of Victory:</h2>
  <xsl:apply-templates/>
</xsl:if>
</xsl:template>

<xsl:template match="hbml:note[@type='victory']/hbml:p">
<xsl:if test="text() != ''">
  <p><xsl:apply-templates/></p>
</xsl:if>
</xsl:template>


<xsl:template match="hbml:note[@type='special']">
<xsl:if test="count(hbml:p) &gt; 0">
  <h2>Special Rules:</h2>
  <xsl:apply-templates/>
</xsl:if>
</xsl:template>

<xsl:template match="hbml:note[@type='special']/hbml:p">
<xsl:if test="text() != ''">
  <p><xsl:apply-templates/></p>
</xsl:if>
</xsl:template>

<xsl:template match="hbml:comment"><xsl:apply-templates/></xsl:template>

<!-- processed elswhere -->

<xsl:template match="hbml:p"/>

<xsl:template match="hbml:meta"/>

<xsl:template match="hbml:scenario"/>

<xsl:template match="hbml:note"/>

<xsl:template match="hbml:forces" mode="unitcount"/>

<xsl:template match="hbml:terrain" mode="hexcount">
<h3>Terrain:</h3>
<ul>
  <xsl:variable name="hedgerowTot"><xsl:value-of select="count(hbml:hex[@style='hedgerow'])"/></xsl:variable>
  <xsl:if test="$hedgerowTot != 0"><li><xsl:value-of select="$hedgerowTot"/> x Hedgerow</li></xsl:if>
  <xsl:variable name="woodsTot"><xsl:value-of select="count(hbml:hex[@style='woods'])"/></xsl:variable>
  <xsl:if test="$woodsTot != 0"><li><xsl:value-of select="$woodsTot"/> x Woods</li></xsl:if>  
  <xsl:variable name="hillTot"><xsl:value-of select="count(hbml:hex[@style='hill'])"/></xsl:variable> 
  <xsl:if test="$hillTot != 0"><li><xsl:value-of select="$hillTot"/> x Hill </li></xsl:if>
  <xsl:variable name="townTot"><xsl:value-of select="count(hbml:hex[@style='town'])"/></xsl:variable>
  <xsl:if test="$townTot != 0"><li><xsl:value-of select="$townTot"/> x Town</li></xsl:if>  
  <xsl:variable name="villageTot"><xsl:value-of select="count(hbml:hex[@style='village'])"/></xsl:variable>
  <xsl:if test="$villageTot != 0"><li><xsl:value-of select="$villageTot"/> x Village</li></xsl:if>  
  <xsl:variable name="river_straightTot"><xsl:value-of select="count(hbml:hex[@style='river_straight'])"/></xsl:variable>
  <xsl:if test="$river_straightTot != 0"><li><xsl:value-of select="$river_straightTot"/> x Straight River</li></xsl:if>
  <xsl:variable name="river_curveTot"><xsl:value-of select="count(hbml:hex[@style='river_curve'])"/></xsl:variable>
  <xsl:if test="$river_curveTot != 0"><li><xsl:value-of select="$river_curveTot"/> x Curved River</li></xsl:if>    
</ul>
</xsl:template>

<xsl:template match="hbml:terrain" mode="obscount">
<h3>Obstacles:</h3>
<ul>
  <xsl:variable name="german_hedgehogTot"><xsl:value-of select="count(hbml:hex[@style='german_hedgehog'])"/></xsl:variable>
  <xsl:if test="$german_hedgehogTot != 0"><li><xsl:value-of select="$german_hedgehogTot"/> x Hedgehog (Axis)</li></xsl:if>
  <xsl:variable name="german_sandbagTot"><xsl:value-of select="count(hbml:hex[@style='german_sandbag'])"/></xsl:variable>
  <xsl:if test="$german_sandbagTot != 0"><li><xsl:value-of select="$german_sandbagTot"/> x Sandbag (Axis)</li></xsl:if>
  <xsl:variable name="german_wireTot"><xsl:value-of select="count(hbml:hex[@style='german_wire'])"/></xsl:variable>
  <xsl:if test="$german_wireTot != 0"><li><xsl:value-of select="$german_wireTot"/> x Wire (Axis)</li></xsl:if> 
  <xsl:variable name="allied_hedgehogTot"><xsl:value-of select="count(hbml:hex[@style='allied_hedgehog'])"/></xsl:variable>
  <xsl:if test="$allied_hedgehogTot != 0"><li><xsl:value-of select="$allied_hedgehogTot"/> x Hedgehog (Allied)</li></xsl:if>
  <xsl:variable name="allied_sandbagTot"><xsl:value-of select="count(hbml:hex[@style='allied_sandbag'])"/></xsl:variable>
  <xsl:if test="$allied_sandbagTot != 0"><li><xsl:value-of select="$allied_sandbagTot"/> x Sandbag (Allied)</li></xsl:if>
  <xsl:variable name="allied_wireTot"><xsl:value-of select="count(hbml:hex[@style='allied_wire'])"/></xsl:variable>
  <xsl:if test="$allied_wireTot != 0"><li><xsl:value-of select="$allied_wireTot"/> x Wire (Allied)</li></xsl:if>    
</ul>
</xsl:template>

<xsl:template match="hbml:terrain" mode="medcount">
<h3>Medals:</h3>
<ul>
  <xsl:variable name="german_medalTot"><xsl:value-of select="count(hbml:hex[@style='german_medal'])"/></xsl:variable>
  <xsl:if test="$german_medalTot != 0"><li><xsl:value-of select="$german_medalTot"/> x Medal (Axis)</li></xsl:if> 
  <xsl:variable name="allied_medalTot"><xsl:value-of select="count(hbml:hex[@style='allied_medal'])"/></xsl:variable>
  <xsl:if test="$allied_medalTot != 0"><li><xsl:value-of select="$allied_medalTot"/> x Medal (Allied)</li></xsl:if>    
</ul>
</xsl:template>


<!--
<xsl:template match="hbml:">
  <xsl:apply-templates/>
</xsl:template>
-->

</xsl:stylesheet>

