<?xml version="1.0"?>
<!--
  Author: Derek Hohls
  Date: 19 Jun 2004
  Typical Usage with Instant Saxon: 
    saxon -o Battle.html mem_Battle.xml battle2colorSVG.xsl            
-->
<xsl:stylesheet 
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:hbml="http://www.daysofwonder.com/memoir44/"
  exclude-result-prefixes="hbml"
>

<!-- IMPORTS -->  
<xsl:import href="linewrap.xsl"/>  
<xsl:import href="common.xsl"/> 

<!-- GLOBAL PARAMS --> 
<xsl:param name="pLf">0</xsl:param>
<xsl:param name="dateStyle">US</xsl:param>

<!-- GLOBAL VARS -->
<xsl:variable name="s_width">595px</xsl:variable>
<xsl:variable name="s_height">816px</xsl:variable>
<xsl:variable name="s_viewbox">0 0 595 816</xsl:variable>

<xsl:variable name="mapOffY">110</xsl:variable>
<xsl:variable name="mapOffX">35</xsl:variable>
<xsl:variable name="mapScale">0.333</xsl:variable>
<xsl:variable name="labelOffset">87</xsl:variable>

<xsl:variable name="imageX">88</xsl:variable>
<xsl:variable name="imagekeyX">88</xsl:variable>
<xsl:variable name="imageMedalX">55</xsl:variable>
<xsl:variable name="imageY">101</xsl:variable>
<xsl:variable name="imagekeyY">55</xsl:variable>
<xsl:variable name="imageMedalY">60</xsl:variable>

<xsl:variable name="hexScale">0.378</xsl:variable>

<xsl:variable name="dir_pieces">pieces/</xsl:variable>
<xsl:variable name="dir_tiles">tiles/</xsl:variable>
<xsl:variable name="dir_borders">border/</xsl:variable>

<xsl:variable name="keyHeight">310</xsl:variable>
<xsl:variable name="keytY">38</xsl:variable> <!-- terrain gap -->
<xsl:variable name="keymY">28</xsl:variable>  <!-- markers gap -->

