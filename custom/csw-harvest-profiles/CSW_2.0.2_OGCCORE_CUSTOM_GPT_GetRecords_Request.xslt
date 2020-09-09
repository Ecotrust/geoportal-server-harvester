<?xml version="1.0" encoding="UTF-8"?>
<!--
 See the NOTICE file distributed with
 this work for additional information regarding copyright ownership.
 Esri Inc. licenses this file to You under the Apache License, Version 2.0
 (the "License"); you may not use this file except in compliance with
 the License.  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="no" encoding="UTF-8" omit-xml-declaration="yes"/>
   <!--
Globals
-->
 <xsl:param name="searchQueryDoHitsOnly" select="'false'"/>
 <xsl:variable name="numOfPrefetchRecords" select="500"/>
 <xsl:variable name="searchTextWildCardCharacter" select="'*'"/>
 <xsl:variable name="searchTextSingleCharacter" select="'%'"/>
 <xsl:variable name="searchTextEscapeCharacter" select="'\'"/>
 <xsl:variable name="gmlBoxSrsName" select="'http://www.opengis.net/gml/srs/epsg.xml#4326'"/>
  <!--  **********************************************************************************************************************************************************
Template default

****************************************************************************************************************************************************************-->
  <xsl:template match="/">
    <xsl:choose>

      <xsl:when test="count(/GetRecords) > 0">
       <!-- ******************************************************************************************************
       When the minimal xml criteria is given then this section is executed.  This will be given by the harvestor
       Controlled by [Profiles.xml]/CSWProfiles/Profile/GetRecords/XSLTransformations@expectedGptXmlOutput="MINIMAL_LEGACY_CSWCLIENT"
       *******************************************************************************************************-->
        <xsl:element name="csw:GetRecords" use-attribute-sets="GetRecordsAttributes" xmlns:csw="http://www.opengis.net/cat/csw/2.0.2" xmlns:ogc="http://www.opengis.net/ogc" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:gml="http://www.opengis.net/gml">
          <csw:Query typeNames="csw:Record">
            <csw:ElementSetName>full</csw:ElementSetName>
            <csw:Constraint version="1.0.0">
              <ogc:Filter xmlns="http://www.opengis.net/ogc">
                <ogc:And>
                  <!-- Key Word search -->
                  <xsl:apply-templates select="/GetRecords/KeyWord"/>
                  <!-- LiveDataOrMaps search -->
                  <xsl:apply-templates select="/GetRecords/LiveDataMap"/>
                  <!-- Envelope search, e.g. ogc:BBOX -->
                  <xsl:apply-templates select="/GetRecords/Envelope"/>
                  <!-- Date Range Search -->
                  <xsl:call-template name="tmpltDate"/>
                  <!-- DC Identifier -->
                  <ogc:Or>

                    <!-- Oregon Spatial Data Library -->

                        <ogc:PropertyIsEqualTo>
                          <!-- Oregon Wetlands Cover -->
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{E89EEF3F-ABD7-479E-BD10-A2036B15C64C}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                          <!-- Shoreline -->
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{F1126B88-0DE4-4D99-890F-E4E79BE5926F}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                           <!-- Oregon Ports -->
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{F9DB2A1A-BD6C-40B0-A9DB-FA0580E91311}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                          <!-- Oregon Port Names (test 2020_08_28 RDH) -->
                         <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                         <ogc:Literal>{3BCFD8E3-9718-443B-8DD0-AAA72061D6FC}</ogc:Literal>
                       </ogc:PropertyIsEqualTo>
                       <ogc:PropertyIsEqualTo>
                          <!-- Oregon Hydrography Water Courses- PNW Hydrography Framework -->
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{255311EF-9E1E-4E4C-8FF2-FD8EF7B2D527}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                          <!-- Oregon Hydrological Units - 1st - 7th Field -->
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{9DB6F7F2-945D-4FA8-8FAE-04634736C421}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                          <!-- State Parks -->
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{7454C1CB-51D8-40CA-ABF0-318E4FF5AAB9}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                          <!-- Framework/Imagery_Mosaic2009 (WMS) -->
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{B797B409-9E0F-4968-816D-2264B6A04DC6}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                          <!-- Framework/Imagery_Mosaic2005 (WMS) -->
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{06C5B4F0-F12A-4B8C-8AE6-E7FF04699062}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                          <!-- Stellar Sea Lion Critical Habitat -->
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{D34ED3C6-836E-40F5-90AA-B8086865760A}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                          <!-- Sandy Shoreine -->
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{294F6CD4-7806-452F-B6F4-F7B1DCC9ED46}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                           <!-- Rocky  Shoreine -->
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{5B6247C5-04B3-4180-9477-7F4149599C14}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                        <!-- Kelp Canopy -->
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{3FA88E3A-FCD2-4E29-8201-46B12E2156C8}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                        <!-- Groundfish Areas of PArticular Concern -->
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{B0B60C94-1F20-47A9-8901-ECA2AB8CB256}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                        <!-- Groundfish Areas of PArticular Concern Areas of Interest -->
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{0288B527-AA1A-4228-8502-ADFFA3D02B15}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                        <!--Boundary for Pacific Northwest Ecoregion -->
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{59320FDB-3F07-4467-94DE-E582B650C112}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                        <!-- Western Snowy Plover Critical Habitat -->
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{39102926-4D26-4C36-A3E0-DBAB11A78234}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>                                                                                                                                                                      <!--Pinniped Haulout -->
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{10D1A77F-9FC1-4463-A947-643231A7FF85}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                        <!-- Marine Gardens -->
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{37F9FB0D-FB8D-403C-82EA-AEF073DD5FA7}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                        <!--Leatherback Turtle Critical Habitat -->
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{7A97EC18-8699-42DF-8D28-EE13699AB466}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                        <!--Oregon Offshore Islands -->
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{9CA6FE73-7113-43F6-9F45-121DD93EB90E}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                        <!--Green Sturgeon Critical Habitat -->
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{B1924A9D-313A-42CC-A051-74DF91CE43A8}</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                        <ogc:PropertyIsEqualTo>
                        <!--Green Sturgeon Critical Habitat - Streams -->
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{6810E622-F4E3-4DCF-AF95-676A137CD264}</ogc:Literal>
                       </ogc:PropertyIsEqualTo>
                       <ogc:PropertyIsEqualTo>
                       <!--Green Sturgeon Critical Habitat - marine -->
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{6F3B5442-4BDC-4D5C-A384-F315A1513633}</ogc:Literal>
                       </ogc:PropertyIsEqualTo>
                       <ogc:PropertyIsEqualTo>
                       <!--Green Sturgeon Critical Habitat - head of tide -->
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{798056E5-55DC-4168-9C11-D680C656612E}</ogc:Literal>
                       </ogc:PropertyIsEqualTo>
                       <ogc:PropertyIsEqualTo>
                       <!--Green Sturgeon Critical Habitat - estuaries -->
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{03CB0A76-58B0-4F30-B288-1ACAF1043B9E}</ogc:Literal>
                       </ogc:PropertyIsEqualTo>
                       <ogc:PropertyIsEqualTo>
                       <!--Gray whale migration corridors -->
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{8A3680A4-E3BD-4538-ACAD-B46FEEA233C3}</ogc:Literal>
                       </ogc:PropertyIsEqualTo>
                       <ogc:PropertyIsEqualTo>
                       <!--Interannual Demersal Fish Variability -->
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{80AB38B4-3FE9-4FA1-9781-7FCEA87A15FA}</ogc:Literal>
                       </ogc:PropertyIsEqualTo>
                       <ogc:PropertyIsEqualTo>
                       <!-- EFH Conservation Areas -->
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{1A1CCF93-7FDF-4B0A-9194-E5C32B654893}</ogc:Literal>
                      </ogc:PropertyIsEqualTo>
                      <ogc:PropertyIsEqualTo>
                      <!-- Esturine Influence -->
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{26FC223B-713B-4C52-B7AD-E4E7586219B5}</ogc:Literal>
                      </ogc:PropertyIsEqualTo>
                      <ogc:PropertyIsEqualTo>
                      <!--Wave Energy PReliminary Permit -->
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{061F8C5D-82C0-4667-B5F0-4231949BE561}</ogc:Literal>
                      </ogc:PropertyIsEqualTo>
                      <ogc:PropertyIsEqualTo>
                      <!--Tsunami Evaculation Routes 2013 -->
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{2A536E89-E9EA-4B20-AC3A-C424A44C92D2}</ogc:Literal>
                      </ogc:PropertyIsEqualTo>

                    <!-- /Oregon Spatial Data Library -->

                    <!-- NCCOS Geospatial Portal -->
                    <!-- http://service.ncddc.noaa.gov/nccos/csw/discovery?Request=GetCapabilities&Service=CSW&Version=2.0.2 -->
                    <!-- http://service.ncddc.noaa.gov/nccos/catalog/main/home.page -->

                          <!-- NCCOS Assessment: Predictive Mapping of Seabirds, Pinnipeds and Cetaceans off the Pacific Coast of Washington from 1995-07-21 to 2015-12-08 (NCEI Accession 0148762) -->
                          <ogc:PropertyIsEqualTo>
                             <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                             <!-- <ogc:Literal>{EAF97774-2DE6-4E26-B456-61D7227703DF}</ogc:Literal> -->
                             <ogc:Literal>gov.noaa.nodc:0148762</ogc:Literal>
                          </ogc:PropertyIsEqualTo>
                          <!-- NCCOS Predictive Mapping of Seabirds, Pinnipeds, and Cetaceans: Washington Map Service -->
                          <ogc:PropertyIsEqualTo>
                             <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                             <ogc:Literal>{DA8AC4A3-6791-4FE2-A81F-DE6065285708}</ogc:Literal>
                          </ogc:PropertyIsEqualTo>
                          <!-- Blue whale at-sea density off California -->
                          <ogc:PropertyIsEqualTo>
                             <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                             <ogc:Literal>{BAD007BA-8B30-4F21-9DFD-76E5DBE251DE}</ogc:Literal>
                          </ogc:PropertyIsEqualTo>
                          <!-- NCCOS Assessment: Groundfish biodiversity hotspots off the Pacific Coast of Oregon from 1971-09-05 to 2010-09-20 (NCEI Accession 0156467) -->
                          <ogc:PropertyIsEqualTo>
                             <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                             <ogc:Literal>{B12F9B05-736C-49C4-B004-CEB10EA68F7F}</ogc:Literal>
                          </ogc:PropertyIsEqualTo>
                         <!-- Web Service for NCCOS Oregon Groundfish Biodiversity Hotspot Predictions-->
                          <ogc:PropertyIsEqualTo>
                             <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                             <ogc:Literal>{F1FD0390-3C56-4C1F-93D6-6BF8173B24B3}</ogc:Literal>
                          </ogc:PropertyIsEqualTo>

                    <!--/ NCCOS Geospatial Portal -->

                    <!-- EPA Data Exchange -->

                    <!-- Region 9 NPDES Outfalls 2012-->
                    <ogc:PropertyIsEqualTo>
                        <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                        <ogc:Literal>{C3FAC902-FE2C-4488-853D-61B80FCBFBA8}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Region 9 NPDES Facilities 2012-->
                         <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                         <ogc:Literal>{72A3824E-72DF-416D-9FA7-B28ED18A10F9}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <!-- Region 9 Coal Fired Power Plants -->
                    <ogc:PropertyIsEqualTo>
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{80083F7E-F83B-46D9-A6B6-495122E409F3}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <!-- Region 9 Superfund Sites -->
                    <ogc:PropertyIsEqualTo>
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{34A20A42-2191-4AEB-9215-2B291C1FA523}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <!-- Region 10 Superfund Sites -->
                     <ogc:PropertyIsEqualTo>
                            <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                            <ogc:Literal>{96EAA4CC-F9FB-4F5E-9ECF-17B2EC0AB04B}</ogc:Literal>
                     </ogc:PropertyIsEqualTo>
                     <!-- Region 10 Superfund Sites -->
                     <ogc:PropertyIsEqualTo>
                             <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                             <ogc:Literal>{4F627B7A-0727-4519-B988-885D837A2C1B}</ogc:Literal>
                      </ogc:PropertyIsEqualTo>
                        <!-- EPA Land Cover -->
                     <ogc:PropertyIsEqualTo>
                             <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                             <ogc:Literal>{235B12CF-9C83-47B8-B0BF-9AD89710F5C5}</ogc:Literal>
                     </ogc:PropertyIsEqualTo>

                    <!--/ EPA Data Exchange -->

                    <!-- OSU Active tectonics Lab -->
                    <!-- http://hornet.coas.oregonstate.edu:8080/geoportal/csw/discovery?request=GetCapabilities&service=CSW&version=2.0.2 -->
                    <!-- http://hornet.coas.oregonstate.edu:8080/geoportal/catalog/main/home.page -->

                    <ogc:PropertyIsEqualTo>
                    <!-- Physiographic -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{738A0937-3552-4C13-BF70-63F2C3679971}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Lithology -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{34984053-4171-4AB8-AC06-94416249BF56}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Induration -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{A3299765-3FE0-4421-8FDD-D2ABE8D1E3C6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Predicted Rock Outcrop -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{BCC6022C-6AF1-4FBF-863B-5670BB33783F}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Seabed Induration -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{A3299765-3FE0-4421-8FDD-D2ABE8D1E3C6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Seabed Induration-CA  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{82731A2C-5A22-4E87-8077-0B37DC5B2806}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Relative Intensity Bottom  12 Jun 2006 . 31 Dec 2010 -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{E6AC448C-E8DC-42D2-8644-13D9F29FE36A}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Spatial Extent Mid-Water Trawling 1 Jan 2002 . 11 Jun 2006  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{085A7656-F491-408C-A367-693B0A942A62}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Relative Intensity Mid-Water Trawling 1 Jan 2002 . 11 Jun 2006  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{E5F90177-CE10-455D-8318-5AC45DEF4918}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Spatial Extent  Commercial Mid-Water Trawling 12 Jun 2006 . 31 Dec 2010  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{43F97C1B-45DC-4499-BC02-589789D3299B}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Relative Intensity Commercial Mid-Water Trawling 12 Jun 2006 . 31 Dec 2010  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{ADFF8DAA-1B7F-4E4D-9BE0-7C7707E5C9CD}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Spatial Extent Commercial Fixed Gear 1 Jan 2002 . 11 Jun 2006  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{A1131846-393A-4BAD-A8D2-EB8E1742EC95}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Relative Intensity Commercial Fixed Gear 1 Jan 2002 . 11 Jun 2006  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{62DB698E-1709-458F-A3C9-0FBE3CC4C98A}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Spatial Extent Commercial Fixed Gear 12 Jun 2006 . 31 Dec 2010  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{3312A3C1-BB34-435A-9ACA-FF6671F12560}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Relative Intensity Commercial Fixed Gear 12 Jun 2006 . 31 Dec 2010  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{A5965588-59D5-44EA-A256-4ACBBB5617AF}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Spatial Extent Commercial Bottom Trawling 1 Jan 2002 . 11 Jun 2006  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{DEFF56E3-BA7B-4935-A540-919B9A12BADD}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Relative Intensity Commercial Bottom Trawling 1 Jan 2002 . 11 Jun 2006  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{38B4DA83-FD2E-43ED-A6DA-D492FFDE885D}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Spatial Extent Commercial Bottom Trawling 12 Jun 2006 . 31 Dec 2010  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{A2149702-3F1F-4959-AEF3-58D4EB1EB729}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>

                    <!--/ OSU Active tectonics Lab -->

                  </ogc:Or>
                </ogc:And>
              </ogc:Filter>
            </csw:Constraint>
          </csw:Query>
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
       <!-- ******************************************************************************************************
       When the full xml criteria is given then this section is executed.  This will be given by the geoportal
       Controlled by [Profiles.xml]/CSWProfiles/Profile/GetRecords/XSLTransformations@expectedGptXmlOutput="FULL_NATIVE_GPTXML"
       *******************************************************************************************************-->
        <xsl:element name="csw:GetRecords" use-attribute-sets="GetRecordsAttributes" xmlns:csw="http://www.opengis.net/cat/csw/2.0.2" xmlns:ogc="http://www.opengis.net/ogc" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:gml="http://www.opengis.net/gml">
          <csw:Query typeNames="csw:Record">
            <csw:ElementSetName>full</csw:ElementSetName>
            <csw:Constraint version="1.0.0">
              <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                <ogc:And>
                  <!-- Time Based Search -->
                  <xsl:call-template name="filterTemporal"/>
                  <!-- Key Word search -->
                  <xsl:call-template name="filterKeyword"/>
                  <!-- Content type search -->
                  <xsl:call-template name="filterContentTypes"/>
                  <!--  type search -->
                  <xsl:call-template name="filterThemeTypes"/>
                  <!-- Envelope search, e.g. ogc:BBOX -->
                  <xsl:call-template name="filterSpatial"/>
                </ogc:And>
              </ogc:Filter>
            </csw:Constraint>
            <xsl:call-template name="filterSort"/>
          </csw:Query>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- key word search -->
  <xsl:template match="/GetRecords/KeyWord" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:if test="normalize-space(.)!=''">
      <ogc:PropertyIsLike wildCard="" escape="" singleChar="">
        <ogc:PropertyName>AnyText</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="."/>
        </ogc:Literal>
      </ogc:PropertyIsLike>
    </xsl:if>
  </xsl:template>
  <!-- LiveDataOrMaps search -->
  <xsl:template match="/GetRecords/LiveDataMap" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:if test="translate(normalize-space(./text()),'true', 'TRUE') ='TRUE'">
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>dc:type</ogc:PropertyName>
        <ogc:Literal>liveData</ogc:Literal>
      </ogc:PropertyIsEqualTo>
    </xsl:if>
  </xsl:template>
  <!-- envelope search -->
  <xsl:template match="/GetRecords/Envelope" xmlns:ogc="http://www.opengis.net/ogc">
    <!-- generate BBOX query if minx, miny, maxx, maxy are provided -->
    <xsl:if test="./MinX and ./MinY and ./MaxX and ./MaxY">
      <xsl:choose>
        <xsl:when test="/GetRecords/RecordsFullyWithinEnvelope/text() = 'true'">

             <ogc:Within xmlns:gml="http://www.opengis.net/gml">
                <ogc:PropertyName>Geometry</ogc:PropertyName>
                <gml:Box srsName="http://www.opengis.net/gml/srs/epsg.xml#4326">
                  <gml:coordinates>
                    <xsl:value-of select="MinX"/>,<xsl:value-of select="MinY"/>,<xsl:value-of select="MaxX"/>,<xsl:value-of select="MaxY"/>
                  </gml:coordinates>
                </gml:Box>
             </ogc:Within>

        </xsl:when>
        <xsl:otherwise>
            <ogc:BBOX xmlns:gml="http://www.opengis.net/gml">
		        <ogc:PropertyName>Geometry</ogc:PropertyName>
		        <gml:Box srsName="http://www.opengis.net/gml/srs/epsg.xml#4326">
		          <gml:coordinates>
		            <xsl:value-of select="MinX"/>,<xsl:value-of select="MinY"/>,<xsl:value-of select="MaxX"/>,<xsl:value-of select="MaxY"/>
		          </gml:coordinates>
		        </gml:Box>
		     </ogc:BBOX>
        </xsl:otherwise>

      </xsl:choose>

    </xsl:if>
  </xsl:template>
  <xsl:template name="tmpltDate" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:if test="string-length(normalize-space(/GetRecords/FromDate/text())) &gt; 0">
      <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>Modified</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="substring-before(normalize-space(/GetRecords/FromDate/text()),'T')"/>
        </ogc:Literal>
      </ogc:PropertyIsGreaterThanOrEqualTo>
    </xsl:if>
    <xsl:if test="string-length(normalize-space(/GetRecords/ToDate/text())) &gt; 0">
      <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>Modified</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="substring-before(normalize-space(/GetRecords/ToDate/text()),'T')"/>
        </ogc:Literal>
      </ogc:PropertyIsLessThanOrEqualTo>
    </xsl:if>
  </xsl:template>
  <!-- ##########################################################################################################################
Utility Templates
 -->
  <!--  *******************************************************************************************************************************************************
Template   Tokenizes
WARNING: needs to be edited if you intend to use the templateName to call your template
@param sentence  The sentence to be tokenized
@param If you leave this out, the word will be printed instead. If you put in a new
templatename, edit the function to add it in the if statement
@param delimeter Delimeter to be used in the sentence.  Default is space character.
     ************************************************************************************************************************************************************* -->
  <xsl:template name="tokenize">
    <xsl:param name="sentence"/>
    <xsl:param name="templateName"/>
    <xsl:param name="delimeter" select="' '"/>
    <xsl:param name="word"/>
    <xsl:param name="info"/>
    <!--
         If word more than 0 and template then call template otherwise print word -->
    <xsl:choose>
      <xsl:when test="string-length($word) > 0 and string-length(normalize-space($templateName)) > 0">
        <xsl:choose>
          <!-- For this function,important to modify this section if you are using this function so that your template gets called -->
          <xsl:when test="$templateName = 'filterKeywordLikeAnytext'">
            <xsl:call-template name="filterKeywordLikeAnytext">
              <xsl:with-param name="word" select="$word"/>
              <xsl:with-param name="wildcard" select="$info"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName= 'filterThemeType' ">
            <xsl:call-template name="filterThemeType">
              <xsl:with-param name="theme" select="$word"/>
            </xsl:call-template>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="string-length($word) > 0">
        <xsl:value-of select="$word"/>
      </xsl:when>
    </xsl:choose>
    <!--
        If delimeter detected, curve sentence before and sentence after delimeter. -->
    <xsl:choose>
      <xsl:when test="contains($sentence, $delimeter)">
        <xsl:call-template name="tokenize">
          <xsl:with-param name="word" select="substring-before( $sentence,$delimeter)"/>
          <xsl:with-param name="sentence" select="substring-after( $sentence,$delimeter)"/>
          <xsl:with-param name="templateName" select="$templateName"/>
          <xsl:with-param name="delimeter" select="$delimeter"/>
          <xsl:with-param name="info" select="$info"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="string-length($sentence) > 0">
        <xsl:call-template name="tokenize">
          <xsl:with-param name="word" select="$sentence"/>
          <xsl:with-param name="templateName" select="$templateName"/>
          <xsl:with-param name="info" select="$info"/>
        </xsl:call-template>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <!-- ##########################################################################################################################
Filter: ContentType
 -->
  <xsl:template name="filterContentTypes" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="rootContentType" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterContentTypes']"/>
    <xsl:variable name="contentType" select="normalize-space($rootContentType/param[@name='selectedContentType']/@value)"/>
    <xsl:if test="string-length(normalize-space($contentType)) > 0">
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>Format</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="$contentType"/>
        </ogc:Literal>
      </ogc:PropertyIsEqualTo>
    </xsl:if>
  </xsl:template>
  <!-- ##########################################################################################################################
Filter: ThemeType
 -->
  <xsl:template name="filterThemeType" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:param name="theme"/>
    <xsl:param name="lTheme" select="normalize-space($theme)"/>
    <xsl:if test="string-length($lTheme) > 0">
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>Subject</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="$lTheme"/>
        </ogc:Literal>
      </ogc:PropertyIsEqualTo>
    </xsl:if>
  </xsl:template>
  <!--
Entry point for theme types
-->
  <xsl:template name="filterThemeTypes" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="rootThemeTypes" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterThemeTypes']"/>
    <xsl:variable name="themeTypes" select="$rootThemeTypes/param[@name='theme']/@value"/>
    <xsl:if test="string-length($themeTypes) > 0">
      <ogc:Or>
        <xsl:call-template name="tokenize">
          <xsl:with-param name="sentence" select="$themeTypes"/>
          <xsl:with-param name="templateName" select="'filterThemeType'"/>
          <xsl:with-param name="delimeter" select="'|'"/>
        </xsl:call-template>
      </ogc:Or>
    </xsl:if>
  </xsl:template>
  <!-- ##########################################################################################################################
Filter: keyword Filter templates
 -->
  <!-- *******************************************************************************************************************************************************
Template  filterKeywordLikeAnytext
Prints the text to be
@param word  Word to be searched for
 ************************************************************************************************************************************************************* -->
  <xsl:template name="filterKeywordLikeAnytext" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:param name="word"/>
    <xsl:param name="wildcard"/>
    <xsl:if test="string-length(normalize-space($word)) > 0">
      <ogc:PropertyIsLike>
        <xsl:attribute name="wildCard"><xsl:value-of select="$searchTextWildCardCharacter"/></xsl:attribute>
        <xsl:attribute name="escape"><xsl:value-of select="$searchTextEscapeCharacter"/></xsl:attribute>
        <xsl:attribute name="singleChar"><xsl:value-of select="$searchTextSingleCharacter"/></xsl:attribute>
        <ogc:PropertyName>AnyText</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="$wildcard"/>
          <xsl:value-of select="normalize-space($word)"/>
          <xsl:value-of select="$wildcard"/>
        </ogc:Literal>
      </ogc:PropertyIsLike>
    </xsl:if>
  </xsl:template>
  <!-- *******************************************************************************************************************************************************
Template  filterKeyword
@param word  Word to be searched for
 ************************************************************************************************************************************************************* -->
  <xsl:template name="filterKeyword" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="rootFilterKeyword" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterKeyword']"/>
    <xsl:variable name="keyword" select="normalize-space($rootFilterKeyword/param[@name='SearchText']/@value)"/>
    <xsl:variable name="keywordOperation" select="normalize-space($rootFilterKeyword/param[@name='SearchTextOption']/@value)"/>
    <xsl:choose>
      <xsl:when test="not(contains($keyword, ' ')) or translate($keywordOperation, 'exact', 'EXACT') = 'EXACT'">
        <xsl:call-template name="filterKeywordLikeAnytext">
          <xsl:with-param name="word" select="$keyword"/>
          <!-- xsl:with-param name="wildcard" select="$searchTextWildCardCharacter" -->
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="translate($keywordOperation, 'any', 'ANY') = 'ANY'">
        <ogc:Or>
          <xsl:call-template name="tokenize">
            <xsl:with-param name="sentence" select="$keyword"/>
            <xsl:with-param name="templateName" select="'filterKeywordLikeAnytext'"/>
            <!-- ><xsl:with-param name="info" select="$searchTextWildCardCharacter"/> -->
          </xsl:call-template>
        </ogc:Or>
      </xsl:when>
      <xsl:when test="translate($keywordOperation, 'all', 'ALL') = 'ALL'">
        <ogc:And>
          <xsl:call-template name="tokenize">
            <xsl:with-param name="sentence" select="$keyword"/>
            <xsl:with-param name="templateName" select="'filterKeywordLikeAnytext'"/>
          </xsl:call-template>
        </ogc:And>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <!-- envelope search -->
  <!-- ##########################################################################################################################
Filter: Spatial Filter templates
 -->
  <!-- ***********************************************************************************************************************************************************************************
Template filterSpatial
Outputs the within or interesects of the bounding box
@gptSpatialValues root of spatial nodes
************************************************************************************************************************************************************************************** -->
  <xsl:template name="filterSpatial" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="gptSpatialValues" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterSpatial']"/>
    <xsl:if test="$gptSpatialValues/param[@name='selectedBoundOption']/@value = 'useGeogExtent'">
      <ogc:BBOX>
        <xsl:call-template name="filterSpatialBBox">
          <xsl:with-param name="gptSpatialValues" select="$gptSpatialValues"/>
        </xsl:call-template>
      </ogc:BBOX>
    </xsl:if>
    <xsl:if test="$gptSpatialValues/param[@name='selectedBoundOption']/@value = 'dataWithinExtent'">
      <ogc:Within>
        <xsl:call-template name="filterSpatialBBox">
          <xsl:with-param name="gptSpatialValues" select="$gptSpatialValues"/>
        </xsl:call-template>
      </ogc:Within>
    </xsl:if>
  </xsl:template>
  <!-- ***********************************************************************************************************************************************************************************
Template filterSpatialBBox
Outputs the bounding box
@gptSpatialValues root of spatial nodes
************************************************************************************************************************************************************************************** -->
  <xsl:template name="filterSpatialBBox" xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml">
    <xsl:param name="gptSpatialValues"/>
    <ogc:PropertyName>Geometry</ogc:PropertyName>
    <gml:Box>
      <xsl:attribute name="srsName"><xsl:value-of select="$gmlBoxSrsName"/></xsl:attribute>
      <!-- <gml:coordinates>-180,-90,-100,90</gml:coordinates> -->
      <!--  TODO Test &  get values from xpath -->
      <gml:coordinates>
        <xsl:value-of select="$gptSpatialValues/param[@name='minX']/@value"/>,<xsl:value-of select="$gptSpatialValues/param[@name='minY']/@value"/>,<xsl:value-of select="$gptSpatialValues/param[@name='maxX']/@value"/>,<xsl:value-of select="$gptSpatialValues/param[@name='maxY']/@value"/>
      </gml:coordinates>
    </gml:Box>
  </xsl:template>
  <!-- ##########################################################################################################################
Filter: Temporal Filter templates
 -->
  <!-- ***********************************************************************************************************************************************************************************
Template filterTemporal
Outputs CSW time parameters
************************************************************************************************************************************************************************************** -->
  <xsl:template name="filterTemporal" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="rootTemporal" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterTemporal']"/>
    <xsl:variable name="modifiedFrom" select="normalize-space($rootTemporal/param[@name='modifiedDateFrom']/@value)"/>
    <xsl:variable name="modifiedTo" select="normalize-space($rootTemporal/param[@name='modifiedDateTo']/@value)"/>
    <xsl:variable name="temporalOption" select="normalize-space($rootTemporal/param[@name='selectedModifiedTime']/@value)"/>
    <xsl:if test="string-length($modifiedFrom) > 0">
      <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>Modified</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="$modifiedFrom"/>
        </ogc:Literal>
      </ogc:PropertyIsGreaterThanOrEqualTo>
    </xsl:if>
    <xsl:if test="string-length($modifiedTo) > 0">
      <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>Modified</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="$modifiedTo"/>
        </ogc:Literal>
      </ogc:PropertyIsLessThanOrEqualTo>
    </xsl:if>
  </xsl:template>
  <!-- ##########################################################################################################################
Filter: Sort Filter templates
 -->
  <!-- ***********************************************************************************************************************************************************************************
Template filterTemporal
Outputs CSW sorting parameters
************************************************************************************************************************************************************************************** -->
  <xsl:template name="filterSort" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="root" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterSort']"/>
    <xsl:variable name="sortValue" select="normalize-space($root/param[@name='selectedSort']/@value)"/>
    <xsl:if test="string-length($sortValue) > 0">
      <xsl:if test="$sortValue != 'relevance'">
        <ogc:SortBy>
          <ogc:SortProperty>
            <ogc:PropertyName>
              <xsl:choose>
                <xsl:when test="$sortValue = 'areaAscending' or $sortValue = 'areaDescending' ">
                  <xsl:text>envelope</xsl:text>
                </xsl:when>
                <xsl:when test="$sortValue = 'dateAscending' or $sortValue = 'dateDescending' ">
                  <xsl:text>Modified</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$sortValue"/>
                </xsl:otherwise>
              </xsl:choose>
            </ogc:PropertyName>
            <xsl:choose>
              <xsl:when test="$sortValue = 'areaAscending' or $sortValue = 'dateAscending'">
                <ogc:SortOrder>ASC</ogc:SortOrder>
              </xsl:when>
              <xsl:when test="$sortValue = 'areaDescending' or $sortValue = 'dateDescending'">
                <ogc:SortOrder>DESC</ogc:SortOrder>
              </xsl:when>
            </xsl:choose>
          </ogc:SortProperty>
        </ogc:SortBy>
      </xsl:if>
    </xsl:if>
  </xsl:template>
  <xsl:attribute-set name="GetRecordsAttributes">
    <xsl:attribute name="version">2.0.2</xsl:attribute>
    <xsl:attribute name="service">CSW</xsl:attribute>
    <xsl:attribute name="resultType">
      <xsl:choose>
        <xsl:when test="translate($searchQueryDoHitsOnly,'TRUE', 'true')  = 'true' or $searchQueryDoHitsOnly = '1'">HITS</xsl:when>
        <xsl:otherwise>RESULTS</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="startPosition"><xsl:value-of select="/GetRecords/StartPosition"/></xsl:attribute>
    <xsl:attribute name="maxRecords"><xsl:value-of select="/GetRecords/MaxRecords"/></xsl:attribute>
  </xsl:attribute-set>
</xsl:stylesheet>
