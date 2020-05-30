<?xml version="1.0"?>
<!--
  Author: Derek Hohls
  Date: 17 Jun 2003
  Typical Usage with XT: 
    xt bc_Battle.xml battle2colorSVG.xsl Battle.svg     
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

<xsl:variable name="mapOffY">200</xsl:variable>
<xsl:variable name="mapOffX">10</xsl:variable>
<xsl:variable name="labelOffset">87</xsl:variable>

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
      .Symbol { font-family:Arial,SanSerif; font-size:24; stroke:red; fill:red; text-anchor:middle;}
      .Sector { fill:black; stroke:black; stroke-width:1.25; stroke-dasharray:15,5; } /* dashed */ 
      .BattleName, .BattleTitle { fill:white; stroke:white; font-size:36; font-family:"Times New Roman",Serif; }
      .BattleTitle { font-size:24;}
      .BattleDate, .BattlePeriod{ fill:white; stroke:white; font-family:Arial,SanSerif; text-anchor:end; font-weight:normal;}
      .BattleDate { font-size:20;} 
      .BattlePeriod { font-size:18;}
      .NotesTitle {font-size:24; font-family:Arial,SanSerif; font-weight:bold; }
      .NotesHeader {font-size:18; font-family:Arial,SanSerif; font-weight:bold;}
      .NotesText, .LabelName {font-size:14; font-family:Arial,SanSerif;} 
      .Designer {font-family:Arial,SanSerif; font-size:12; text-anchor:end; font-style:italic; }
      .LabelPlace {font-family:"Times New Roman",Serif; font-size:15; font-style:italic; font-weight:bold; text-anchor:middle;}
      .LabelName {text-anchor:middle;}
      .LabelLine {fill:black; stroke:black; stroke-width:1.5; }
      .LabelSpecial {font-family:"Times New Roman",Serif; font-size:15; stroke:red; text-anchor:middle;}
      .LabelSpecialLine {fill:red; stroke:red; stroke-width:3; }
      .LabelForceLine {fill:black; stroke:black; stroke-width:2; }      
      .Title { fill:rgb(102,107,128); stroke:rgb(95,100,119) }
      .Notes { fill:rgb(232,232,244); stroke:rgb(232,232,244) } 
 
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
  
  <!-- TEXT BOXES -->
  <rect x="0" y="0" width="1500" height="75"  class="Title" />
  <rect x="1200" y="76" width="300" height="924"  class="Notes" />    
  
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
   
  <!-- SHOW FORCES -->
  <xsl:apply-templates select="hbml:forces" mode="location"/>  
  <xsl:apply-templates select="hbml:forces" mode="label"/>

  <!-- TERRAIN LABEL -->
  <xsl:apply-templates select="hbml:terrain" mode="label"/>  
  
  <!-- MAP TITLE -->
  <text x="10" y="50"><tspan class="BattleName"><xsl:value-of select="hbml:scenario/hbml:name"/></tspan>
  <tspan class="BattleTitle"><xsl:if test="hbml:scenario/hbml:title != ''"> - </xsl:if>
  <xsl:value-of select="hbml:scenario/hbml:title"/></tspan>
  </text>
  <text x="1485" y="50"><tspan class="BattlePeriod"><xsl:value-of select="hbml:scenario/hbml:period"/>&#160;</tspan><tspan class="BattleDate"><xsl:value-of select="hbml:scenario/hbml:date"/></tspan></text>
  
  <!-- META -->
  <text x="1485" y="100" class="Designer">
    <xsl:if test="hbml:meta/hbml:designer/hbml:name != ''">
    Designed by <xsl:value-of select="hbml:meta/hbml:designer/hbml:name"/>
    </xsl:if>
  </text>
  <text x="1485" y="120" class="Designer"><xsl:value-of select="hbml:meta/hbml:designer/hbml:email"/></text>
  
  <!-- NOTES -->
  <text x="1220" y="200" class="NotesTitle">STAFFING NOTES</text>  
  <text x="1220" y="240" class="NotesHeader">Union Player</text>
  <text x="1220" y="260" class="NotesText"><xsl:value-of select="hbml:forces/hbml:force[@type='union']/hbml:commander"/></text>
  <text x="1220" y="280" class="NotesText">Take <xsl:value-of select="hbml:forces/hbml:force[@type='union']/hbml:special/hbml:cards"/> Command Cards</text>
  <text x="1220" y="300" class="NotesText"><xsl:value-of select="hbml:forces/hbml:force[@type='union']/hbml:special/hbml:instructions"/></text>
  <text x="1220" y="340" class="NotesHeader">Confederate Player</text>
  <text x="1220" y="360" class="NotesText"><xsl:value-of select="hbml:forces/hbml:force[@type='confederate']/hbml:commander"/></text>
  <text x="1220" y="380" class="NotesText">Take <xsl:value-of select="hbml:forces/hbml:force[@type='confederate']/hbml:special/hbml:cards"/> Command Cards</text>  
  <text x="1220" y="400" class="NotesText"><xsl:value-of select="hbml:forces/hbml:force[@type='confederate']/hbml:special/hbml:instructions"/></text>   
 <!-- SPECIAL NOTES -->
  <xsl:apply-templates select="hbml:notes" /> 
  
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
        <image xmlns="http://www.w3.org/2000/svg" width="{$imageX}px" height="{$imageY}px" transform="translate({$x},{$y}) rotate({$theta},{$rx},{$ry})"><xsl:attribute name="xlink:href">tiles/<xsl:value-of select="@style"/>.png</xsl:attribute></image>   
      </xsl:when> 
      <xsl:otherwise>
         <image xmlns="http://www.w3.org/2000/svg" x="{$x}" y="{$y}" width="{$imageX}px" height="{$imageY}px"><xsl:attribute name="xlink:href">tiles/<xsl:value-of select="@style"/>.png</xsl:attribute></image>    
      </xsl:otherwise> 
    </xsl:choose>   

  </xsl:if>
  <xsl:if test="@type='special'">
    <xsl:if test="@style='shaded'">
      <g xmlns="http://www.w3.org/2000/svg">
        <use xlink:href="#hex" class="Shaded" transform="translate({$x - 1},{$y}) scale(0.88)" />
      </g> 
    </xsl:if> 
    <xsl:if test="@style='border'">
      <g xmlns="http://www.w3.org/2000/svg">
        <use xlink:href="#hex" class="Border" transform="translate({$x - 1},{$y}) scale(0.88)" />
      </g> 
    </xsl:if>   
    <xsl:if test="@style='symbol'">
      <text xmlns="http://www.w3.org/2000/svg" class="Symbol" x="{$sx}" y="{$sy}"><xsl:value-of select="."/></text>
    </xsl:if> 
  </xsl:if>  
