<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="DickinsonColl" select="collection('Dickinson')"/>
    <xsl:variable name="y-interval" select="100"/>
    <xsl:variable name="x-interval" select="50"/>
   
   
    <xsl:template match="/">
        <svg width="100%" height="100%">
            <g transform="translate(100, 600)">
                <g id="baseStuff">
                    <!-- title -->
                    <text x="275" y="-525" text-anchor="middle" font-size="18px">Percentage of Dash Changes in Published Versions Compared to Originals</text>
                    <!-- y-Axis -->
                    <line x1="0" x2="0" y1="0" y2="-450" stroke="black" stroke-width="1"/>
                    <!-- x-Axis -->
                    <line x1="-1" x2="550" y1="0" y2="0" stroke="black" stroke-width="1"/>
                    <!-- y-axis marks -->
                    <text x="-25" y="-100" text-anchor="middle">25%</text>
                    <line x1="-10" x2="550" y1="-100" y2="-100" style="stroke: black; fill:none; stroke-width: 1px; stroke-dasharray: 10 5"/>
                    <text x="-25" y="-200" text-anchor="middle">50%</text>
                    <line x1="-10" x2="550" y1="-200" y2="-200" style="stroke: black; fill:none; stroke-width: 1px; stroke-dasharray: 10 5"/>
                    <text x="-25" y="-300" text-anchor="middle">75%</text>
                    <line x1="-10" x2="550" y1="-300" y2="-300" style="stroke: black; fill:none; stroke-width: 1px; stroke-dasharray: 10 5"/>
                    <text x="-25" y="-400" text-anchor="middle">100%</text>
                    <line x1="-10" x2="550" y1="-400" y2="-400" style="stroke: black; fill:none; stroke-width: 1px; stroke-dasharray: 10 5"/>
                    <!-- y-axis label -->
                    <text x="210" y="-50" transform="rotate(-90)" text-anchor="middle" font-size="20px">Percentage of Usages</text>
                    <!-- x-axis marks -->
                    <text x="50" y="25" text-anchor="middle" font-size="10px">Poem 1</text>
                    <line x1="50" x2="50" y1="10" y2="-10" stroke="black" stroke-width="1"/>
                    <text x="100" y="25" text-anchor="middle" font-size="10px">Poem 2</text>
                    <line x1="100" x2="100" y1="10" y2="-10" stroke="black" stroke-width="1"/>
                    <text x="150" y="25" text-anchor="middle" font-size="10px">Poem 3</text>
                    <line x1="150" x2="150" y1="10" y2="-10" stroke="black" stroke-width="1"/>
                    <text x="200" y="25" text-anchor="middle" font-size="10px">Poem 4</text>
                    <line x1="200" x2="200" y1="10" y2="-10" stroke="black" stroke-width="1"/>
                    <text x="250" y="25" text-anchor="middle" font-size="10px">Poem 5</text>
                    <line x1="250" x2="250" y1="10" y2="-10" stroke="black" stroke-width="1"/>
                    <text x="300" y="25" text-anchor="middle" font-size="10px">Poem 6</text>
                    <line x1="300" x2="300" y1="10" y2="-10" stroke="black" stroke-width="1"/>
                    <text x="350" y="25" text-anchor="middle" font-size="10px">Poem 7</text>
                    <line x1="350" x2="350" y1="10" y2="-10" stroke="black" stroke-width="1"/>
                    <text x="400" y="25" text-anchor="middle" font-size="10px">Poem 8</text>
                    <line x1="400" x2="400" y1="10" y2="-10" stroke="black" stroke-width="1"/>
                    <text x="450" y="25" text-anchor="middle" font-size="10px">Poem 9</text>
                    <line x1="450" x2="450" y1="10" y2="-10" stroke="black" stroke-width="1"/>
                    <text x="500" y="25" text-anchor="middle" font-size="10px">Poem 10</text>
                    <line x1="500" x2="500" y1="10" y2="-10" stroke="black" stroke-width="1"/>
                    <text x="550" y="25" text-anchor="middle" font-size="10px">Poem 11</text>
                    <line x1="550" x2="550" y1="10" y2="-10" stroke="black" stroke-width="1"/>
                </g>
                <g id="dots">
        <!--ebb: This isn't working yet! The numbers for the hyphen count are much too high per poem.
        They should be on the order of 20 to 30 hyphens per poem, not in the hundreds. -->        
              <xsl:for-each select="$DickinsonColl//TEI">
                  <xsl:variable name="poemNumber" select="number(substring-after(.//idno, '16'))"/>
                  <xsl:variable name="hyphenX">
                      <xsl:apply-templates select=".//rdg"/>
                  </xsl:variable>
              <xsl:variable name="hyphenCount">
                      <xsl:value-of select="string-length($hyphenX)"/>
                  </xsl:variable>
               
              
                 <xsl:text>Hyphen Count!</xsl:text><xsl:value-of select="$hyphenCount"/>
                        <circle cx="{$poemNumber*$x-interval}" cy="-{$hyphenCount}" r="40" stroke="black" stroke-width="3" fill="red" />
                            
             
                    </xsl:for-each>
                </g>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="rdg[contains(., '&#8212;')]">
        <xsl:analyze-string select="." regex="&#8212;">
            <xsl:matching-substring >
       <!--         
          <xsl:value-of select="regex-group(0)"/>-->
             <xsl:text>X</xsl:text>   
            </xsl:matching-substring>
            
        </xsl:analyze-string>
    </xsl:template>
    
    
</xsl:stylesheet>