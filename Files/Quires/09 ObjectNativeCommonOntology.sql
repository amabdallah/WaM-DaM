-- General Query across the database 

--Copy(

SELECT DISTINCT "Core"."DataStructures"."DataStructureName","NativeObjectCategoryName",
"Core"."ObjectTypes"."NativeObjectName","CommonObjectType","CVs"."CommonObjectCategory"."CommonObjectCategoryName","ParentCommonObjectCategory1"."CommonObjectCategoryName" As "Parent1CommonCatName","ParentCommonObjectCategory2"."CommonObjectCategoryName"
As "Parent2CommonCatName"


--,"Core"."MetadataMapping"."MetadataMappingID"

FROM "Core"."DataStructures"

Left JOIN "Core"."ObjectTypes" 
ON "Core"."ObjectTypes"."DataStructureID"="Core"."DataStructures"."DataStructureID"

Left JOIN "CVs"."CommonObjectTypes" 
ON "CVs"."CommonObjectTypes"."CommonObjectTypeID"="Core"."ObjectTypes"."CommonObjectTypeID"

Left JOIN "CVs"."CommonObjectCategory" 
ON "CVs"."CommonObjectCategory"."CommonObjectCategoryID"="CVs"."CommonObjectTypes"."CommonObjectCategoryID"

Left JOIN "CVs"."CommonObjectCategory" AS "ParentCommonObjectCategory1" 
ON "ParentCommonObjectCategory1"."CommonObjectCategoryID"="CVs"."CommonObjectCategory"."ParentCommonObjectCategoryID"

Left JOIN "CVs"."CommonObjectCategory" AS "ParentCommonObjectCategory2" 
ON "ParentCommonObjectCategory2"."CommonObjectCategoryID"="ParentCommonObjectCategory1"."ParentCommonObjectCategoryID"


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
WHERE  "Core"."DataStructures"."DataStructureName"='WEAP' AND 
("NativeObjectName"='Reservoir' OR 
"NativeObjectName"='local reservoir' OR
"NativeObjectName"='River' 
)



