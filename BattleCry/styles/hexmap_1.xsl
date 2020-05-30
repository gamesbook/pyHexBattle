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
	  <!-- row 1 -->      
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
	  <!-- row 2 -->  
	  <use xlink:href="#hex" class="Blank" transform="translate(50,86.6015)"/>    
	  <use xlink:href="#hex" class="Blank" transform="translate(150,86.6015)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(250,86.6015)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(350,86.6015)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(450,86.6015)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(550,86.6015)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(650,86.6015)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(750,86.6015)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(850,86.6015)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(950,86.6015)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(1050,86.6015)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(1150,86.6015)"/>  
	  <!-- row 3 -->      
    <use xlink:href="#hex" class="Blank" transform="translate(0,173.203)"/> 
	  <use xlink:href="#hex" class="Blank" transform="translate(100,173.203)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(200,173.203)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(300,173.203)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(400,173.203)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(500,173.203)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(600,173.203)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(700,173.203)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(800,173.203)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(900,173.203)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(1000,173.203)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(1100,173.203)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(1200,173.203)"/>
	  <!-- row 4 -->      
	  <use xlink:href="#hex" class="Blank" transform="translate(50,259.8045)"/>    
	  <use xlink:href="#hex" class="Blank" transform="translate(150,259.8045)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(250,259.8045)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(350,259.8045)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(450,259.8045)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(550,259.8045)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(650,259.8045)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(750,259.8045)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(850,259.8045)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(950,259.8045)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(1050,259.8045)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(1150,259.8045)"/>         
	  <!-- row 5 -->      
	  <use xlink:href="#hex" class="Blank" transform="translate(0,346.406)" />
	  <use xlink:href="#hex" class="Blank" transform="translate(100,346.406)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(200,346.406)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(300,346.406)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(400,346.406)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(500,346.406)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(600,346.406)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(700,346.406)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(800,346.406)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(900,346.406)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(1000,346.406)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(1100,346.406)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(1200,346.406)"/>
	  <!-- row 6 -->      
	  <use xlink:href="#hex" class="Blank" transform="translate(50,433.0075)"/>    
	  <use xlink:href="#hex" class="Blank" transform="translate(150,433.0075)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(250,433.0075)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(350,433.0075)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(450,433.0075)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(550,433.0075)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(650,433.0075)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(750,433.0075)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(850,433.0075)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(950,433.0075)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(1050,433.0075)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(1150,433.0075)"/> 
	  <!-- row 7 -->      
	  <use xlink:href="#hex" class="Blank" transform="translate(0,519.609) " />
	  <use xlink:href="#hex" class="Blank" transform="translate(100,519.609)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(200,519.609)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(300,519.609)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(400,519.609)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(500,519.609)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(600,519.609)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(700,519.609)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(800,519.609)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(900,519.609)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(1000,519.609)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(1100,519.609)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(1200,519.609)"/>
	  <!-- row 8 -->      
	  <use xlink:href="#hex" class="Blank" transform="translate(50,606.2105)"/>    
	  <use xlink:href="#hex" class="Blank" transform="translate(150,606.2105)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(250,606.2105)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(350,606.2105)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(450,606.2105)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(550,606.2105)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(650,606.2105)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(750,606.2105)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(850,606.2105)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(950,606.2105)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(1050,606.2105)"/> 
    <use xlink:href="#hex" class="Blank" transform="translate(1150,606.2105)"/>  
	  <!-- row 9 -->      
	  <use xlink:href="#hex" class="Blank" transform="translate(0,692.812) " />
	  <use xlink:href="#hex" class="Blank" transform="translate(100,692.812)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(200,692.812)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(300,692.812)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(400,692.812)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(500,692.812)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(600,692.812)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(700,692.812)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(800,692.812)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(900,692.812)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(1000,692.812)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(1100,692.812)"/>
    <use xlink:href="#hex" class="Blank" transform="translate(1200,692.812)"/>
  </g>  
</xsl:template>  
  
</xsl:stylesheet>  