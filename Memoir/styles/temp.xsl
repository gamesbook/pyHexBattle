<?xml version="1.0"?>

<!-- ====================================================================== -->
<!--                                                                        -->
<!--                                                                        -->
<!-- @author dhohls@csir.co.za                                              -->
<!-- @version v 1.0 2004-01-01 22:27:58                                     -->
<!--                                                                        -->
<!--

-->  
<!-- ====================================================================== -->

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:svg="http://www.w3.org/2000/svg"
  >
  
<!-- request parameters -->
<xsl:param name="null"></xsl:param>



</xsl:stylesheet>

      
  <g id="grid" transform="translate({$mapOffX},{$mapOffY}) scale(.33) " xmlns="http://www.w3.org/2000/svg">
    <!-- BACKGROUND -->
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