<!-- ROOT START -->
<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="hbml:hexbattle[@type='memoir44']">
<svg width="{$s_width}" height="{$s_height}" viewBox="{$s_viewbox}"
xmlns="http://www.w3.org/2000/svg">

  <defs>
		<style type="text/css">
		<![CDATA[
    
      .Page {fill:rgb(255,243,205); stroke:none; }
       
      .Board  { fill:rgb(87,106,46); stroke:rgb(171,168,149); stroke-width:2 }
      .BoardBackground  { fill:rgb(122,70,49); stroke:rgb(171,168,149); stroke-width:2 }
      .Blank  { fill:rgb(193,202,160); stroke:rgb(199,99,47); stroke-width:2 } /* fill:rgb(126,160,54); */
      .Shaded { fill:rgb(255,0,0); stroke:rgb(255,0,0); opacity:0.5; }
      .Border { fill:none; stroke:rgb(255,0,0); stroke-width:8; }
      .Symbol { font-family:Arial,Helvetica,san-serif; font-size:24; stroke:red; fill:red; text-anchor:middle;}
      .Sector { fill:red; stroke:red; stroke-width:5; stroke-dasharray:15,5; } /* dashed */ 
      
      .BattleName, .BattleTitle,.BattleDate, .BattlePeriod { fill:rgb(159,0,4); stroke:rgb(159,0,4); font-family:Army,"Times New Roman",Times,Serif; }
      .BattleDate, .BattlePeriod { text-anchor:end; font-weight:normal;}
      .BattleName   { font-size:27px;}
      .BattleTitle  { font-size:15px;}
      .BattleDate   { font-size:15px;} 
      .BattlePeriod { font-size:15px;}
      
      .NotesTitle { fill:rgb(216,142,74); stroke:rgb(216,142,74); }
      .NotesHeader { fill:black; stroke:black; }
      .NotesTitle, .NotesHeader { font-family:Gunplay,Arial,Helvetica,san-serif; font-weight:lighter; }
      .NotesTitle {font-size:18px;}
      .NotesHeader {font-size:15px;}      
      .NotesText, .LabelName {font-size:10px; font-family:Arial,Helvetica,san-serif;} 
      
      .Designer { font-family:Arial,Helvetica,san-serif; font-size:10px; font-style:italic; }
      .DesignerID { font-family:Army,"Times New Roman",Times,Serif; font-size:14px; fill:rgb(105,0,0); stroke:rgb(105,0,0); text-anchor:middle; }
       .Credit { font-family:"Arial Narrow",Arial,Helvetica,san-serif; font-size:9px; font-style:italic; fill:white; stroke:white; }
      
      .LabelPlace {font-family:"Times New Roman",Times,Serif; font-size:15; font-style:italic; font-weight:bold; text-anchor:middle;}
      .LabelName { text-anchor:middle;}
      .LabelLine { fill:black; stroke:black; stroke-width:1.5; }
      .LabelSpecial { font-family:"Times New Roman",Times,Serif; font-size:15; stroke:red; text-anchor:middle;}
      .LabelSpecialLine { fill:red; stroke:red; stroke-width:3; }
      .LabelForceLine { fill:black; stroke:black; stroke-width:2; }      
      .Title { fill:rgb(102,107,128); stroke:rgb(95,100,119) }
      .Notes { fill:rgb(232,232,244); stroke:rgb(232,232,244) }
      
      .TerrainFont  { font-family:Arial,Helvetica,Serif; font-size:10px; stroke:rgb(241,239,198); text-anchor:middle; }
      .TerrainFrame { fill:rgb(245,259,218); stroke:rgb(105,0,0); stroke-width:2; }
      .TerrainHead, .TerrainKey  { fill:rgb(105,0,0); stroke:rgb(105,0,0); }
      .TerrainHead  { stroke-width:2; }  
      .TerrainID    { font-family:"Times New Roman",Times,Serif; font-size:12px; fill:rgb(245,259,218); stroke:rgb(245,259,218); text-anchor:middle; }
      .TerrainIDBackground { fill:rgb(241,239,198); stroke:none; }
      .TerrainTot, .TerrainX { font-family:Army,"Times New Roman",Times,Serif; font-size:16; fill:rgb(105,0,0); stroke:rgb(105,0,0); text-anchor:middle; } 
      .TerrainX     { font-size:10px; }
      
      .Separator { fill:rgb(105,0,0); stroke:rgb(105,0,0); stroke-width:2; }
 
    ]]>     
		</style>
    
    <g id="hex">
	    <polygon points="0,28.6175  50,0  100,28.6175  100,86.6025  50,115.47  0,86.6025  0,28.6175"/>
	  </g>
    
    <g id="rowOdd">   
  	  <use xlink:href="#hex" class="Blank" />
  	  <use xlink:href="#hex" class="Blank" transform="translate(100,0)"/>
      <use xlink:href="#hex" class="Blank" transform="translate(200,0)"/>
      <use xlink:href="#hex" class="Blank" transform="translate(300,0)"/>
      <use xlink:href="#hex" class="Blank" transform="translate(400,0)"/>
      <use xlink:href="#hex" class="Blank" transform="translate(500,0)"/>
      <use xlink:href="#hex" class="Blank" transform="translate(600,0)"/>
      <use xlink:href="#hex" class="Blank" transform="translate(700,0)"/>
      <use xlink:href="#hex" class="Blank" transform="translate(800,0)"/>
      <use xlink:href="#hex" class="Blank" transform="translate(900,0)"/>
      <use xlink:href="#hex" class="Blank" transform="translate(1000,0)"/>
      <use xlink:href="#hex" class="Blank" transform="translate(1100,0)"/>
      <use xlink:href="#hex" class="Blank" transform="translate(1200,0)"/>
    </g>
    <g id="rowEven">
  	  <use xlink:href="#hex" class="Blank" transform="translate(50,0)"/>    
  	  <use xlink:href="#hex" class="Blank" transform="translate(150,0)"/>
      <use xlink:href="#hex" class="Blank" transform="translate(250,0)"/>
      <use xlink:href="#hex" class="Blank" transform="translate(350,0)"/> 
      <use xlink:href="#hex" class="Blank" transform="translate(450,0)"/> 
      <use xlink:href="#hex" class="Blank" transform="translate(550,0)"/> 
      <use xlink:href="#hex" class="Blank" transform="translate(650,0)"/> 
      <use xlink:href="#hex" class="Blank" transform="translate(750,0)"/> 
      <use xlink:href="#hex" class="Blank" transform="translate(850,0)"/> 
      <use xlink:href="#hex" class="Blank" transform="translate(950,0)"/> 
      <use xlink:href="#hex" class="Blank" transform="translate(1050,0)"/> 
      <use xlink:href="#hex" class="Blank" transform="translate(1150,0)"/>  
    </g>    
    
    <g id="arrowMarker"> 
      <g stroke="black" stroke-width="1"> 
        <line x1="6" y1="-2" x2="0" y2="0"/> 
        <line x1="6" y1="+2" x2="0" y2="0"/> 
      </g> 
    </g>     
    
    <marker id="startMarker" markerWidth="48" markerHeight="24" viewBox="-4 -4 25 5" orient="auto" refX="0" refY="0" markerUnits="strokeWidth"> 
      <g> 
        <use xlink:href="#arrowMarker" transform="rotate(180)" stroke-width="0.8" stroke="black"/> 
      </g> 
    </marker>
        
  </defs> 
  
  <!-- PAGE -->
  <rect x="0" y="0" width="{$s_width}" height="{$s_height}" class="Page" />
  
  <!-- PAGE IMAGES -->
  <image x="{$pLf + 0}" y="0" width="537px" height="32px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_borders"/>top.jpg</xsl:attribute></image>   
  <image x="{$pLf + 0}" y="778" width="537px" height="38px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_borders"/>bottom.jpg</xsl:attribute></image>
  <xsl:if test="$pLf &gt; 0">
    <image x="0" y="0" width="58px" height="816px"><xsl:attribute  name="xlink:href"><xsl:value-of select="$dir_borders"/>left.jpg</xsl:attribute></image> 
 </xsl:if>
  <xsl:if test="$pLf = 0">
    <image x="537" y="0" width="58px" height="816px"><xsl:attribute  name="xlink:href"><xsl:value-of select="$dir_borders"/>right.jpg</xsl:attribute></image> 
 </xsl:if> 
 
  <!-- BOARD BACKGROUND -->
  <g id="boardback" transform="translate({$mapOffX - 3},{$mapOffY - 20}) scale({$mapScale}) " xmlns="http://www.w3.org/2000/svg">  
    <rect x="0" y="0" width="1318" height="930" class="BoardBackground" />     
  </g> 
  
  <!-- BOARD -->
  <g id="grid" transform="translate({$mapOffX},{$mapOffY}) scale({$mapScale}) " xmlns="http://www.w3.org/2000/svg">
    <!-- GRID BACKGROUND -->
    <rect x="0" y="0" width="1300" height="810" class="Board" />
    <!-- GRID OVERLAY --> 
    <use xlink:href="#rowOdd"/> <!-- row 1 -->
    <use xlink:href="#rowEven" transform="translate(0, 86.6015)"/> <!-- row 2 -->
    <use xlink:href="#rowOdd"  transform="translate(0,173.2030)"/> <!-- row 3 -->  
    <use xlink:href="#rowEven" transform="translate(0,259.8045)"/> <!-- row 4 --> 
    <use xlink:href="#rowOdd"  transform="translate(0,346.4060)"/> <!-- row 5 -->  
    <use xlink:href="#rowEven" transform="translate(0,433.0075)"/> <!-- row 6 --> 
    <use xlink:href="#rowOdd"  transform="translate(0,519.6090)"/> <!-- row 7 -->  
    <use xlink:href="#rowEven" transform="translate(0,606.2105)"/> <!-- row 8 --> 
    <use xlink:href="#rowOdd"  transform="translate(0,692.8120)"/> <!-- row 9 -->  
    <!-- SECTORS -->
    <line x1="400" y1="28" x2="400" y2="782" class="Sector"/>
    <line x1="900" y1="28" x2="900" y2="782" class="Sector"/>        
  </g>

  <xsl:apply-templates select="hbml:terrain" mode="location"/>
  
  <!-- TERRAIN KEY -->
  <rect x="480" y="90" rx="5" ry="5" width="100" height="{$keyHeight}" class="TerrainFrame" />
  <rect x="550" y="90" rx="5" ry="5" width="29"  height="{$keyHeight - 1}" class="TerrainIDBackground" />
  <rect x="480" y="90" rx="5" ry="5" width="100" height="20"  class="TerrainHead" />
  <line x1="480" y1="110" x2="580" y2="110" class="TerrainFrame"/>
  <text x="530" y="105" class="TerrainFont">Setup Order</text>
  <xsl:apply-templates select="hbml:terrain" mode="key"/> 
  
  <!-- SHOW FORCES -->
  <xsl:apply-templates select="hbml:forces" mode="location"/>
  <xsl:apply-templates select="hbml:forces" mode="special"/>   
  <!-- <xsl:apply-templates select="hbml:forces" mode="label"/> -->

  <!-- TERRAIN LABEL -->
  <!-- <xsl:apply-templates select="hbml:terrain" mode="label"/> -->  
  
  <!-- MAP TITLE -->
  <text x="{$pLf + 35}" y="70"><tspan class="BattleName"><xsl:value-of select="hbml:scenario/@number"/><xsl:if test="hbml:scenario/@number != ''"> - </xsl:if><xsl:value-of select="hbml:scenario/hbml:name"/></tspan>
  <tspan class="BattleTitle"><xsl:if test="hbml:scenario/hbml:title != ''"> - </xsl:if><xsl:value-of select="hbml:scenario/hbml:title"/></tspan>
  </text>
  <text x="{$pLf + 500}" y="70"><tspan class="BattlePeriod"><xsl:value-of select="hbml:scenario/hbml:period"/>&#160;</tspan><tspan class="BattleDate"><xsl:value-of select="hbml:scenario/hbml:date"/><xsl:call-template name="formatDate"><xsl:with-param name="year" select="hbml:scenario/hbml:date/@year"/><xsl:with-param name="month" select="hbml:scenario/hbml:date/@month"/><xsl:with-param name="day" select="hbml:scenario/hbml:date/@day"/><xsl:with-param name="style" select="$dateStyle"/></xsl:call-template></tspan></text>
  
  <!-- META -->
  <text x="{$pLf + 325}" y="775" class="Designer">Designed by <xsl:value-of select="hbml:meta/hbml:designer/hbml:name"/><xsl:if test="hbml:meta/hbml:designer/hbml:email != ''"> (<xsl:value-of select="hbml:meta/hbml:designer/hbml:email"/>)</xsl:if></text>
  <text x="{$pLf + 330}" y="785" class="Designer"><xsl:value-of select="hbml:meta/hbml:designer/hbml:website"/></text>
  <text x="{$pLf + 297}" y="812" class="DesignerID"><xsl:value-of select="hbml:meta/hbml:designer/@id"/></text>
  
  <text x="{$pLf + 334}" y="813" class="Credit">Images sourced from Days of Wonder (www.daysofwonder.com)</text>
  
  <!-- NOTES -->
  <text x="{$pLf + 40}" y="570" class="NotesTitle">Briefing</text>  
  <xsl:apply-templates select="hbml:forces" mode="instructions"/>
   
 <!-- SPECIAL NOTES and VICTORY CONDITIONS -->
  <xsl:apply-templates select="hbml:notes" /> 
  
  <!-- separator line -->
  <line x1="{$pLf + 280}" y1="555" x2="{$pLf + 280}" y2="780" class="Separator"/>

