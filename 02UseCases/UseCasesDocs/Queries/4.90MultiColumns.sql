﻿-- 4.90 MultiColumns

/*
This query shows data values for a particular MultiColumns of a reservoir elevation with surface area, and storage 
its attributes, units, object names, and instances, and data source 

Result:
Users can import these data columns to their model 
WaM-DaM keeps track of the meanings of data values, their units, to what instance they apply too.... 
*/

SELECT "ObjectTypes"."NativeObjectName",
"Instances"."InstanceName","Attributes"."NativeAttributeName","Mapping"."AttributeTypeCodeCV",
"AttributesColumns"."NativeAttributeName" AS "ColumName",
"MetadataColumns"."AttributeTypeCodeCV",
"ColumnsUnits"."UnitName" AS "ColUnitName",
"Value","ValueOrder"

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

JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"
AND "Attributes"."NativeAttributeName"='Volume Elevation Curve'

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

Left JOIN "ScenarioMapping"
ON "ScenarioMapping"."MappingID"="Mapping"."MappingID"

JOIN "Scenarios"
ON "Scenarios"."ScenarioID"="ScenarioMapping"."ScenarioID"
AND "Scenarios"."ScenarioName"='BaseCaseLower'

Left JOIN "MasterNetworks" 
ON "MasterNetworks"."MasterNetworkID"="Scenarios"."ScenarioID"

Left JOIN "Methods" 
ON "Methods"."MethodID"="Mapping"."MethodID"

Left JOIN "Sources" 
ON "Sources"."SourceID"="Mapping"."SourceID"

Left JOIN "MultiColumnArray"  
ON "MultiColumnArray" ."DataStorageID"="DataStorage"."DataStorageID"


/*This is extra join to get the column names */


Left JOIN "DataStorage" As "StorageColumns"
ON "StorageColumns"."DataStorageID"="MultiColumnArray"."ColumnNameID"

Left JOIN "Mapping" As "MetadataColumns"
ON "MetadataColumns"."DataStorageID"="StorageColumns"."DataStorageID"

Left JOIN  "ObjectAttributes" As "ObjAttColumns"
ON "ObjAttColumns"."ObjectAttributeID"="MetadataColumns"."ObjectAttributeID"

Left JOIN  "Attributes" AS "AttributesColumns"
ON "AttributesColumns"."AttributeID"="ObjAttColumns"."AttributeID"

Left JOIN "Units" As "ColumnsUnits"
ON "ColumnsUnits"."UnitID"="AttributesColumns"."UnitID"

/* Finishes here */


Left JOIN "MultiColumnValues"
ON "MultiColumnValues"."MultiColumnID"="MultiColumnArray"."MultiColumnID"

Left JOIN "Instances" 
ON "Instances"."InstanceID"="Mapping"."InstanceID"

WHERE "Instances"."InstanceName"='Hyrum (10)' 

Order By ColumName asc

-- how to join the three attributes along one line 