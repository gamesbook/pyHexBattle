<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<!--
  Author: Derek Hohls
  Date: 27 Jun 2004   
  Purpose: Store common routines for use by many  HexBattle stylesheets
-->

<!--
formatDate:  Process date from y-m-d into suitable format.
-->
<xsl:template name="formatDate">
	<xsl:param name="year"/>
	<xsl:param name="month"/>
  <xsl:param name="day"/>
  <xsl:param name="style"/>
  <xsl:variable name="monthName">
  	<xsl:choose>
      <xsl:when test="$month = 1">January</xsl:when>
      <xsl:when test="$month = 2">February</xsl:when>
      <xsl:when test="$month = 3">March</xsl:when>
      <xsl:when test="$month = 4">April</xsl:when>
      <xsl:when test="$month = 5">May</xsl:when>
      <xsl:when test="$month = 6">June</xsl:when>
      <xsl:when test="$month = 7">July</xsl:when>
      <xsl:when test="$month = 8">August</xsl:when>
      <xsl:when test="$month = 9">September</xsl:when>
      <xsl:when test="$month = 10">October</xsl:when>
      <xsl:when test="$month = 11">November</xsl:when>
      <xsl:when test="$month = 12">December</xsl:when>
  		<xsl:otherwise>January</xsl:otherwise>
  	</xsl:choose>
  </xsl:variable>  
  <xsl:choose>
    <xsl:when test="$style = 'EURO'"><xsl:value-of select="$day"/><xsl:text> </xsl:text><xsl:value-of select="$monthName"/><xsl:text> </xsl:text><xsl:value-of select="$year"/></xsl:when>
    <!-- default style is US -->
    <xsl:otherwise><xsl:value-of select="$monthName"/><xsl:text> </xsl:text><xsl:value-of select="$day"/>, <xsl:value-of select="$year"/></xsl:otherwise>
  </xsl:choose>  
</xsl:template>

<!-- to use as basis for DRAWING BACKGROUND HEXES -->

<xsl:template name="loop">
  <xsl:param name="i"/>
  <xsl:param name="n"/>
  <xsl:call-template name="for">
    <xsl:with-param name="i" select="$i"/>
    <xsl:with-param name="n" select="$n"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="for">
  <xsl:param name="i"/>
  <xsl:param name="n"/>
  <xsl:value-of select="$i"/>
  <xsl:text> </xsl:text>
  <xsl:value-of select="$i*$i"/><br/>
  <xsl:if test="$i &lt; $n">
    <xsl:call-template name="for">
      <xsl:with-param name="i" select="$i+1"/>
      <xsl:with-param name="n" select="$n"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>