</svg>
</xsl:template>


<!-- ************************* terrain locations *************************** -->

<xsl:template match="hbml:terrain" mode="location">
  <g id="grid" transform="translate({$mapOffX},{$mapOffY + 9}) scale({$hexScale})" xmlns="http://www.w3.org/2000/svg">
    <xsl:apply-templates select="hbml:hex" mode="location"/>
  </g>
</xsl:template>

<xsl:template match="hbml:hex" mode="location">
  <xsl:variable name="y">
    <xsl:choose>
      <xsl:when test="@row mod 2 = 0"><xsl:value-of select="(@row - 1) * 76 - 22.9"/></xsl:when> 
      <xsl:otherwise><xsl:value-of select="(@row - 1) * 76 - 22.9"/></xsl:otherwise> <!--  -->
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="x">
    <xsl:choose>
      <xsl:when test="@row mod 2 = 0"><xsl:value-of select="((@col - 1) * 88) + 43"/></xsl:when> <!--  --> 
      <xsl:otherwise><xsl:value-of select="((@col - 1) * 88) - 1"/></xsl:otherwise> <!--  -->
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="rx" select="number(($imageX div 2))"/>
  <xsl:variable name="ry" select="number(($imageY div 2))"/>
  <xsl:variable name="sx" select="number($x + ($imageX) div 2)"/>
  <xsl:variable name="sy" select="number($y + ($imageY) div 2)"/>  
  <xsl:variable name="theta">
    <xsl:value-of select="(@face - 1) * 60"/>
  </xsl:variable>

  <xsl:if test="@type='terrain'">
    <xsl:choose>
      <xsl:when test="@face">
        <image xmlns="http://www.w3.org/2000/svg" width="{$imageX}px" height="{$imageY}px" transform="translate({$x},{$y}) rotate({$theta},{$rx},{$ry})"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_tiles"/><xsl:value-of select="@style"/>.png</xsl:attribute></image>   
      </xsl:when> 
      <xsl:otherwise>
         <image xmlns="http://www.w3.org/2000/svg" x="{$x}" y="{$y}" width="{$imageX}px" height="{$imageY}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_tiles"/><xsl:value-of select="@style"/>.png</xsl:attribute></image>    
      </xsl:otherwise> 
    </xsl:choose>   
  </xsl:if>

  <xsl:if test="@type='marker'">
    <xsl:choose>
      <xsl:when test="@face">
        <image xmlns="http://www.w3.org/2000/svg" width="{$imageX}px" height="{$imageY}px" transform="translate({$x},{$y}) rotate({$theta},{$rx},{$ry})"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_pieces"/><xsl:value-of select="@style"/>.png</xsl:attribute></image>   
      </xsl:when> 
      <xsl:otherwise>
         <image xmlns="http://www.w3.org/2000/svg" x="{$x}" y="{$y}" width="{$imageX}px" height="{$imageY}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_pieces"/><xsl:value-of select="@style"/>.png</xsl:attribute></image>    
      </xsl:otherwise> 
    </xsl:choose>   
  </xsl:if> 
    
  <xsl:if test="@type='medal'">
    <image xmlns="http://www.w3.org/2000/svg" x="{$x}" y="{$y}" width="{$imageMedalX}px" height="{$imageMedalY}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_pieces"/><xsl:value-of select="@style"/>.png</xsl:attribute></image>    
  </xsl:if>  

</xsl:template>


<!-- ************************* terrain key/count *************************** -->

