<?xml version="1.0"?>
<!--
  Author: Derek Hohls
  Date: 17 Jun 2003
-->
<xsl:stylesheet 
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:hbml="http://errols.com/battlecry/"
  exclude-result-prefixes="hbml"
  >
  
<xsl:template name="hexmap">
  <!-- DRAW GRID -->  
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
</xsl:template>  
  
</xsl:stylesheet>  