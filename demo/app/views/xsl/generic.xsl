<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  
  <xsl:variable name="font_size_tiny">6pt</xsl:variable>
  <xsl:variable name="font_size_small">8pt</xsl:variable>
  <xsl:variable name="font_size_normal">10pt</xsl:variable>
  <xsl:variable name="font_size_big">12pt</xsl:variable>
  <xsl:variable name="font_size_large">14pt</xsl:variable>
  
  <xsl:variable name="margin">10pt</xsl:variable>
  <xsl:variable name="padding">10pt</xsl:variable>
  
  <xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

      <fo:layout-master-set>
        <fo:simple-page-master master-name="simple"
          page-height="29.7cm"
          page-width="21cm"
          margin-top="2.0cm"
          margin-bottom="2.0cm"
          margin-left="2.5cm"
          margin-right="2.5cm">
          <fo:region-body margin-top="4.75cm"/>
          <fo:region-before extent="4.75cm" display-align="before"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      
      <xsl:for-each select="/post">
        <fo:page-sequence master-reference="simple">
          <fo:static-content flow-name="xsl-region-before">
            <xsl:call-template name="header">
              <xsl:with-param name="content" select="."/>
            </xsl:call-template>
          </fo:static-content>
          
          <fo:flow flow-name="xsl-region-body">
            <fo:block-container height="19cm">
              <xsl:call-template name="body">
                <xsl:with-param name="content" select="."/>
              </xsl:call-template>
            </fo:block-container>
          </fo:flow>
          
        </fo:page-sequence>        
      </xsl:for-each>
      
    </fo:root>
  </xsl:template>
  
  <!-- ======================================================================================
    HEADER
    ======================================================================================= -->
  <xsl:template name="header">
    <xsl:param name="content"/>
    <fo:block font-weight="bold" text-align="center">
      <fo:block font-size="16pt">
        <xsl:value-of select="$content/title"/>
      </fo:block>
    </fo:block>
  </xsl:template>
  
  <!-- ======================================================================================
    BODY
    ======================================================================================= -->
  <xsl:template name="body">
    <xsl:param name="content"/>
    <fo:block>
      
      <fo:block font-weight="bold" text-align="center">
        <fo:block font-size="16pt">
          <xsl:value-of select="$content/body"/>
        </fo:block>
      </fo:block>

      <!-- Main text -->
      <xsl:apply-templates select="$content/text"/>  
    </fo:block>
  </xsl:template>
   
  <!-- ======================================================================================
    DEFAULT RULES
    ======================================================================================= -->
  
  <xsl:template match="*">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="text()">
    <xsl:value-of select="."/>
  </xsl:template>
  
  <!-- ======================================================================================
    FORMATTING RULES
    ======================================================================================= -->
  
  <xsl:template match="text">
    <fo:block font-size="{$font_size_normal}" text-align="justify">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="p">
    <fo:block space-before="15pt">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="span">
    <fo:inline>
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="left">
    <fo:block text-align="left">
      <xsl:apply-templates/>
    </fo:block>  
  </xsl:template>
  
  <xsl:template match="center">
    <fo:block text-align="center">
      <xsl:apply-templates/>
    </fo:block>  
  </xsl:template>
  
  <xsl:template match="right">
    <fo:block text-align="right">
      <xsl:apply-templates/>
    </fo:block>  
  </xsl:template>
  
  <xsl:template match="bold|strong">
    <fo:inline font-weight="bold">
      <xsl:apply-templates/>
    </fo:inline>  
  </xsl:template>
  
  <xsl:template match="italic">
    <fo:inline font-style="italic">
      <xsl:apply-templates/>
    </fo:inline>  
  </xsl:template>
  
  <xsl:template match="regular|div">
    <fo:block>
      <xsl:apply-templates/>
    </fo:block>  
  </xsl:template>

  <xsl:template match="tiny">
    <fo:inline font-size="{$font_size_tiny}">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="small">
    <fo:inline font-size="{$font_size_small}">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="medium">
    <fo:inline font-size="{$font_size_normal}">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="big">
    <fo:inline font-size="{$font_size_big}">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="large">
    <fo:inline font-size="{$font_size_large}">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="underline">
    <fo:inline text-decoration="underline">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="box">
    <xsl:variable name="padding">10pt</xsl:variable>
    <fo:block border="1pt solid black" >
      <fo:block margin="{$padding}">
        <xsl:apply-templates/>  
      </fo:block>
    </fo:block>  
  </xsl:template>

</xsl:stylesheet>