<xsl:template match="hbml:terrain" mode="key">
  <!-- locator -->
  <xsl:variable name="keyX">480</xsl:variable>
  <xsl:variable name="keyY">135</xsl:variable>

  <!-- hedgerows -->
  <xsl:variable name="hedgerowTot"><xsl:value-of select="count(hbml:hex[@style='hedgerow'])"/></xsl:variable>
  <xsl:variable name="hedgerowID">
    <xsl:choose>
      <xsl:when test="$hedgerowTot &gt; 0">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>
  <xsl:variable name="hedgerowLoc">
    <xsl:choose>
      <xsl:when test="$hedgerowTot &gt; 0"><xsl:value-of select="$keyY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$keyY - $keytY"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>  
  <xsl:if test="$hedgerowTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$hedgerowLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX}" y="{$hedgerowLoc + 3}" class="TerrainID"><xsl:value-of select="$hedgerowID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$hedgerowLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$hedgerowTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$hedgerowLoc - 20}" width="{$imageX * $hexScale}px" height="{$imageY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_tiles"/>hedgerow.png</xsl:attribute></image> 
  </xsl:if>

  <!-- woods -->
  <xsl:variable name="woodTot"><xsl:value-of select="count(hbml:hex[@style='woods'])"/></xsl:variable>
  <xsl:variable name="woodID">
    <xsl:choose>
      <xsl:when test="$woodTot &gt; 0"><xsl:value-of select="$hedgerowID + 1"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$hedgerowID"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="woodLoc">
    <xsl:choose>
      <xsl:when test="$woodTot &gt; 0"><xsl:value-of select="$hedgerowLoc + $keytY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$hedgerowLoc"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>  
  <xsl:if test="$woodTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$woodLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{ $keyX}" y="{$woodLoc + 3}" class="TerrainID"><xsl:value-of select="$woodID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$woodLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$woodTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$woodLoc - 20}" width="{$imageX * $hexScale}px" height="{$imageY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_tiles"/>woods.png</xsl:attribute></image> 
  </xsl:if>    
  
  <!-- hills -->
  <xsl:variable name="hillTot"><xsl:value-of select="count(hbml:hex[@style='hill'])"/></xsl:variable>
  <xsl:variable name="hillID">
    <xsl:choose>
      <xsl:when test="$hillTot &gt; 0"><xsl:value-of select="$woodID + 1"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$woodID"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="hillLoc">
    <xsl:choose>
      <xsl:when test="$hillTot &gt; 0"><xsl:value-of select="$woodLoc + $keytY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$woodLoc"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>   
  <xsl:if test="$hillTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$hillLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{ $keyX}" y="{$hillLoc + 3}" class="TerrainID"><xsl:value-of select="$hillID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$hillLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$hillTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$hillLoc - 20}" width="{$imageX * $hexScale}px" height="{$imageY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_tiles"/>hill.png</xsl:attribute></image> 
  </xsl:if>  
  
  <!-- towns -->
  <xsl:variable name="townTot"><xsl:value-of select="count(hbml:hex[@style='town'])"/></xsl:variable>
  <xsl:variable name="townID">
    <xsl:choose>
      <xsl:when test="$townTot &gt; 0"><xsl:value-of select="$hillID + 1"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$hillID"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="townLoc">
    <xsl:choose>
      <xsl:when test="$townTot &gt; 0"><xsl:value-of select="$hillLoc + $keytY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$hillLoc"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>  
  <xsl:if test="$townTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$townLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{ $keyX}" y="{$townLoc + 3}" class="TerrainID"><xsl:value-of select="$townID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$townLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$townTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$townLoc - 20}" width="{$imageX * $hexScale}px" height="{$imageY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_tiles"/>town.png</xsl:attribute></image> 
  </xsl:if>   
  
  <!-- villages -->
  <xsl:variable name="villageTot"><xsl:value-of select="count(hbml:hex[@style='village'])"/></xsl:variable>
  <xsl:variable name="villageID">
    <xsl:choose>
      <xsl:when test="$villageTot &gt; 0"><xsl:value-of select="$townID + 1"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$townID"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="villageLoc">
    <xsl:choose>
      <xsl:when test="$villageTot &gt; 0"><xsl:value-of select="$townLoc + $keytY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$townLoc"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>   
  <xsl:if test="$villageTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$villageLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{ $keyX}" y="{$townID * $keytY +$keyY + 3}" class="TerrainID"><xsl:value-of select="$villageID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$villageLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$villageTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$villageLoc - 20}" width="{$imageX * $hexScale}px" height="{$imageY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_tiles"/>village.png</xsl:attribute></image> 
  </xsl:if>   
  
  <!-- river_straights -->
  <xsl:variable name="river_straightTot"><xsl:value-of select="count(hbml:hex[@style='river_straight'])"/></xsl:variable>
  <xsl:variable name="river_straightID">
    <xsl:choose>
      <xsl:when test="$river_straightTot &gt; 0"><xsl:value-of select="$villageID + 1"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$villageID"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="river_straightLoc">
    <xsl:choose>
      <xsl:when test="$river_straightTot &gt; 0"><xsl:value-of select="$villageLoc + $keytY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$villageLoc"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>   
  <xsl:if test="$river_straightTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$river_straightLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{ $keyX}" y="{$river_straightLoc + 3}" class="TerrainID"><xsl:value-of select="$river_straightID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$river_straightLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$river_straightTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$river_straightLoc - 20}" width="{$imageX * $hexScale}px" height="{$imageY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_tiles"/>river_straight.png</xsl:attribute></image> 
  </xsl:if> 
  
  <!-- river_curves -->
  <xsl:variable name="river_curveTot"><xsl:value-of select="count(hbml:hex[@style='river_curve'])"/></xsl:variable>
  <xsl:variable name="river_curveID">
    <xsl:choose>
      <xsl:when test="$river_curveTot &gt; 0"><xsl:value-of select="$river_straightID + 1"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$river_straightID"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="river_curveLoc">
    <xsl:choose>
      <xsl:when test="$river_curveTot &gt; 0"><xsl:value-of select="$river_straightLoc + $keytY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$river_straightLoc"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>   
  <xsl:if test="$river_curveTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$river_curveLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{ $keyX}" y="{$river_curveLoc + 3}" class="TerrainID"><xsl:value-of select="$river_curveID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$river_curveLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$river_curveTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$river_curveLoc - 20}" width="{$imageX * $hexScale}px" height="{$imageY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_tiles"/>river_curve.png</xsl:attribute></image> 
  </xsl:if>      
  
  <!-- ******* Obstacles ******** -->
  <!-- bridge -->
  <xsl:variable name="bridgeTot"><xsl:value-of select="count(hbml:hex[@style='bridge'])"/></xsl:variable>
  <xsl:variable name="bridgeID">
    <xsl:choose>
      <xsl:when test="$bridgeTot &gt; 0"><xsl:value-of select="$river_curveID + 1"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$river_curveID"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="bridgeLoc">
    <xsl:choose>
      <xsl:when test="$bridgeTot &gt; 0"><xsl:value-of select="$river_curveLoc + $keymY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$river_curveLoc"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>   
  <xsl:if test="$bridgeTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$bridgeLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{ $keyX}" y="{$bridgeLoc + 3}" class="TerrainID"><xsl:value-of select="$bridgeID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$bridgeLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$bridgeTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$bridgeLoc - 10}" width="{$imagekeyX * $hexScale}px" height="{$imagekeyY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_pieces"/>key_bridge.png</xsl:attribute></image> 
  </xsl:if>  
  
  <!-- bunker -->
  <xsl:variable name="bunkerTot"><xsl:value-of select="count(hbml:hex[@style='bunker'])"/></xsl:variable>
  <xsl:variable name="bunkerID">
    <xsl:choose>
      <xsl:when test="$bunkerTot &gt; 0"><xsl:value-of select="$bridgeID + 1"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$bridgeID"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="bunkerLoc">
    <xsl:choose>
      <xsl:when test="$bunkerTot &gt; 0"><xsl:value-of select="$bridgeLoc + $keymY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$bridgeLoc"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>  
  <xsl:if test="$bunkerTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$bunkerLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{ $keyX}" y="{$bunkerLoc + 3}" class="TerrainID"><xsl:value-of select="$bunkerID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$bunkerLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$bunkerTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$bunkerLoc - 10}" width="{$imagekeyX * $hexScale}px" height="{$imagekeyY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_pieces"/>key_bunker.png</xsl:attribute></image> 
  </xsl:if>   
  
  <!-- German wire -->
  <xsl:variable name="ger_wireTot"><xsl:value-of select="count(hbml:hex[@style='german_wire'])"/></xsl:variable>
  <xsl:variable name="ger_wireID">
    <xsl:choose>
      <xsl:when test="$ger_wireTot &gt; 0"><xsl:value-of select="$bunkerID + 1"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$bunkerID"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="ger_wireLoc">
    <xsl:choose>
      <xsl:when test="$ger_wireTot &gt; 0"><xsl:value-of select="$bunkerLoc + $keymY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$bunkerLoc"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>  
  <xsl:if test="$ger_wireTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$ger_wireLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{ $keyX}" y="{$ger_wireLoc + 3}" class="TerrainID"><xsl:value-of select="$ger_wireID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$ger_wireLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$ger_wireTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$ger_wireLoc - 10}" width="{$imagekeyX * $hexScale}px" height="{$imagekeyY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_pieces"/>key_german_wire.png</xsl:attribute></image> 
  </xsl:if>  
  
  <!-- German hedge -->
  <xsl:variable name="ger_hedgeTot"><xsl:value-of select="count(hbml:hex[@style='german_hedgehog'])"/></xsl:variable>
  <xsl:variable name="ger_hedgeID">
    <xsl:choose>
      <xsl:when test="$ger_hedgeTot &gt; 0"><xsl:value-of select="$ger_wireID + 1"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$ger_wireID"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="ger_hedgeLoc">
    <xsl:choose>
      <xsl:when test="$ger_hedgeTot &gt; 0"><xsl:value-of select="$ger_wireLoc + $keymY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$ger_wireLoc"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>  
  <xsl:if test="$ger_hedgeTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$ger_hedgeLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{ $keyX}" y="{$ger_hedgeLoc + 3}" class="TerrainID"><xsl:value-of select="$ger_hedgeID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$ger_hedgeLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$ger_hedgeTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$ger_hedgeLoc - 10}" width="{$imagekeyX * $hexScale}px" height="{$imagekeyY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_pieces"/>key_german_hedgehog.png</xsl:attribute></image> 
  </xsl:if>     
  
  <!-- German sandbag -->
  <xsl:variable name="ger_sandbagTot"><xsl:value-of select="count(hbml:hex[@style='german_sandbag'])"/></xsl:variable>
  <xsl:variable name="ger_sandbagID">
    <xsl:choose>
      <xsl:when test="$ger_sandbagTot &gt; 0"><xsl:value-of select="$ger_hedgeID + 1"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$ger_hedgeID"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="ger_sandbagLoc">
    <xsl:choose>
      <xsl:when test="$ger_sandbagTot &gt; 0"><xsl:value-of select="$ger_hedgeLoc + $keymY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$ger_hedgeLoc"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>  
  <xsl:if test="$ger_sandbagTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$ger_sandbagLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{ $keyX}" y="{$ger_sandbagLoc + 3}" class="TerrainID"><xsl:value-of select="$ger_sandbagID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$ger_sandbagLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$ger_sandbagTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$ger_sandbagLoc - 10}" width="{$imagekeyX * $hexScale}px" height="{$imagekeyY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_pieces"/>key_german_sandbag.png</xsl:attribute></image> 
  </xsl:if>   
  
  <!-- Allied wire -->
  <xsl:variable name="all_wireTot"><xsl:value-of select="count(hbml:hex[@style='allied_wire'])"/></xsl:variable>
  <xsl:variable name="all_wireID">
    <xsl:choose>
      <xsl:when test="$all_wireTot &gt; 0"><xsl:value-of select="$ger_sandbagID + 1"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$ger_sandbagID"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="all_wireLoc">
    <xsl:choose>
      <xsl:when test="$all_wireTot &gt; 0"><xsl:value-of select="$ger_sandbagLoc + $keymY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$ger_sandbagLoc"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>  
  <xsl:if test="$all_wireTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$all_wireLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{ $keyX}" y="{$all_wireLoc + 3}" class="TerrainID"><xsl:value-of select="$all_wireID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$all_wireLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$all_wireTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$all_wireLoc - 10}" width="{$imagekeyX * $hexScale}px" height="{$imagekeyY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_pieces"/>key_allied_wire.png</xsl:attribute></image> 
  </xsl:if>  
  
  <!-- Allied hedge -->
  <xsl:variable name="all_hedgeTot"><xsl:value-of select="count(hbml:hex[@style='allied_hedgehog'])"/></xsl:variable>
  <xsl:variable name="all_hedgeID">
    <xsl:choose>
      <xsl:when test="$all_hedgeTot &gt; 0"><xsl:value-of select="$all_wireID + 1"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$all_wireID"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="all_hedgeLoc">
    <xsl:choose>
      <xsl:when test="$all_hedgeTot &gt; 0"><xsl:value-of select="$all_wireLoc + $keymY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$all_wireLoc"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>  
  <xsl:if test="$all_hedgeTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$all_hedgeLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{ $keyX}" y="{$all_hedgeLoc + 3}" class="TerrainID"><xsl:value-of select="$all_hedgeID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$all_hedgeLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$all_hedgeTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$all_hedgeLoc - 10}" width="{$imagekeyX * $hexScale}px" height="{$imagekeyY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_pieces"/>key_allied_hedgehog.png</xsl:attribute></image> 
  </xsl:if>    
  
  <!-- Allied sandbag -->
  <xsl:variable name="all_sandbagTot"><xsl:value-of select="count(hbml:hex[@style='allied_sandbag'])"/></xsl:variable>
  <xsl:variable name="all_sandbagID">
    <xsl:choose>
      <xsl:when test="$all_sandbagTot &gt; 0"><xsl:value-of select="$all_hedgeID + 1"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$all_hedgeID"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="all_sandbagLoc">
    <xsl:choose>
      <xsl:when test="$all_sandbagTot &gt; 0"><xsl:value-of select="$all_hedgeLoc + $keymY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$all_hedgeLoc"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>  
  <xsl:if test="$all_sandbagTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$all_sandbagLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{ $keyX}" y="{$all_sandbagLoc + 3}" class="TerrainID"><xsl:value-of select="$all_sandbagID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$all_sandbagLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$all_sandbagTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$all_sandbagLoc - 10}" width="{$imagekeyX * $hexScale}px" height="{$imagekeyY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_pieces"/>key_allied_sandbag.png</xsl:attribute></image> 
  </xsl:if>   
  
  <!-- German medal -->
  <xsl:variable name="ger_medalTot"><xsl:value-of select="count(hbml:hex[@style='german_medal'])"/></xsl:variable>
  <xsl:variable name="ger_medalID">
    <xsl:choose>
      <xsl:when test="$ger_medalTot &gt; 0"><xsl:value-of select="$all_sandbagID + 1"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$all_sandbagID"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="ger_medalLoc">
    <xsl:choose>
      <xsl:when test="$ger_medalTot &gt; 0"><xsl:value-of select="$all_sandbagLoc + $keymY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$all_sandbagLoc"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>  
  <xsl:if test="$ger_medalTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$ger_medalLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{ $keyX}" y="{$ger_medalLoc + 3}" class="TerrainID"><xsl:value-of select="$ger_medalID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$ger_medalLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$ger_medalTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$ger_medalLoc - 20}" width="{$imageX * $hexScale}px" height="{$imageY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_pieces"/>key_german_medal.png</xsl:attribute></image> 
  </xsl:if>   
    
  <!-- allied medal -->
  <xsl:variable name="all_medalTot"><xsl:value-of select="count(hbml:hex[@style='allied_medal'])"/></xsl:variable>
  <xsl:variable name="all_medalID">
    <xsl:choose>
      <xsl:when test="$all_medalTot &gt; 0"><xsl:value-of select="$ger_medalID + 1"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$ger_medalID"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="all_medalLoc">
    <xsl:choose>
      <xsl:when test="$all_medalTot &gt; 0"><xsl:value-of select="$ger_medalLoc + $keymY"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="$ger_medalLoc"/></xsl:otherwise>
    </xsl:choose>   
  </xsl:variable>  
  <xsl:if test="$all_medalTot &gt; 0">
    <circle xmlns="http://www.w3.org/2000/svg"  cx="{$keyX}" cy="{$all_medalLoc}" r="7" class="TerrainKey"/>
    <text xmlns="http://www.w3.org/2000/svg"  x="{ $keyX}" y="{$all_medalLoc + 3}" class="TerrainID"><xsl:value-of select="$all_medalID"/></text>
    <text xmlns="http://www.w3.org/2000/svg"  x="{$keyX + 85}" y="{$all_medalLoc + 5}" class="TerrainTot"><tspan xmlns="http://www.w3.org/2000/svg" class="TerrainX">x</tspan><xsl:value-of select="$all_medalTot"/></text>
    <image xmlns="http://www.w3.org/2000/svg" x="{$keyX + 20}" y="{$all_medalLoc - 20}" width="{$imageX * $hexScale}px" height="{$imageY * $hexScale}px"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_pieces"/>key_allied_medal.png</xsl:attribute></image> 
  </xsl:if>      
    
