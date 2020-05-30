<?xml version="1.0"?>
<!--
  Author: Derek Hohls
  Date: 17 Jun 2003
  Typical Usage with XT: 
    xt bc_Battle.xml battle2colorTerrain.xsl Battle.svg     
-->
<xsl:stylesheet 
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:hbml="http://users.erols.com/jadf/bc/"
  exclude-result-prefixes="hbml"
  >

<xsl:variable name="s_width">1500</xsl:variable>
<xsl:variable name="s_height">1000</xsl:variable>
<xsl:variable name="s_viewbox">0 0 1500 1000</xsl:variable>

<xsl:variable name="mapOffY">10</xsl:variable>
<xsl:variable name="mapOffX">10</xsl:variable>

<xsl:variable name="imageX">88</xsl:variable>
<xsl:variable name="imageY">101</xsl:variable>

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="hbml:hexbattle[@type='battlecry']">
<svg width="{$s_width}" height="{$s_height}" viewBox="{$s_viewbox}"
xmlns="http://www.w3.org/2000/svg">

  <defs>
		<style type="text/css">
		<![CDATA[
    
      .Board { fill:rgb(215,241,65); stroke:rgb(215,241,65) }
      .Blank { fill:none; stroke:rgb(147,147,147) }
      .Shaded { fill:rgb(255,0,0); stroke:rgb(255,0,0); opacity:0.5; }
      .Border { fill:none; stroke:rgb(255,0,0); stroke-width:8; }
      .Sector { fill:black; stroke:black; stroke-width:1.25; stroke-dasharray:15,5; } /* dashed */ 
      .BattleName, .BattleTitle { fill:white; stroke:white; font-size:36; font-family:"Times New Roman",Serif; }
      .BattleTitle { font-size:24;}
      .BattleDate, .BattlePeriod{ fill:white; stroke:white; font-family:Arial,SanSerif; text-anchor:end; font-weight:normal;}
      .BattleDate { font-size:20;} 
      .BattlePeriod { font-size:18;}
 
    ]]>     
		</style>
    
    <g id="hex">
	    <polygon points="0,28.6175  50,0  100,28.6175  100,86.6025  50,115.47  0,86.6025  0,28.6175"/>
	    <!--<circle cy="57.735" cx="50" r="1" fill="white" stroke="white" />-->
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
    
  <!-- TERRAIN -->
  <xsl:apply-templates select="hbml:terrain" mode="location"/>
    
  <!-- GRID OVERLAY -->     
  <g id="grid" transform="scale(.88) translate({$mapOffX},{$mapOffY})" xmlns="http://www.w3.org/2000/svg">
    <use xlink:href="#rowOdd"/> <!-- row 1 -->
    <use xlink:href="#rowEven" transform="translate(0,86.6015)"/> <!-- row 2 -->
    <use xlink:href="#rowOdd"  transform="translate(0,173.203)"/> <!-- row 3 -->  
    <use xlink:href="#rowEven" transform="translate(0,259.8045)"/> <!-- row 4 --> 
    <use xlink:href="#rowOdd"  transform="translate(0,346.406)"/> <!-- row 5 -->  
    <use xlink:href="#rowEven" transform="translate(0,433.0075)"/> <!-- row 6 --> 
    <use xlink:href="#rowOdd"  transform="translate(0,519.609)"/> <!-- row 7 -->  
    <use xlink:href="#rowEven" transform="translate(0,606.2105)"/> <!-- row 8 --> 
    <use xlink:href="#rowOdd"  transform="translate(0,692.812)"/> <!-- row 9 -->  
  </g> 
  
  <!-- SECTORS -->
  <g id="grid" transform="scale(.88) translate({$mapOffX},{$mapOffY})">
    <line x1="400" y1="28" x2="400" y2="782" class="Sector"/>
    <line x1="900" y1="28" x2="900" y2="782" class="Sector"/>
  </g>   
   
  <!-- MAP TITLE -->
  <text x="10" y="50"><tspan class="BattleName"><xsl:value-of select="hbml:scenario/hbml:name"/></tspan>
  <tspan class="BattleTitle"><xsl:if test="hbml:scenario/hbml:title != ''"> - </xsl:if>
  <xsl:value-of select="hbml:scenario/hbml:title"/></tspan>
  </text>
  <text x="1485" y="50"><tspan class="BattlePeriod"><xsl:value-of select="hbml:scenario/hbml:period"/>&#160;</tspan><tspan class="BattleDate"><xsl:value-of select="hbml:scenario/hbml:date"/></tspan></text>
   
</svg>
</xsl:template>

<!-- terrain locations -->

<xsl:template match="hbml:terrain" mode="location">
  <g id="grid" transform="translate({$mapOffX},{$mapOffY})" xmlns="http://www.w3.org/2000/svg">
    <xsl:apply-templates select="hbml:hex" mode="location"/>
  </g>
</xsl:template>

<xsl:template match="hbml:hex" mode="location">
  <xsl:variable name="y">
    <xsl:choose>
      <xsl:when test="@row mod 2 = 0"><xsl:value-of select="(@row - 1) * 76"/></xsl:when> 
      <xsl:otherwise><xsl:value-of select="(@row - 1) * 76"/></xsl:otherwise> <!--  -->
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
  <xsl:variable name="theta">
    <xsl:value-of select="(@face - 1) * 60"/>
  </xsl:variable>

  <xsl:if test="@type='terrain'">
    <xsl:choose>
      <xsl:when test="@face">
        <image xmlns="http://www.w3.org/2000/svg" width="{$imageX}px" height="{$imageY}px" transform="translate({$x},{$y}) rotate({$theta},{$rx},{$ry})"><xsl:attribute name="xlink:href">tiles/<xsl:value-of select="@style"/>.png</xsl:attribute></image>   
      </xsl:when> 
      <xsl:otherwise>
         <image xmlns="http://www.w3.org/2000/svg" x="{$x}" y="{$y}" width="{$imageX}px" height="{$imageY}px"><xsl:attribute name="xlink:href">tiles/<xsl:value-of select="@style"/>.png</xsl:attribute></image>    
      </xsl:otherwise> 
    </xsl:choose>   
  </xsl:if>
    
</xsl:template>


<!--
<xsl:template match="hbml:">
  <xsl:apply-templates/>
</xsl:template>
-->


</xsl:stylesheet>
