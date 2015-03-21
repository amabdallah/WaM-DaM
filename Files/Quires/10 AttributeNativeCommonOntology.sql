-- General Query across the database 

--Copy(

SELECT DISTINCT "Core"."DataStructures"."DataStructureName","NativeObjectName","NativeAttributeCategoryName",
"Core"."Attributes"."NativeAttributeName","CVs"."CommonAttributeCategory"."CommonAttributeCategoryName"

FROM "Core"."DataStructures"

Left JOIN "Core"."ObjectTypes" 
ON "Core"."ObjectTypes"."DataStructureID"="Core"."DataStructures"."DataStructureID"

Left JOIN  "Core"."ObjectAttributes"
ON "Core"."ObjectAttributes"."ObjectTypeID"="Core"."ObjectTypes"."ObjectTypeID"

 JOIN  "Metadata"."NativeAttributeCategory"
ON "Metadata"."NativeAttributeCategory"."NativeAttributeCategoryID"="Core"."ObjectAttributes"."NativeAttributeCategoryID"

Left JOIN  "Core"."Attributes"
ON "Core"."Attributes"."AttributeID"="Core"."ObjectAttributes"."AttributeID"

Left JOIN  "CVs"."CommonAttributes"
ON "CVs"."CommonAttributes"."CommonAttributeID"="Core"."Attributes"."CommonAttributeID"

Left JOIN  "CVs"."CommonAttributeCategory"
ON "CVs"."CommonAttributeCategory"."CommonAttributeCategoryID"="CVs"."CommonAttributes"."CommonAttributeCategoryID"

WHERE  "Core"."DataStructures"."DataStructureName"='WEAP' AND 
("NativeObjectName"='Reservoir' 

)

ORDER BY "NativeAttributeCategoryName"