</xsl:template>
  

<!-- **************************** terrain labels *************************** -->

<xsl:template match="hbml:terrain" mode="label">
  <g id="grid-terrain" transform="translate({$mapOffX},{$mapOffY - $labelOffset})" xmlns="http://www.w3.org/2000/svg">
    <xsl:apply-templates select="hbml:hex" mode="label"/>
  </g>
</xsl:template>

<xsl:template match="hbml:hex" mode="label">
  <xsl:variable name="yOff">
    <xsl:choose>
      <xsl:when test="@row &lt;= 5"><xsl:value-of select="$labelOffset - 10"/></xsl:when> <!-- lo row -->
      <xsl:otherwise><xsl:value-of select="$labelOffset + 65"/></xsl:otherwise> <!-- hi row -->
    </xsl:choose>   
  </xsl:variable>  
  <xsl:variable name="xOff">66</xsl:variable>  
  <xsl:variable name="y2">
    <xsl:choose>
      <xsl:when test="@row mod 2 = 0"><xsl:value-of select="(@row - 1) * 76 + $yOff"/></xsl:when> <!-- even col -->
      <xsl:otherwise><xsl:value-of select="(@row - 1) * 76 + $yOff"/></xsl:otherwise> <!-- odd col -->
    </xsl:choose>    
  </xsl:variable>
  <xsl:variable name="x">
    <xsl:choose>
      <xsl:when test="@row mod 2 = 0"><xsl:value-of select="((@col - 1) * 88) + 48 + $xOff"/></xsl:when> <!-- even row --> 
      <xsl:otherwise><xsl:value-of select="(@col - 1) * 88 + $xOff"/></xsl:otherwise> <!-- odd row -->
    </xsl:choose> 
  </xsl:variable>
  
  <xsl:variable name="y1">
    <xsl:choose>
      <xsl:when test="@row &lt;= 5">
        <xsl:choose>
          <xsl:when test="@row mod 2 = 0">60</xsl:when> <!-- even row --> 
          <xsl:otherwise>40</xsl:otherwise> <!-- odd row -->
        </xsl:choose>      
      </xsl:when> <!-- lo row -->
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="@row mod 2 = 0">780</xsl:when> <!-- even row --> 
          <xsl:otherwise>800</xsl:otherwise> <!-- odd row -->
        </xsl:choose>       
      </xsl:otherwise> <!-- hi row -->
    </xsl:choose> 
  </xsl:variable>  
  <xsl:variable name="y1L">
    <xsl:choose>
      <xsl:when test="@row &lt;= 5"><xsl:value-of select="$y1 - 5"/></xsl:when> <!-- lo row -->
      <xsl:otherwise><xsl:value-of select="$y1 + 15"/></xsl:otherwise> <!-- hi row -->
    </xsl:choose> 
  </xsl:variable>    
  
  <xsl:if test=". != '' and @style!='symbol'">
    <xsl:variable name="label">
      <xsl:if test="@type='terrain'">LabelPlace</xsl:if>
      <xsl:if test="@type='special'">LabelSpecial</xsl:if>
    </xsl:variable> 
    <xsl:variable name="labelline">
      <xsl:if test="@type='terrain'">LabelLine</xsl:if>
      <xsl:if test="@type='special'">LabelSpecialLine</xsl:if>
    </xsl:variable>    
    <line x1="{$x}" y1="{$y1}" x2="{$x}" y2="{$y2}" class="{$labelline}" xmlns="http://www.w3.org/2000/svg"/>
    <circle cx="{$x}" cy="{$y1}" r="3" class="{$labelline}" xmlns="http://www.w3.org/2000/svg"/>
    <text x="{$x}" y="{$y1L}" class="{$label}" xmlns="http://www.w3.org/2000/svg"><xsl:value-of select="."/></text>
  </xsl:if>
