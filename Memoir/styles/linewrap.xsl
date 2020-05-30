<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

<!-- global constants -->

<xsl:variable name="BREAK" select="' '"/>

<!--
Breaks msg into one or more lines.
Lines are broken at the numChars-th character, so each 
line will have no more than (numChars-1) characters each.
Each line is printed inside a tspan element with X position
'xLeft' and with a Y 'offset' of each line relative to the
previous.  The first line will NOT be offset.
-->
<xsl:template name="breakText">
	<xsl:param name="strMsg"/>
	<xsl:param name="numChars">80</xsl:param>
	<xsl:param name="xLeft">0</xsl:param>
	<xsl:param name="offSet">10</xsl:param>
	<xsl:param name="first">true</xsl:param>
	<xsl:variable name="yOff">
	  <xsl:choose>
		  <xsl:when test="$first='true'">0</xsl:when>
		  <xsl:otherwise><xsl:value-of select="$offSet"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>  
  <xsl:choose>
		<xsl:when test="string-length($strMsg) &lt; $numChars">
		  <tspan x="{$xLeft}" dy="{$yOff}" xmlns="http://www.w3.org/2000/svg"><xsl:value-of select="$strMsg"/></tspan>
		</xsl:when>
		<xsl:otherwise>
			<xsl:variable name="strFirst">
				<xsl:call-template name="maxSubstringEndingWithBreak">
	  			<xsl:with-param name="strFragment" select="substring($strMsg,1,$numChars)"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="strRest" select="substring-after($strMsg,$strFirst)"/>
			<tspan x="{$xLeft}" dy="{$yOff}" xmlns="http://www.w3.org/2000/svg"><xsl:value-of select="$strFirst"/></tspan>
			<xsl:call-template name="breakText">
				<xsl:with-param name="strMsg" select="$strRest"/>
				<xsl:with-param name="numChars" select="$numChars"/>
				<xsl:with-param name="offSet" select="$offSet"/>
				<xsl:with-param name="xLeft" select="$xLeft"/>
				<xsl:with-param name="first">false</xsl:with-param>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!--
Given parameter s, this function returns the maximal left
substring of s ending in a break character. If there is no
break character, then the entire string is returned.
-->
<xsl:template name="maxSubstringEndingWithBreak">
	<xsl:param name="strFragment"/>
	<xsl:variable name="len" select="string-length($strFragment)"/>
	<xsl:choose>
		<xsl:when test="len &lt;= 1 or substring($strFragment,$len)=$BREAK	or contains($strFragment,$BREAK)=false">
		  <xsl:value-of select="$strFragment"/>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:call-template name="maxSubstringEndingWithBreak">
		    <xsl:with-param name="strFragment" select="substring($strFragment, 1, $len - 1)"/>
		  </xsl:call-template>
		</xsl:otherwise>
</xsl:choose>
</xsl:template>

</xsl:stylesheet>

<!--

<?xml version="1.0"?>
<example>
<sometext>This is some element text that we'd like to have broken
into multiple lines of no more than X characters each.</sometext>
</example>


<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:import href="linebreak.xsl"/>
<xsl:output method="text" encoding="iso-8859-1"/>

<xsl:template match="/example/sometext">
  <xsl:call-template name="breakText">
    <xsl:with-param name="strMsg" select="text()"/>
    <xsl:with-param name="numChars" select="15"/>
    <xsl:with-param name="xLeft" select="0"/>
    <xsl:with-param name="offSet" select="15"/>
  </xsl:call-template>
</xsl:template>

</xsl:stylesheet>

-->
