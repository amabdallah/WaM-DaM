### Controlled vocabularies

Controlled vocabularies (CVs) are terms that are adopted with clear definitions to enforce the use of consistent terminology for data fields across disciplines. In WaM-DaM, names of attributes and objects are controlled to maintain consistency across multidisciplinary data and users

#### CVS on WaM-DaM's Core Strucutre 

##### DataStructureDomain
A <a href="http://amabdallah.github.io/WaM-DaM/tables/CVs_DataStructureDomain.html" target="_blank">data structure domain</a>
helps user discover data structures that share a common domain (e.g., water supply, wastewater collection, storm water)	


##### CommonObjectTypes
A <a href="http://amabdallah.github.io/WaM-DaM/tables/CVs_CommonObjectTypes.html" target="_blank">CommonObjectTypes</a>
are controlled vocabulary for Object types like Reservoir which maps out to native object types like dam, reservoir, and waterbody	

##### CommonObjectCategory
A <a href="http://amabdallah.github.io/WaM-DaM/tables/CVs_CommonObjectTypes.html" target="_blank">CommonObjectCategory</a> Controlled vocabulary for objects common object types to organize them into hierarchal categories like supply and demand categories	

##### CommonAttributes
A <a href="http://amabdallah.github.io/WaM-DaM/tables/CVs_CommonObjectTypes.html" target="_blank">CommonAttributes</a> Controlled vocabulary for attributes like Volume which maps out to native attributes like capacity, vol, and storage		

##### CommonAttributeCategory
A <a href="http://amabdallah.github.io/WaM-DaM/tables/CVs_CommonObjectTypes.html" target="_blank">CommonAttributeCategory	</a> Controlled vocabulary for common attributes to organize them into hierarchal categories like Hydropower categories

##### Units
A <a href="http://amabdallah.github.io/WaM-DaM/tables/CVs_Units.html" target="_blank">unit </a>
refers to the dimension of data values of a quantitative attribute, help users unambiguously interpret the meaning of data values. Qualitative attributes like a “dam owner name” have no unit. The Units table applies to the Attributes table in WaM-DaM Core and enforces the same unit for all attributes across the instances of an Object to meet the consistency of units in particular Data Structure as used in modeling.	

##### InstanceStatus
A <a href="http://amabdallah.github.io/WaM-DaM/tables/CVs_InstanceStatus.html" target="_blank">Instance Status </a> is a controlled vocabulary (e.g., existing, proposed, past existed, and planned).	


##### VerticalDatum	
A <a href="http://amabdallah.github.io/WaM-DaM/tables/CVs_VerticalDatum.html" target="_blank">Vertical Datum </a>
(e.g., above sea mean level) to reference all the instances that belong to the same Master Network	

##### SpatialReference
A <a href="http://amabdallah.github.io/WaM-DaM/tables/CVs_SpatialReference.html" target="_blank">SpatialReference </a>
A spatial reference (e.g., NAD 1983) to reference all the instances that belong to the same Master Network	

##### AttributeTypeCode
 <a href="http://amabdallah.github.io/WaM-DaM/tables/CVs_AttributeTypeCode.html" target="_blank">An Attribute Type Code </a> is like binary (B), parameters (P), seasonal parameter (SP), free text (TF), controlled text (CT), file based (FB), Rule (R), time series (TS), and multi-column array (MC)	

#### CV on WaM-DaM's Metadata

#### OrganizationType
<a href="http://amabdallah.github.io/WaM-DaM/tables/CVs_OrganizationType.html" target="_blank">Organization Type</a> is like academic and government agency	

#### MethodType
<a href="http://amabdallah.github.io/WaM-DaM/tables/CVs_MethodType.html" target="_blank">Method Type</a> 
is a controlled vocabulary term that can be like sample, simulation, optimization, or field procedure. The method type corresponds to “value type” attribute in the Observations Data Model	

### CV on WaM-DaM's Data Storage

#### BinaryValueMeaning
This table stores binary data values of either zero or one to direct users to only populate binary values to represent water management operations that has duel values.	


#### SeasonName
Controlled vocabulary for seasons (e.g., winter and day, night, holiday, weekend, week days)	


#### TextControlledValues
Controlled text values that can be shared across attributes of instances like Land use “Grass_Pasture” or irrigation type "Flood”, states "Utah"	


#### FileFormat
Controlled text for file formats like csv, shp, dss, ndf, NetCDF, ini, gsm, db, .xy, .mdb, XML, PDF, .rdf, HDB	


#### Symbols
Controlled vocabulary for arithmetic and equations symbols like +, -, *, (, ) , [, ], ^ to be used to formulate a function	


#### AggregationStatistic
CV term for the statistic that is performed over a time Support interval for time series values (e.g., cumulative, average, maximum)	

