-- General Query across the database 
-- What other attribute data are available for Hyrum Reservoir?


SELECT "Core"."DataStructures"."DataStructureName","Core"."ObjectTypes"."NativeObjectName","NativeAttributeName","UnitName","AttributeTypeCodeCV",concat("ParameterValue","ControlledTextValue")As "DataValue","ValueDefinition"

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

Left JOIN "Storage"."Parameters" 
ON "Storage"."Parameters"."DataStorageID"="Core"."DataStorage"."DataStorageID"

Left JOIN "Storage"."ControlledText" 
ON "Storage"."ControlledText"."DataStorageID"="Core"."DataStorage"."DataStorageID"

Left JOIN "CVs"."ControlledTextValues" 
ON "CVs"."ControlledTextValues"."ControlledTextValueID"="ControlledText"."ControlledTextValueID"


Left JOIN "Core"."Instances" 
ON "Core"."Instances"."InstanceID"="Core"."MetadataMapping"."InstanceID"

WHERE ("Core"."Instances"."InstanceName"='Hyrum (10)' OR "Core"."Instances"."InstanceName"='Hyrum Reservoir' OR "Core"."Instances"."InstanceName"='HYRUM') AND 
("NativeAttributeName"='BOD Concentration' OR
"NativeAttributeName"='Hydropower Priority' OR
"NativeAttributeName"='HAZARD' OR
"NativeAttributeName"='DAM_TYPE' OR
"NativeAttributeName"='Region' OR
"NativeAttributeName"='State'OR
"NativeAttributeName"='MAX_STOR' OR
"NativeAttributeName"='Storage Capacity' OR
"NativeAttributeName"='Volume Elevation Curve' ) 



ORDER BY "DataStructureName"