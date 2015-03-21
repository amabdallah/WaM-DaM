
SELECT "Core"."ObjectTypes"."NativeObjectName",
"Instances"."InstanceName","Core"."Attributes"."NativeAttributeName","Core"."MetadataMapping"."AttributeTypeCodeCV",
"AttributesColumns"."NativeAttributeName" AS "ColumName",
"MetadataColumns"."AttributeTypeCodeCV",
"ColumnsUnits"."UnitName" AS "ColUnitName",
"Value","ValueOrder"

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

JOIN  "Core"."Attributes"
ON "Core"."Attributes"."AttributeID"="Core"."ObjectAttributes"."AttributeID"
AND "Core"."Attributes"."NativeAttributeName"='Volume Elevation Curve'

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

Left JOIN "Core"."SceanrioMetadata"
ON "Core"."SceanrioMetadata"."MetadataMappingID"="Core"."MetadataMapping"."MetadataMappingID"

JOIN "Core"."Scenarios"
ON "Core"."Scenarios"."ScenarioID"="Core"."SceanrioMetadata"."ScenarioID"
AND "Core"."Scenarios"."ScenarioName"='BaseCaseLower'

Left JOIN "Core"."MasterNetworks" 
ON "Core"."MasterNetworks"."MasterNetworkID"="Scenarios"."ScenarioID"

Left JOIN "Metadata"."Methods" 
ON "Metadata"."Methods"."MethodID"="MetadataMapping"."MethodID"

Left JOIN "Metadata"."Sources" 
ON "Metadata"."Sources"."SourceID"="MetadataMapping"."SourceID"

Left JOIN "Storage"."MultiColumnArray"  
ON "Storage"."MultiColumnArray" ."DataStorageID"="Core"."DataStorage"."DataStorageID"


/*This is extra join to get the column names */


Left JOIN "Core"."DataStorage" As "StorageColumns"
ON "StorageColumns"."DataStorageID"="Storage"."MultiColumnArray"."ColumnNameID"

Left JOIN "Core"."MetadataMapping" As "MetadataColumns"
ON "MetadataColumns"."DataStorageID"="StorageColumns"."DataStorageID"

Left JOIN  "Core"."ObjectAttributes" As "ObjAttColumns"
ON "ObjAttColumns"."ObjectAttributeID"="MetadataColumns"."ObjectAttributeID"

Left JOIN  "Core"."Attributes" AS "AttributesColumns"
ON "AttributesColumns"."AttributeID"="ObjAttColumns"."AttributeID"

Left JOIN "CVs"."Units" As "ColumnsUnits"
ON "ColumnsUnits"."UnitID"="AttributesColumns"."UnitID"

/* Finishes here */


Left JOIN "Storage"."MultiColumnValues"
ON "Storage"."MultiColumnValues"."MultiColumnID"="Storage"."MultiColumnArray"."MultiColumnID"

Left JOIN "Core"."Instances" 
ON "Core"."Instances"."InstanceID"="Core"."MetadataMapping"."InstanceID"

WHERE "Core"."Instances"."InstanceName"='Hyrum (10)' 

-- how to join the three attributes along one line 