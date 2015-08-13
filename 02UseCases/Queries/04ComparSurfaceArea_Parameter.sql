/*
Use case #4: What are the data value(s) of an attribute of a system component?


This query discovers and compares 
The search is based on a boundary of coordinates for instances in the upper Bear River Watershed. 
Users need to only change these coordinates to discover data in other regions 


Result:
Users can see the number of available instances and attributes for object types that WEAP requires. 
They can see the sources of each Object types and the native name in its original source along with the 
controlled or common name. 

Users can further search for more metadata and data about these instances. 
Then they can choose which ones to import to their model 

*/

-- What is the "surface area" of an object type "Reservoir" within a boundary of lat. and long. ? 
--Copy (


SELECT "CommonAttributes"."CommonAttributeName","NativeAttributeName",

"UnitName",
"Parameters"."ParameterValue",
"DataStructures"."DataStructureName"
--"CommonObjectType",
--"MasterNetworkName",
-- "NativeObjectName",
--,"Instances"."InstanceName",
FROM "DataStructures"

Left JOIN "ObjectTypes" 
ON "ObjectTypes"."DataStructureID"="DataStructures"."DataStructureID"

Left JOIN "CommonObjectTypes" 
ON "CommonObjectTypes"."CommonObjectTypeID"="ObjectTypes"."CommonObjectTypeID"

Left JOIN "CommonObjectCategory" 
ON "CommonObjectCategory"."CommonObjectCategoryID"="CommonObjectTypes"."CommonObjectCategoryID"

Left JOIN "NativeObjectCategory" 
ON "NativeObjectCategory"."NativeObjectCategoryID"="ObjectTypes"."NativeObjectCategoryID"

Left JOIN  "ObjectAttributes"
ON "ObjectAttributes"."ObjectTypeID"="ObjectTypes"."ObjectTypeID"

Left JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"

Left JOIN  "CommonAttributes"
ON "CommonAttributes"."CommonAttributeID"="Attributes"."CommonAttributeID"

Left JOIN  "CommonAttributeCategory"
ON "CommonAttributeCategory"."CommonAttributeCategoryID"="CommonAttributes"."CommonAttributeCategoryID"

Left JOIN "Units" 
ON "Units"."UnitID"="Attributes"."UnitID"

Left JOIN "Mapping"
ON "Mapping"."ObjectAttributeID"="ObjectAttributes"."ObjectAttributeID"

Left JOIN "DataStorage" 
ON "DataStorage"."DataStorageID"="Mapping"."DataStorageID"

JOIN "ScenarioMapping"
ON "ScenarioMapping"."MetadataMappingID"="Mapping"."MetadataMappingID"

Left JOIN "Scenarios" 
ON "Scenarios"."ScenarioID"="ScenarioMapping"."ScenarioID"

Left JOIN "MasterNetworks" 
ON "MasterNetworks"."MasterNetworkID"="Scenarios"."ScenarioID"

Left JOIN "Methods" 
ON "Methods"."MethodID"="Mapping"."MethodID"

Left JOIN "Sources" 
ON "Sources"."SourceID"="Mapping"."SourceID"

Left JOIN "Parameters" 
ON "Parameters"."DataStorageID"="DataStorage"."DataStorageID"

Left JOIN "TextFree" 
ON "TextFree"."DataStorageID"="DataStorage"."DataStorageID"

Left JOIN "TextControlled" 
ON "TextControlled"."DataStorageID"="DataStorage"."DataStorageID"

Left JOIN "TextControlledValues" 
ON "TextControlledValues"."TextControlledValueID"="TextControlled"."TextControlledValueID"

Left JOIN "Instances" 
ON "Instances"."InstanceID"="Mapping"."InstanceID"

WHERE  "Instances"."InstanceName"='Hyrum (10)' AND "CommonAttributes"."CommonAttributeName"='surafce area' AND "ScenarioName"!='Proposed'
OR "Instances"."InstanceName"='Hyrum Reservoir' AND "CommonAttributes"."CommonAttributeName"='surafce area'
OR "Instances"."InstanceName"='HYRUM'AND "CommonAttributes"."CommonAttributeName"='surafce area'




--) To 'C:\AdelAbdallah\PhD\CI-Water\WaM-DaM\Design Specifications 2014\ImportAutoma\QueryOutput\FindSurfaceAreaReservoir2.CSV' With CSV;