</xsl:template>

<!-- **************************  force locations *************************** -->

<xsl:template match="hbml:forces" mode="location">
  <g id="forceLocation" transform=" translate({$mapOffX},{$mapOffY}) scale({$mapScale}) " xmlns="http://www.w3.org/2000/svg">
    <xsl:apply-templates select="hbml:force" mode="location"/>
  </g>
</xsl:template>

<xsl:template match="hbml:force" mode="location">
  <xsl:apply-templates select="hbml:unit" mode="location"/>
</xsl:template>

<xsl:template match="hbml:unit" mode="location">

  <xsl:variable name="yOff">
    <xsl:choose>
      <xsl:when test="@type='infantry'">29</xsl:when> 
      <xsl:when test="@type='artillery'">37</xsl:when>
      <xsl:when test="@type='armour'">37</xsl:when>       
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>  
  <xsl:variable name="xOff">
    <xsl:choose>
      <xsl:when test="@type='infantry'">27</xsl:when>
      <xsl:when test="@type='artillery'">8</xsl:when>
      <xsl:when test="@type='armour'">9</xsl:when>    
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose> 
  </xsl:variable> 
  <xsl:variable name="uHeight">
    <xsl:choose>
      <xsl:when test="@type='infantry'">62</xsl:when>
      <xsl:when test="@type='artillery'">48</xsl:when>
      <xsl:when test="@type='armour'">48</xsl:when>    
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="uWidth">
    <xsl:choose>
      <xsl:when test="@type='infantry'">46</xsl:when>
      <xsl:when test="@type='artillery'">89</xsl:when>
      <xsl:when test="@type='armour'">89</xsl:when>    
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose> 
  </xsl:variable> 
    
  <xsl:variable name="y">
    <xsl:choose>
      <xsl:when test="@row mod 2 = 0"><xsl:value-of select="(@row - 1) * 86 + $yOff"/></xsl:when> <!-- even col -->
      <xsl:otherwise><xsl:value-of select="(@row - 1) * 86 + $yOff"/></xsl:otherwise> <!-- odd col -->
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="x">
    <xsl:choose>
      <xsl:when test="@row mod 2 = 0"><xsl:value-of select="((@col - 1)) * 100 + 48 + $xOff"/></xsl:when> <!-- even row --> 
      <xsl:otherwise><xsl:value-of select="(@col - 1) * 100 + $xOff"/></xsl:otherwise> <!-- odd row -->
    </xsl:choose> 
  </xsl:variable>
  <image xmlns="http://www.w3.org/2000/svg" x="{$x}" y="{$y}" width="{$uWidth}" height="{$uHeight}"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_pieces"/><xsl:value-of select="../@type"/>_<xsl:value-of select="@type"/>.png</xsl:attribute></image>
