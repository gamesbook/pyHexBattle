<?xml version="1.0"?>
<!--
  Author: Derek Hohls
  Date: 17 Jun 2003
  Typical Usage with XT: 
    xt bc_Battle.xml battle2bwSVG.xsl Battle.svg     
-->
<xsl:stylesheet 
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:hbml="http://users.erols.com/jadf/bc/"
  exclude-result-prefixes="hbml"
  >


<xsl:variable name="scale">0.66</xsl:variable>
<xsl:variable name="s_width"><xsl:value-of select="1333 * $scale"/></xsl:variable>
<xsl:variable name="s_height">1000</xsl:variable>
<xsl:variable name="s_viewbox">0 0 900 1000</xsl:variable>

<xsl:variable name="mapOffY">50</xsl:variable>
<xsl:variable name="mapOffX">5</xsl:variable>
<xsl:variable name="labelOffset">87</xsl:variable>

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="hbml:hexbattle[@type='battlecry']">
<svg width="{$s_width}" height="{$s_height}" viewBox="0 0 {$s_width} 1000"
xmlns="http://www.w3.org/2000/svg">

  <defs>
		<style type="text/css">
		<![CDATA[
    
      .Board { fill:rgb(215,241,65); stroke:rgb(215,241,65) }
      .Blank { fill:none; stroke:rgb(147,147,147) }
      .Shaded { fill:rgb(255,0,0); stroke:rgb(255,0,0); opacity:0.5; }
      .Symbol { font-family:Arial,SanSerif; font-size:32; stroke:red; fill:red; text-anchor:middle;}
      .Border { fill:none; stroke:rgb(255,0,0); stroke-width:8; }
      .Sector { fill:black; stroke:black; stroke-width:1.25; stroke-dasharray:15,5; } /* dashed */ 
      .BattleName, .BattleTitle { fill:black; stroke:black; font-size:18; font-family:"Times New Roman",Serif; font-weight:bold; }
      .BattleTitle { font-size:16;}
      .BattleDate, .BattlePeriod{ fill:black; stroke:black; font-family:"Times New Roman",Serif; text-anchor:end; font-weight:normal;}
      .BattleDate { font-size:16;} 
      .BattlePeriod { font-size:16;}
      .NotesTitle, .NotesHeader {font-size:12; font-family:"Times New Roman",Serif; font-weight:bold; }
      .NotesText, .LabelName {font-size:12; font-family:"Times New Roman",Serif;} 
      .Designer {font-family:"Times New Roman",Serif; font-size:12; text-anchor:end; font-style:italic; }
      .LabelPlace {font-family:"Times New Roman",Serif; font-size:10; font-style:italic; font-weight:bold; text-anchor:middle;}
      .LabelName {text-anchor:middle;}
      .LabelLine {fill:black; stroke:black; stroke-width:1.5; }
      .LabelSpecial {font-family:Arial,SanSerif; font-size:15; stroke:red; text-anchor:middle;}
      .LabelSpecialLine {fill:black; stroke:red; stroke-width:3; }
      .LabelForceLine {fill:black; stroke:black; stroke-width:2; }      
      .Title { fill:rgb(102,107,128); stroke:rgb(95,100,119) }
      .Notes { fill:rgb(232,232,244); stroke:rgb(232,232,244) } 
      /* units */
      .Unit, .General {fill:white; stroke:black; stroke-width:1.25; }
      .Infantry, .Cavalry, .Artillery {fill:black; stroke:black; stroke-width:0.75; }
      .Bridge {fill:black; stroke:black; stroke-width:5; }
      .Buildings {fill:peru; stroke:peru; stroke-width:2; }
      .Crest {fill:brown; stroke:brown; stroke-width:2; }
      .Woods {fill:greenyellow; stroke:greenyellow; stroke-width:2; }
      .Orchard {fill:green; stroke:green; stroke-width:1; }
      .Fence {fill:grey; stroke:grey; stroke-width:3; }
      .Lake {fill:blue; stroke:blue; stroke-width:2; }
      .Fieldworks {fill:none;        stroke:darkgrey; stroke-width:2; }
 
    ]]>     
		</style>
    
    <!-- DEFINE UNITS -->
    
    <g id="unit">
	    <rect x="0" y="0" width="10" height="10"/>
	  </g>    
    <g id="infantry">
      <use xlink:href="#unit" class="Unit" />
      <line x1="0" y1="0" x2="10" y2="10"  class="Infantry"/> 
      <line x1="10" y1="0" x2="0" y2="10"  class="Infantry"/> 
      <line x1="3" y1="-2" x2="3" y2="0" class="Infantry"/>
      <line x1="5" y1="-2" x2="5" y2="0" class="Infantry"/>
      <line x1="7" y1="-2" x2="7" y2="0" class="Infantry"/>      
    </g>
    <g id="cavalry">
      <use xlink:href="#unit" class="Unit" />
      <line x1="0" y1="0" x2="10" y2="10" class="Cavalry"/> 
      <line x1="3" y1="-2" x2="3" y2="0" class="Cavalry"/>
      <line x1="5.5" y1="-2" x2="5.5" y2="0" class="Cavalry"/>
      <line x1="7" y1="-2" x2="7" y2="0" class="Cavalry"/>
    </g>    
    <g id="artillery">
      <use xlink:href="#unit" class="Unit" />
      <circle cy="5" cx="5" r="2" class="Artillery"/>
      <line x1="4" y1="-2" x2="4" y2="0" class="Artillery"/>
      <line x1="6" y1="-2" x2="6" y2="0" class="Artillery"/>      
    </g>     
    <g id="general_confederate">
      <circle cy="5" cx="5" r="3" class="General"/>
    </g>
    <g id="general_union">
      <use xlink:href="#general_confederate" />
      <circle cy="5" cx="5" r="1" class="General"/>    
    </g>    
    
    <!-- DEFINE TERRAIN -->
    
    <g id="buildings">
      <rect x="20" y="20" width="15" height="30" class="Buildings"/>
      <rect x="60" y="40" width="20" height="40" class="Buildings"/>
    </g>
    
    <g id="lake">
      <circle cy="57.74" cx="50" r="40" class="Lake"/>
    </g>    
    
    <g id="woods">
      <circle cy="35" cx="35" r="15" class="Woods"/>
      <circle cy="55" cx="55" r="24" class="Woods"/>
      <circle cy="35" cx="60" r="12" class="Woods"/>
      <circle cy="45" cx="35" r="18" class="Woods"/>
      <circle cy="85" cx="45" r="22" class="Woods"/>
      <circle cy="65" cx="65" r="20" class="Woods"/>
      <circle cy="70" cx="20" r="15" class="Woods"/>
    </g>    
    
    <g id="orchard">
      <circle cy="25.3" cx="50" r="12" class="Orchard"/>
      <circle cy="57.7" cx="50" r="12" class="Orchard"/>
      <circle cy="91.7" cx="50" r="12" class="Orchard"/>
      <circle cy="40.0" cx="20" r="12" class="Orchard"/>
      <circle cy="73.0" cx="20" r="12" class="Orchard"/>
      <circle cy="40.0" cx="80" r="12" class="Orchard"/>
      <circle cy="73.0" cx="80" r="12" class="Orchard"/>      
    </g>     
    
    <g id="river_straight" transform="rotate(-60,50,57.74)">
      <rect x="0" y="43.3" width="100" height="28.87" fill="blue"/>
    </g>     
    
    <g id="river_straight_bridge">
      <use xlink:href="#river_straight" />
      <g transform="rotate(-60,50,57.74)">
        <rect x="40" y="40" width="20" height="40" fill="white" stroke="white"/>
        <line x1="40" y1="40" x2="40" y2="80" class="Bridge"/>
        <line x1="60" y1="40" x2="60" y2="80" class="Bridge"/>
      </g>
    </g>
    
    <g id="fence" transform="rotate(-60,50,57.74)">
      <line x1="88" y1="30" x2="88" y2="85" class="Fence"/>
      <line x1="93" y1="30" x2="93" y2="85" class="Fence"/>
    </g>   
    
    <g id="fence_two" >
      <g transform="rotate(-60,50,57.74)"><use xlink:href="#fence" /></g> 
      <use xlink:href="#fence" /> 
    </g>     
    
    <g id="fence_one" >
      <use xlink:href="#fence" /> 
    </g>     
    
    <g id="fence_three" >
      <g transform="rotate(-60,50,57.74)"><use xlink:href="#fence" /></g> 
      <use xlink:href="#fence" /> 
      <g transform="rotate(60,50,57.74)"><use xlink:href="#fence" /></g>
    </g>     
    
    <g id="crest">
      <line x1="90" y1="37" x2="95" y2="37" class="Crest"/>
      <line x1="85" y1="42" x2="95" y2="42" class="Crest"/>
      <line x1="85" y1="47" x2="95" y2="47" class="Crest"/>
      <line x1="85" y1="52" x2="95" y2="52" class="Crest"/>
      <line x1="85" y1="57" x2="95" y2="57" class="Crest"/>
      <line x1="85" y1="62" x2="95" y2="62" class="Crest"/>
      <line x1="85" y1="67" x2="95" y2="67" class="Crest"/>
      <line x1="85" y1="72" x2="95" y2="72" class="Crest"/>
      <line x1="85" y1="77" x2="95" y2="77" class="Crest"/>  
      <line x1="90" y1="82" x2="95" y2="82" class="Crest"/>
    </g>
    
    <g id="field-works">
      <path class="Fieldworks" style="stroke-width:10; stroke-linecap:round" d="M 7 33 L 50 8 L 93 33"/>
    </g>    
    
    <g id="crest_two">
      <g transform="rotate(-60,50,57.74)"><use xlink:href="#crest" /></g> 
      <g transform="rotate(-120,50,57.74)"><use xlink:href="#crest" /></g> 
    </g>
    
    <g id="crest_three">
      <use xlink:href="#crest" />  
      <g transform="rotate(-60,50,57.74)"><use xlink:href="#crest" /></g> 
      <g transform="rotate(-120,50,57.74)"><use xlink:href="#crest" /></g> 
    </g> 
    
    <g id="crest_four">
      <use xlink:href="#crest" />  
      <g transform="rotate(-60,50,57.74)"><use xlink:href="#crest" /></g> 
      <g transform="rotate(-120,50,57.74)"><use xlink:href="#crest" /></g> 
      <g transform="rotate(-180,50,57.74)"><use xlink:href="#crest" /></g>
    </g> 
    
    <g id="hill">
      <use xlink:href="#crest" />  
      <g transform="rotate(-60,50,57.74)"><use xlink:href="#crest" /></g> 
      <g transform="rotate(-120,50,57.74)"><use xlink:href="#crest" /></g> 
      <g transform="rotate(-180,50,57.74)"><use xlink:href="#crest" /></g>
      <g transform="rotate(-240,50,57.74)"><use xlink:href="#crest" /></g> 
      <g transform="rotate(-300,50,57.74)"><use xlink:href="#crest" /></g>      
    </g>            
    
     
    <!-- DEFINE BOARD -->

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
  <g id="grid" transform="translate({$mapOffX},{$mapOffY}) scale({$scale})" xmlns="http://www.w3.org/2000/svg">
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
  <g id="grid" transform="translate({$mapOffX},{$mapOffY}) scale({$scale})">
    <line x1="400" y1="28" x2="400" y2="782" class="Sector"/>
    <line x1="900" y1="28" x2="900" y2="782" class="Sector"/>
  </g>   
   
  <!-- SHOW FORCES -->
  <xsl:apply-templates select="hbml:forces" mode="location"/>
  <!--  
  <xsl:apply-templates select="hbml:forces" mode="label"/>
   -->
   
  <!-- TERRAIN LABEL
  <xsl:apply-templates select="hbml:terrain" mode="label"/> -->  
  
  <!-- MAP TITLE -->
  <text x="5" y="20"><tspan class="BattleName"><xsl:value-of select="hbml:scenario/hbml:name"/></tspan>
  <tspan class="BattleTitle"><xsl:if test="hbml:scenario/hbml:title != ''"> - </xsl:if>
  <xsl:value-of select="hbml:scenario/hbml:title"/></tspan> - <tspan class="BattlePeriod"><xsl:value-of select="hbml:scenario/hbml:period"/>&#160;</tspan><tspan class="BattleDate"><xsl:value-of select="hbml:scenario/hbml:date"/></tspan></text>
  
  <!-- META -->
  <text x="{$s_width - 15}" y="15" class="Designer">
    <xsl:if test="hbml:meta/hbml:designer/hbml:name != ''">
    Designed by <xsl:value-of select="hbml:meta/hbml:designer/hbml:name"/>
    </xsl:if>
  </text>
  <text x="{$s_width - 15}" y="30" class="Designer">
    <xsl:if test="hbml:meta/hbml:designer/hbml:email != ''">
    (<xsl:value-of select="hbml:meta/hbml:designer/hbml:email"/>)
    </xsl:if>    
  </text>
  
  <!-- NOTES 
  <text x="1220" y="200" class="NotesTitle">STAFFING NOTES</text>  
  <text x="1220" y="240" class="NotesHeader">Union Player</text>
  <text x="1220" y="260" class="NotesText"><xsl:value-of select="hbml:forces/hbml:force[@type='union']/hbml:commander"/></text>
  <text x="1220" y="280" class="NotesText">Take <xsl:value-of select="hbml:forces/hbml:force[@type='union']/hbml:special/hbml:cards"/> Command Cards</text>
  <text x="1220" y="300" class="NotesText"><xsl:value-of select="hbml:forces/hbml:force[@type='union']/hbml:special/hbml:instructions"/></text>
  <text x="1220" y="340" class="NotesHeader">Confederate Player</text>
  <text x="1220" y="360" class="NotesText"><xsl:value-of select="hbml:forces/hbml:force[@type='confederate']/hbml:commander"/></text>
  <text x="1220" y="380" class="NotesText">Take <xsl:value-of select="hbml:forces/hbml:force[@type='confederate']/hbml:special/hbml:cards"/> Command Cards</text>  
  <text x="1220" y="400" class="NotesText"><xsl:value-of select="hbml:forces/hbml:force[@type='confederate']/hbml:special/hbml:instructions"/></text>  --> 
 <!-- SPECIAL NOTES
  <xsl:apply-templates select="hbml:notes" /> --> 
  
