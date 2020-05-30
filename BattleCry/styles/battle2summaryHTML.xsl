<?xml version="1.0"?>
<!--
  Author: Derek Hohls
  Date:25 Jun 2003
  Typical Usage with XT: 
    xt bc_Battle.xml battle2summaryHTML.xsl Battle.htm     
-->
<xsl:stylesheet 
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:hbml="http://users.erols.com/jadf/bc/"
  exclude-result-prefixes="hbml"
  >
  
<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="hbml:hexbattle[@type='battlecry']">
<html>
<head>
<title>Battle Cry Scenario: <xsl:value-of select="hbml:scenario/hbml:name"/></title>
</head>
<body>

<h1><xsl:value-of select="hbml:scenario/hbml:name"/></h1>
<p>The battle was fought on <xsl:value-of select="hbml:scenario/hbml:date"/>
<xsl:if test="hbml:scenario/hbml:location/hbml:state != ''"> in <xsl:value-of select="hbml:scenario/hbml:location/hbml:state"/></xsl:if>.
<xsl:if test="hbml:scenario/hbml:alternate != ''"> It was also known as <xsl:value-of select="hbml:scenario/hbml:alternate"/>.
</xsl:if>
<xsl:if test="hbml:scenario/hbml:description != ''"><xsl:value-of select="hbml:scenario/hbml:description"/> </xsl:if>
<xsl:value-of select="hbml:forces/hbml:force[@type='union']/hbml:commander"/> faces <xsl:value-of select="hbml:forces/hbml:force[@type='confederate']/hbml:commander"/>.</p>

<ul>
<xsl:if test="hbml:scenario/hbml:name/@abpp != ''">
<li><a target="_top"><xsl:attribute name="href">http://www2.cr.nps.gov/abpp/battles/<xsl:value-of select="hbml:scenario/hbml:name/@abpp"/>.htm</xsl:attribute>
Battle Summary: <xsl:value-of select="hbml:scenario/hbml:name"/>
</a> from the ABPP web site.</li>
</xsl:if>
<xsl:if test="hbml:scenario/hbml:name/@acc != ''">
<li><a target="_top"><xsl:attribute name="href">http://www.americancivilwar.com/statepic/<xsl:value-of select="hbml:scenario/hbml:name/@acc"/>.html</xsl:attribute>
Summary of <xsl:value-of select="hbml:scenario/hbml:name"/></a> from the American Civil War web site.</li>
</xsl:if>
<xsl:if test="hbml:scenario/hbml:location/hbml:state[@code] != ''">
<li><a target="_top"><xsl:attribute name="href">http://www.americancivilwar.com/statepic/<xsl:value-of select="hbml:scenario/hbml:location/hbml:state/@code"/>.html</xsl:attribute>
Map of State battles</a> from the American Civil War web site.</li>
</xsl:if>
<xsl:if test="hbml:scenario/hbml:name/@oob != ''">
<li><a target="_top"><xsl:attribute name="href">http://web2.iadfw.net/mbusby/n<xsl:value-of select="hbml:scenario/hbml:name/@oob"/>.htm</xsl:attribute>
Union</a> and <a target="_top"><xsl:attribute name="href">http://web2.iadfw.net/mbusby/s<xsl:value-of select="hbml:scenario/hbml:name/@oob"/>.htm</xsl:attribute>
Confederate</a>  OOB from the American Civil War On Line web site.</li>
</xsl:if>
</ul>

<table summary="" border="1" width="90%">
<tr>
  <th bgcolor="#336699" align="center"><font color="white">Union</font></th>
  <th bgcolor="#cecece" align="center">Confederate</th>
  <th bgcolor="#CCCC66" align="center">Terrain</th>