</xsl:template>

<!-- **************************  special forces *************************** -->

<xsl:template match="hbml:forces" mode="special">
  <g id="forceSpecial" transform=" translate({$mapOffX},{$mapOffY}) scale({$mapScale}) " xmlns="http://www.w3.org/2000/svg">
    <xsl:apply-templates select="hbml:force" mode="special"/>
  </g>
</xsl:template>

<xsl:template match="hbml:force" mode="special">
  <xsl:apply-templates select="hbml:unit" mode="special"/>
</xsl:template>

<xsl:template match="hbml:unit" mode="special">

  <xsl:if test="@special != ''">
    <xsl:variable name="yOff">65</xsl:variable>  
    <xsl:variable name="xOff">55</xsl:variable> 
    <xsl:variable name="uHeight">35</xsl:variable>
    <xsl:variable name="uWidth">35</xsl:variable> 
      
    <xsl:variable name="y">
      <xsl:choose>
        <xsl:when test="@row mod 2 = 0"><xsl:value-of select="(@row - 1) * 86 + $yOff"/></xsl:when> <!-- even col -->
        <xsl:otherwise><xsl:value-of select="(@row - 1) * 86 + $yOff"/></xsl:otherwise> <!-- odd col -->
      </xsl:choose> 
    </xsl:variable>
    <xsl:variable name="x">
      <xsl:choose>
        <xsl:when test="@row mod 2 = 0"><xsl:value-of select="((@col - 1)) * 100 + 48 + $xOff"/></xsl:when> <!-- even row --> 
        <xsl:otherwise><xsl:value-of select="(@col - 1) * 100 + $xOff"/></xsl:otherwise> <!-- odd row -->
      </xsl:choose> 
    </xsl:variable>
    <image xmlns="http://www.w3.org/2000/svg" x="{$x}" y="{$y}" width="{$uWidth}" height="{$uHeight}"><xsl:attribute name="xlink:href"><xsl:value-of select="$dir_pieces"/><xsl:value-of select="@special"/>.png</xsl:attribute></image>
  
  </xsl:if>

</xsl:template>

<!--*****************************  force labels **************************** -->

<xsl:template match="hbml:forces" mode="label">
  <g id="forceLabel" transform=" translate({$mapOffX},{$mapOffY - $labelOffset})" xmlns="http://www.w3.org/2000/svg">
    <xsl:apply-templates select="hbml:force" mode="label"/>
  </g>
</xsl:template>

<xsl:template match="hbml:force" mode="label">
  <xsl:apply-templates select="hbml:unit" mode="label"/>
</xsl:template>

<xsl:template match="hbml:unit" mode="label">
  <xsl:variable name="yOff">
    <xsl:choose>
      <xsl:when test="@row &lt;= 5"><!-- lo row -->
        <xsl:choose>
          <xsl:when test="@type = 'general'">70</xsl:when> 
          <xsl:otherwise>88</xsl:otherwise>
        </xsl:choose> 
      </xsl:when> 
      <xsl:otherwise><!-- hi row -->
        <xsl:choose>
          <xsl:when test="@type = 'general'">125</xsl:when> 
          <xsl:otherwise>143</xsl:otherwise>
        </xsl:choose>       
      </xsl:otherwise> 
    </xsl:choose>   
  </xsl:variable>  
  <xsl:variable name="xOff">
    <xsl:choose>
      <xsl:when test="@type = 'general'">30</xsl:when> 
      <xsl:otherwise>60</xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>  
  
  <xsl:variable name="y2">
    <xsl:choose>
      <xsl:when test="@row mod 2 = 0"><xsl:value-of select="(@row - 1) * 76 + $yOff"/></xsl:when> <!-- even col -->
      <xsl:otherwise><xsl:value-of select="(@row - 1) * 76 + $yOff"/></xsl:otherwise> <!-- odd col -->
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="x">
    <xsl:choose>
      <xsl:when test="@row mod 2 = 0"><xsl:value-of select="((@col - 1) * 88) + 44 + $xOff"/></xsl:when> <!-- even row --> 
      <xsl:otherwise><xsl:value-of select="(@col - 1) * 88 + $xOff"/></xsl:otherwise> <!-- odd row -->
    </xsl:choose> 
  </xsl:variable>
  
  <xsl:variable name="y1">
    <xsl:choose>
      <xsl:when test="@row &lt;= 5">
        <xsl:choose>
          <xsl:when test="@row mod 2 = 0">20</xsl:when> <!-- even row -->
          <xsl:when test="@type != 'general'">10</xsl:when> 
          <xsl:otherwise>0</xsl:otherwise> <!-- odd row -->
        </xsl:choose>      
      </xsl:when> <!-- lo row -->
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="@row mod 2 = 0">820</xsl:when> <!-- even row --> 
          <xsl:when test="@type != 'general'">830</xsl:when>
          <xsl:otherwise>840</xsl:otherwise> <!-- odd row -->
        </xsl:choose>       
      </xsl:otherwise> <!-- hi row -->
    </xsl:choose> 
  </xsl:variable>   

  <xsl:variable name="y1L">
    <xsl:choose>
      <xsl:when test="@row &lt;= 5"><xsl:value-of select="$y1 - 5"/></xsl:when> <!-- lo row -->
      <xsl:otherwise><xsl:value-of select="$y1 + 15"/></xsl:otherwise> <!-- hi row -->
    </xsl:choose> 
  </xsl:variable>    
  
  <xsl:if test=". != ''">
    <line x1="{$x}" y1="{$y1}" x2="{$x}" y2="{$y2}" class="LabelForceLine" marker-end="url(#startMarker)" xmlns="http://www.w3.org/2000/svg"/>
    <text x="{$x}" y="{$y1L}" class="LabelName" xmlns="http://www.w3.org/2000/svg"><xsl:value-of select="."/></text>
  </xsl:if>
       