</svg>
</xsl:template>

<!-- terrain locations -->

<xsl:template match="hbml:terrain" mode="location">
  <g id="grid" transform="translate({$mapOffX},{$mapOffY}) scale({$scale})" xmlns="http://www.w3.org/2000/svg">
    <xsl:apply-templates select="hbml:hex" mode="location"/>
  </g>
</xsl:template>

<xsl:template match="hbml:hex" mode="location">
  <xsl:variable name="y">
    <xsl:choose>
      <xsl:when test="@row mod 2 = 0"><xsl:value-of select="(@row - 1) * 86"/></xsl:when> <!-- even col -->
      <xsl:otherwise><xsl:value-of select="(@row - 1) * 86"/></xsl:otherwise> <!-- odd col -->
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="x">
    <xsl:choose>
      <xsl:when test="@row mod 2 = 0"><xsl:value-of select="((@col - 1) * 100) + 50"/></xsl:when> <!-- even row --> 
      <xsl:otherwise><xsl:value-of select="(@col - 1) * 100"/></xsl:otherwise> <!-- odd row -->
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="sx" select="number($x + 50)"/>
  <xsl:variable name="sy" select="number($y + 60)"/>    
  <xsl:variable name="theta">
    <xsl:value-of select="(@face - 1) * 60"/>
  </xsl:variable>

  <xsl:if test="@type='terrain'">
    <xsl:choose>
      <xsl:when test="@face">
        <use xlink:href="#{@style}" xmlns="http://www.w3.org/2000/svg" transform="translate({$x},{$y}) rotate({$theta},50,57.74)"/>
   
      </xsl:when> 
      <xsl:otherwise>
         <use xlink:href="#{@style}" xmlns="http://www.w3.org/2000/svg" transform="translate({$x},{$y})" />
             
      </xsl:otherwise> 
    </xsl:choose>   
  </xsl:if>
  
  <xsl:if test="@type='special'">
    <xsl:if test="@style='shaded'">
      <g xmlns="http://www.w3.org/2000/svg">
        <use xlink:href="#hex" class="Shaded" transform="translate({$x},{$y})" />
      </g> 
    </xsl:if> 
    
    <xsl:if test="@style='border'">
      <g xmlns="http://www.w3.org/2000/svg">
        <use xlink:href="#hex" class="Border" transform="translate({$x},{$y})" />
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
  
  <xsl:if test=". != ''">
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
  <g id="forceLocation" transform=" translate({$mapOffX},{$mapOffY}) scale({$scale})" xmlns="http://www.w3.org/2000/svg">
    <xsl:apply-templates select="hbml:force" mode="location"/>
  </g>