</tr>
<tr>
  <td align="center" valign="top">
    <font face="arial, verdana, helvetica">
    
    <xsl:value-of select="count(hbml:forces/hbml:force[@type='union']/hbml:unit[@type='general'])"/> General<xsl:if test="count(hbml:forces/hbml:force[@type='union']/hbml:unit[@type='general']) &gt; 1">s</xsl:if> (<xsl:for-each select="hbml:forces/hbml:force[@type='union']/hbml:unit[@type='general']"><xsl:value-of select="text()"/><xsl:if test="position() != last()">, &#160;</xsl:if></xsl:for-each>)<br/>
  <xsl:value-of select="hbml:forces/hbml:force[@type='union']/hbml:special/hbml:cards"/> command cards<br/>
  <xsl:if test="count(hbml:forces/hbml:force[@type='union']/hbml:unit[@type='infantry']) &gt; 0">
    <xsl:value-of select="count(hbml:forces/hbml:force[@type='union']/hbml:unit[@type='infantry'])"/> infantry<br/>
  </xsl:if>
  <xsl:if test="count(hbml:forces/hbml:force[@type='union']/hbml:unit[@type='cavalry']) &gt; 0">
    <xsl:value-of select="count(hbml:forces/hbml:force[@type='union']/hbml:unit[@type='cavalry'])"/> cavalry<br/>
  </xsl:if>
  <xsl:if test="count(hbml:forces/hbml:force[@type='union']/hbml:unit[@type='artillery']) &gt; 0">    
    <xsl:value-of select="count(hbml:forces/hbml:force[@type='union']/hbml:unit[@type='artillery'])"/> artillery<br/>
  </xsl:if>
    </font>
  </td>
  <td align="center" valign="top">
    <font face="arial, verdana, helvetica">
    
    <xsl:value-of select="count(hbml:forces/hbml:force[@type='confederate']/hbml:unit[@type='general'])"/> General<xsl:if test="count(hbml:forces/hbml:force[@type='confederate']/hbml:unit[@type='general']) &gt; 1">s</xsl:if> (<xsl:for-each select="hbml:forces/hbml:force[@type='confederate']/hbml:unit[@type='general']"><xsl:value-of select="text()"/><xsl:if test="position() != last()">, &#160;</xsl:if></xsl:for-each>)<br/>
  <xsl:value-of select="hbml:forces/hbml:force[@type='confederate']/hbml:special/hbml:cards"/> command cards<br/>
  <xsl:if test="count(hbml:forces/hbml:force[@type='confederate']/hbml:unit[@type='infantry']) &gt; 0">
    <xsl:value-of select="count(hbml:forces/hbml:force[@type='confederate']/hbml:unit[@type='infantry'])"/> infantry<br/>
  </xsl:if>
  <xsl:if test="count(hbml:forces/hbml:force[@type='confederate']/hbml:unit[@type='cavalry']) &gt; 0">
    <xsl:value-of select="count(hbml:forces/hbml:force[@type='confederate']/hbml:unit[@type='cavalry'])"/> cavalry<br/>
  </xsl:if>
  <xsl:if test="count(hbml:forces/hbml:force[@type='confederate']/hbml:unit[@type='artillery']) &gt; 0">    
    <xsl:value-of select="count(hbml:forces/hbml:force[@type='confederate']/hbml:unit[@type='artillery'])"/> artillery<br/>
  </xsl:if>
  </font>
  </td>
  <td align="center" valign="center">
  <font face="arial, verdana, helvetica"><xsl:apply-templates select="hbml:terrain"/></font>
  </td>
</tr>
</table>


</body>
</html>

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
  <xsl:variable name="bridge">
    <xsl:value-of select="count(hbml:hex[@type='terrain' and contains(@style,'bridge')])"/>
  </xsl:variable>  
  <xsl:variable name="waterway">
    <xsl:value-of select="count(hbml:hex[@type='terrain' and substring(@style,1,5)='river']) - $bridge"/>
  </xsl:variable>
  <xsl:variable name="crest">
    <xsl:value-of select="count(hbml:hex[@type='terrain' and substring(@style,1,5)='crest'])"/>
  </xsl:variable>  
  
  <xsl:if test="count(hbml:hex[@type='terrain' and @style='woods']) &gt; 0">
    <xsl:value-of select="count(hbml:hex[@type='terrain' and @style='woods'])"/> Woods<br/>
  </xsl:if> 
  <xsl:if test="count(hbml:hex[@type='terrain' and @style='buildings']) &gt; 0">
    <xsl:value-of select="count(hbml:hex[@type='terrain' and @style='buildings'])"/> Buildings<br/>
  </xsl:if>    
  <xsl:if test="count(hbml:hex[@type='terrain' and @style='hill']) &gt; 0">
    <xsl:value-of select="count(hbml:hex[@type='terrain' and @style='hill'])"/> Hills<br/>
  </xsl:if>  
  <xsl:if test="$crest &gt; 0">
    <xsl:value-of select="$crest"/> Crests<br/>
  </xsl:if>   
  <xsl:if test="count(hbml:hex[@type='terrain' and @style='field']) &gt; 0">
    <xsl:value-of select="count(hbml:hex[@type='terrain' and @style='field'])"/> Fields<br/>
  </xsl:if>   
  <xsl:if test="count(hbml:hex[@type='terrain' and @style='field-works']) &gt; 0">
    <xsl:value-of select="count(hbml:hex[@type='terrain' and @style='field-works'])"/> Field-works<br/>
  </xsl:if> 
  <xsl:if test="count(hbml:hex[@type='terrain' and substring(@style,1,5)='fence']) &gt; 0">
    <xsl:value-of select="count(hbml:hex[@type='terrain' and substring(@style,1,5)='fence'])"/> Fences<br/>
  </xsl:if>    
  <xsl:if test="count(hbml:hex[@type='terrain' and @style='orchard']) &gt; 0">
    <xsl:value-of select="count(hbml:hex[@type='terrain' and @style='orchard'])"/> Orchards<br/>
  </xsl:if> 
  <xsl:if test="count(hbml:hex[@type='terrain' and @style='rough']) &gt; 0">
    <xsl:value-of select="count(hbml:hex[@type='terrain' and @style='rough'])"/> Rough Terrain<br/>
  </xsl:if>  
  <xsl:if test="count(hbml:hex[@type='terrain' and @style='rail']) &gt; 0">
    <xsl:value-of select="count(hbml:hex[@type='terrain' and @style='rail'])"/> Railways<br/>
  </xsl:if> 
  <xsl:if test="count(hbml:hex[@type='terrain' and @style='lake']) &gt; 0">
    <xsl:value-of select="count(hbml:hex[@type='terrain' and @style='lake'])"/> Lakes<br/>
  </xsl:if> 
  <xsl:if test="count(hbml:hex[@type='terrain' and @style='swamp']) &gt; 0">
    <xsl:value-of select="count(hbml:hex[@type='terrain' and @style='swamp'])"/> Swamps<br/>
  </xsl:if>      
  <xsl:if test="$bridge &gt; 0">
    <xsl:value-of select="$bridge"/> Bridges<br/>
  </xsl:if>  
  <xsl:if test="$waterway &gt; 0">
    <xsl:value-of select="$waterway"/> Waterways<br/>
  </xsl:if>             
    
</xsl:template>

<!-- forces -->

<xsl:template match="hbml:forces">
</xsl:template>

<!-- notes -->

<xsl:template match="hbml:notes">
</xsl:template>


<!--
<xsl:template match="hbml:">
  <xsl:apply-templates/>
</xsl:template>
-->


</xsl:stylesheet>
