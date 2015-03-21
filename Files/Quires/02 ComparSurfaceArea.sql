-- What is the "surface area" of an object type "Reservoir" within a boundary of lat. and long. ? 
--Copy (


SELECT "CVs"."CommonAttributes"."CommonAttributeName","NativeAttributeName",

"UnitName",
"Storage"."Parameters"."ParameterValue",
"Core"."DataStructures"."DataStructureName"
--"CommonObjectType",
--"MasterNetworkName",
-- "NativeObjectName",
--,"Instances"."InstanceName",
FROM "Core"."DataStructures"

Left JOIN "Core"."ObjectTypes" 
ON "Core"."ObjectTypes"."DataStructureID"="Core"."DataStructures"."DataStructureID"

Left JOIN "CVs"."CommonObjectTypes" 
ON "CVs"."CommonObjectTypes"."CommonObjectTypeID"="Core"."ObjectTypes"."CommonObjectTypeID"

Left JOIN "CVs"."CommonObjectCategory" 
ON "CVs"."CommonObjectCategory"."CommonObjectCategoryID"="CVs"."CommonObjectTypes"."CommonObjectCategoryID"

Left JOIN "Metadata"."NativeObjectCategory" 
ON "Metadata"."NativeObjectCategory"."NativeObjectCategoryID"="Core"."ObjectTypes"."NativeObjectCategoryID"

Left JOIN  "Core"."ObjectAttributes"
ON "Core"."ObjectAttributes"."ObjectTypeID"="Core"."ObjectTypes"."ObjectTypeID"

Left JOIN  "Core"."Attributes"
ON "Core"."Attributes"."AttributeID"="Core"."ObjectAttributes"."AttributeID"

Left JOIN  "CVs"."CommonAttributes"
ON "CVs"."CommonAttributes"."CommonAttributeID"="Core"."Attributes"."CommonAttributeID"

Left JOIN  "CVs"."CommonAttributeCategory"
ON "CVs"."CommonAttributeCategory"."CommonAttributeCategoryID"="CVs"."CommonAttributes"."CommonAttributeCategoryID"

Left JOIN "CVs"."Units" 
ON "CVs"."Units"."UnitID"="Core"."Attributes"."UnitID"

Left JOIN "Core"."MetadataMapping"
ON "Core"."MetadataMapping"."ObjectAttributeID"="ObjectAttributes"."ObjectAttributeID"

Left JOIN "Core"."DataStorage" 
ON "Core"."DataStorage"."DataStorageID"="MetadataMapping"."DataStorageID"

JOIN "Core"."SceanrioMetadata"
ON "Core"."SceanrioMetadata"."MetadataMappingID"="Core"."MetadataMapping"."MetadataMappingID"

Left JOIN "Core"."Scenarios" 
ON "Core"."Scenarios"."ScenarioID"="Core"."SceanrioMetadata"."ScenarioID"

Left JOIN "Core"."MasterNetworks" 
ON "Core"."MasterNetworks"."MasterNetworkID"="Scenarios"."ScenarioID"

Left JOIN "Metadata"."Methods" 
ON "Metadata"."Methods"."MethodID"="MetadataMapping"."MethodID"

Left JOIN "Metadata"."Sources" 
ON "Metadata"."Sources"."SourceID"="MetadataMapping"."SourceID"

Left JOIN "Storage"."Parameters" 
ON "Storage"."Parameters"."DataStorageID"="Core"."DataStorage"."DataStorageID"

Left JOIN "Storage"."FreeText" 
ON "FreeText"."DataStorageID"="Core"."DataStorage"."DataStorageID"

Left JOIN "Storage"."ControlledText" 
ON "Storage"."ControlledText"."DataStorageID"="Core"."DataStorage"."DataStorageID"

Left JOIN "CVs"."ControlledTextValues" 
ON "ControlledTextValues"."ControlledTextValueID"="ControlledText"."ControlledTextValueID"

Left JOIN "Core"."Instances" 
ON "Core"."Instances"."InstanceID"="Core"."MetadataMapping"."InstanceID"

WHERE  "Core"."Instances"."InstanceName"='Hyrum (10)' AND "CVs"."CommonAttributes"."CommonAttributeName"='surafce area' AND "ScenarioName"!='Proposed'
OR "Core"."Instances"."InstanceName"='Hyrum Reservoir' AND "CVs"."CommonAttributes"."CommonAttributeName"='surafce area'
OR "Core"."Instances"."InstanceName"='HYRUM'AND "CVs"."CommonAttributes"."CommonAttributeName"='surafce area'




--) To 'C:\AdelAbdallah\PhD\CI-Water\WaM-DaM\Design Specifications 2014\ImportAutoma\QueryOutput\FindSurfaceAreaReservoir2.CSV' With CSV;