</xsl:template>

<!-- terrain labels -->

<xsl:template match="hbml:terrain" mode="label">
  <g id="grid"  transform="translate({$mapOffX},{$mapOffY - $labelOffset})" xmlns="http://www.w3.org/2000/svg">
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

<!-- force locations -->

<xsl:template match="hbml:forces" mode="location">
  <g id="forceLocation" transform=" translate({$mapOffX},{$mapOffY})" xmlns="http://www.w3.org/2000/svg">
    <xsl:apply-templates select="hbml:force" mode="location"/>
  </g>
</xsl:template>

<xsl:template match="hbml:force" mode="location">
  <xsl:apply-templates select="hbml:unit" mode="location"/>
</xsl:template>

<xsl:template match="hbml:unit" mode="location">
  <xsl:variable name="yOff">
    <xsl:choose>
      <xsl:when test="@type = 'general'">-10</xsl:when> 
      <xsl:otherwise>15</xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>  
  <xsl:variable name="xOff">
    <xsl:choose>
      <xsl:when test="@type = 'general'">0</xsl:when>
      <xsl:when test="@type='infantry' and ../@type='confederate'">24</xsl:when>
      <xsl:when test="@type='artillery' and ../@type='union'">25</xsl:when>   
      <xsl:otherwise>32</xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>  
  <xsl:variable name="y">
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
  <image xmlns="http://www.w3.org/2000/svg" x="{$x}" y="{$y}" width="50px" height="50px"><xsl:attribute name="xlink:href">pieces/<xsl:value-of select="../@type"/>_<xsl:value-of select="@type"/>.png</xsl:attribute></image>
</xsl:template>

<!-- force labels -->

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

<!-- other -->

<xsl:template match="hbml:notes">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="hbml:note[@type='special']">
  <xsl:if test="count(hbml:p) &gt; 0">
    <text x="1220" y="440" class="NotesHeader" xmlns="http://www.w3.org/2000/svg">Special Rule:</text>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="hbml:note">
</xsl:template>

<xsl:template match="hbml:p">
  <xsl:variable name="y"><xsl:value-of select="(position() div 2) * 20 + 440"/></xsl:variable>
  <text class="NotesText" x="1220" y="{$y}" xmlns="http://www.w3.org/2000/svg">
    <xsl:apply-templates/>
  </text>
</xsl:template>

<xsl:template match="hbml:b | b">
  <tspan font-weight="bold" xmlns="http://www.w3.org/2000/svg"><xsl:apply-templates/></tspan>
</xsl:template>

<xsl:template match="hbml:i | i">
  <tspan font-style="italic" xmlns="http://www.w3.org/2000/svg"><xsl:apply-templates/></tspan>
</xsl:template>

<xsl:template match="hbml:comment"><xsl:comment/></xsl:template>

<!-- processed elswhere or ignore -->

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