</xsl:template>

<xsl:template match="hbml:force" mode="location">
  <xsl:apply-templates select="hbml:unit" mode="location"/>
</xsl:template>

<xsl:template match="hbml:unit" mode="location">

<xsl:variable name="Off">0</xsl:variable>

  <xsl:variable name="yOff">
    <xsl:choose>
      <xsl:when test="@type = 'general'">
        <xsl:choose>
          <xsl:when test="../@type = 'union'">10</xsl:when>   
          <xsl:otherwise>70</xsl:otherwise>
        </xsl:choose>      
      </xsl:when> 
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="../@type = 'union'">50</xsl:when>   
          <xsl:otherwise>30</xsl:otherwise>
        </xsl:choose>      
      </xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>  
  <xsl:variable name="xOff">
    <xsl:choose>
      <xsl:when test="@type = 'general'">30</xsl:when>   
      <xsl:otherwise><xsl:value-of select="30"/></xsl:otherwise>
    </xsl:choose> 
  </xsl:variable>  
  <xsl:variable name="y">
    <xsl:choose>
      <xsl:when test="@row mod 2 = 0"><xsl:value-of select="(@row - 1) * 86  + $yOff"/></xsl:when> <!-- even col -->
      <xsl:otherwise><xsl:value-of select="(@row - 1) * 86 + $yOff"/></xsl:otherwise> <!-- odd col -->
    </xsl:choose> 
  </xsl:variable>
  <xsl:variable name="x">
    <xsl:choose>
      <xsl:when test="@row mod 2 = 0"><xsl:value-of select="((@col - 1) * 100) + 50 + $xOff"/></xsl:when> <!-- even row --> 
      <xsl:otherwise><xsl:value-of select="(@col - 1) * 100 + $xOff"/></xsl:otherwise> <!-- odd row -->
    </xsl:choose> 
  </xsl:variable>

  <g xmlns="http://www.w3.org/2000/svg" transform="translate({$x},{$y}) scale(4)">
  
    <xsl:choose>
      <xsl:when test="../@type = 'union'">
        <use xmlns="http://www.w3.org/2000/svg" xlink:href="#{@type}" transform="rotate(180,5,5)" />
        
        <xsl:choose>
          <xsl:when test="@type = 'general'"><use xmlns="http://www.w3.org/2000/svg" xlink:href="#{@type}_{../@type}" transform="rotate(180,5,5)" /></xsl:when>   
          <xsl:otherwise><use xmlns="http://www.w3.org/2000/svg" xlink:href="#{@type}" transform="rotate(180,5,5)" /></xsl:otherwise>
        </xsl:choose>         
        
      </xsl:when>   
      <xsl:otherwise>
      
        <xsl:choose>
          <xsl:when test="@type = 'general'"><use xmlns="http://www.w3.org/2000/svg" xlink:href="#{@type}_{../@type}" /></xsl:when>   
          <xsl:otherwise><use xmlns="http://www.w3.org/2000/svg" xlink:href="#{@type}"/></xsl:otherwise>
        </xsl:choose>       
      
      </xsl:otherwise>
    </xsl:choose>   

  </g>
  
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