</xsl:template>  


<!-- **************************** instructions ***************************** -->

<xsl:template match="hbml:forces" mode="instructions">
  <xsl:for-each select="hbml:force">
    <xsl:apply-templates select="hbml:special/hbml:instructions"/>
  </xsl:for-each>
</xsl:template>

<xsl:template match="hbml:special/hbml:instructions">
  <xsl:if test="../../@type='german'">
    <text x="{$pLf + 40}" y="590" class="NotesHeader" xmlns="http://www.w3.org/2000/svg">Axis Player</text>
    <xsl:apply-templates select="hbml:p" mode="german"/> 
  </xsl:if>
  <xsl:if test="../../@type='allied'">
    <text x="{$pLf + 40}" y="650" class="NotesHeader" xmlns="http://www.w3.org/2000/svg">Allied Player</text>
    <xsl:apply-templates select="hbml:p" mode="allied"/> 
  </xsl:if>  
</xsl:template>

<xsl:template match="hbml:p" mode="german">
  <xsl:variable name="y"><xsl:value-of select="position() * 11 + 590"/></xsl:variable>
  <circle cx="{$pLf + 55}" cy="{$y - 3}" r="3" class="TerrainKey" xmlns="http://www.w3.org/2000/svg" />
  <text x="{$pLf + 60}" y="{$y}" class="NotesText" xmlns="http://www.w3.org/2000/svg">
    <xsl:call-template name="breakText">
      <xsl:with-param name="strMsg" select="text()"/>
      <xsl:with-param name="numChars" select="40"/>
      <xsl:with-param name="offSet" select="11"/>
      <xsl:with-param name="xLeft" select="$pLf + 60"/>
    </xsl:call-template>
  </text> 
</xsl:template>  

<xsl:template match="hbml:p" mode="allied">
  <xsl:if test="text() != ''">
    <xsl:variable name="y"><xsl:value-of select="position() * 11 + 650"/></xsl:variable>
    <circle cx="{$pLf + 55}" cy="{$y - 3}" r="3" class="TerrainKey" xmlns="http://www.w3.org/2000/svg" />
    <text x="{$pLf + 60}" y="{$y}" class="NotesText" xmlns="http://www.w3.org/2000/svg">
      <xsl:call-template name="breakText">
        <xsl:with-param name="strMsg" select="text()"/>
        <xsl:with-param name="numChars" select="40"/>
        <xsl:with-param name="offSet" select="11"/>
        <xsl:with-param name="xLeft" select="$pLf + 60"/>
      </xsl:call-template>
    </text> 
  </xsl:if>
</xsl:template>  

  
<!-- ***************************** other text ****************************** -->

<xsl:template match="hbml:notes">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="hbml:note[@type='historical']">
  <xsl:if test="count(hbml:p) &gt; 0">
    <text x="{$pLf + 40}" y="420" class="NotesTitle" xmlns="http://www.w3.org/2000/svg">Historical Background</text>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="hbml:note[@type='historical']/hbml:p">
  <xsl:variable name="y"><xsl:value-of select="(position() div 2) * 12 + 420"/></xsl:variable>
  <text class="NotesText" x="{$pLf + 40}" y="{$y}" xmlns="http://www.w3.org/2000/svg">
    <xsl:call-template name="breakText">
      <xsl:with-param name="strMsg" select="text()"/>
      <xsl:with-param name="numChars" select="113"/>
      <xsl:with-param name="offSet" select="12"/>
      <xsl:with-param name="xLeft" select="$pLf + 40"/>
    </xsl:call-template>
  </text>
</xsl:template>

<xsl:template match="hbml:note[@type='victory']">
  <xsl:if test="count(hbml:p) &gt; 0">
    <text x="{$pLf + 40}" y="710" class="NotesTitle" xmlns="http://www.w3.org/2000/svg">Conditions of Victory</text>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="hbml:note[@type='victory']/hbml:p">
  <xsl:variable name="y"><xsl:value-of select="(position() div 2) * 12 + 710"/></xsl:variable>
  <text class="NotesText" x="{$pLf + 40}" y="{$y}" xmlns="http://www.w3.org/2000/svg">
    <xsl:call-template name="breakText">
      <xsl:with-param name="strMsg" select="text()"/>
      <xsl:with-param name="numChars" select="52"/>
      <xsl:with-param name="offSet" select="12"/>
      <xsl:with-param name="xLeft" select="$pLf + 40"/>
    </xsl:call-template>
  </text>
</xsl:template>


<xsl:template match="hbml:note[@type='special']">
  <xsl:if test="count(hbml:p) &gt; 0">
    <text x="{$pLf + 290}" y="570" class="NotesTitle" xmlns="http://www.w3.org/2000/svg">Special Rules</text>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="hbml:note[@type='special']/hbml:p">
  <xsl:variable name="y"><xsl:value-of select="(position() div 2) * 12 + 570"/></xsl:variable>
  <text class="NotesText" x="{$pLf + 290}" y="{$y}" xmlns="http://www.w3.org/2000/svg">
    <xsl:call-template name="breakText">
      <xsl:with-param name="strMsg" select="text()"/>
      <xsl:with-param name="numChars" select="52"/>
      <xsl:with-param name="offSet" select="12"/>
      <xsl:with-param name="xLeft" select="$pLf + 290"/>
    </xsl:call-template>
  </text>
</xsl:template>


<xsl:template match="hbml:note">
</xsl:template>

<xsl:template match="hbml:b | b">
  <tspan font-weight="bold" xmlns="http://www.w3.org/2000/svg"><xsl:apply-templates/></tspan>
</xsl:template>

<xsl:template match="hbml:i | i">
  <tspan font-style="italic" xmlns="http://www.w3.org/2000/svg"><xsl:apply-templates/></tspan>
</xsl:template>

<xsl:template match="hbml:comment"><xsl:comment/></xsl:template>


<!--********************  processed elswhere or ignore ********************* -->

<xsl:template match="hbml:meta">
</xsl:template>

<xsl:template match="hbml:scenario">
</xsl:template>

<xsl:template match="hbml:name">
</xsl:template>

<xsl:template match="hbml:title">
</xsl:template>

<xsl:template match="hbml:date">
</xsl:template>

<xsl:template match="hbml:period">
</xsl:template>

<xsl:template match="hbml:commander">
</xsl:template>

<xsl:template match="hbml:special">
</xsl:template>

<!--
<xsl:template match="hbml:">
  <xsl:apply-templates/>
</xsl:template>
-->

</xsl:stylesheet>
