-- General Query across the database 

-- For a selected link instances, what are the start and end node instances and their object types?


SELECT  "Core"."Instances"."InstanceName" As "LinkInstanceName","Core"."ObjectTypes"."NativeObjectName",
"StartNodeInstance"."InstanceName" AS "StartInstanceName","ObjectTypeStartNodeInstance"."NativeObjectName",
"EndNodeInstance"."InstanceName" AS "EndInstanceName",
"ObjectTypeEndNodeInstance"."NativeObjectName" As "ObjectEndInstance","Core"."DataStructures"."DataStructureName"


FROM "Core"."DataStructures"

Left JOIN "Core"."ObjectTypes" 
ON "Core"."ObjectTypes"."DataStructureID"="Core"."DataStructures"."DataStructureID"

Left JOIN  "Core"."ObjectAttributes"
ON "Core"."ObjectAttributes"."ObjectTypeID"="Core"."ObjectTypes"."ObjectTypeID"

Left JOIN "Core"."MetadataMapping"
ON "Core"."MetadataMapping"."ObjectAttributeID"="Core"."ObjectAttributes"."ObjectAttributeID"

Left JOIN  "Core"."Attributes"
ON "Core"."Attributes"."AttributeID"="Core"."ObjectAttributes"."AttributeID" 

Left JOIN "Core"."Instances" 
ON "Core"."Instances"."InstanceID"="Core"."MetadataMapping"."InstanceID"

Left JOIN "Metadata"."Connections" 
ON "Metadata"."Connections"."LinkInstanceID"="Core"."Instances"."InstanceID"

Left JOIN "Core"."Instances" As "StartNodeInstance"
ON "StartNodeInstance"."InstanceID"="Metadata"."Connections"."StartNodeInstanceID"

Left JOIN "Core"."Instances"  AS "EndNodeInstance"
ON "EndNodeInstance"."InstanceID"="Metadata"."Connections"."EndNodeInstanceID"


--- Get the Object Type Name for the start node instance 
Left JOIN "Core"."MetadataMapping" As "MetadataStartNodeInstace"
ON "MetadataStartNodeInstace"."InstanceID"="StartNodeInstance"."InstanceID"

Left JOIN  "Core"."ObjectAttributes" As "ObjectAttStartNodeInstance"
ON "ObjectAttStartNodeInstance"."ObjectAttributeID"="MetadataStartNodeInstace"."ObjectAttributeID"

Left JOIN  "Core"."ObjectTypes" As "ObjectTypeStartNodeInstance"
ON "ObjectTypeStartNodeInstance"."ObjectTypeID"="ObjectAttStartNodeInstance"."ObjectTypeID"

Left JOIN  "Core"."Attributes" As "AttLinkInstance"
ON "AttLinkInstance"."AttributeID"="ObjectAttStartNodeInstance"."AttributeID"

--- Get the Object Type Name for the end node instance 
Left JOIN "Core"."MetadataMapping" As "MetadataEndNodeInstace"
ON "MetadataEndNodeInstace"."InstanceID"="EndNodeInstance"."InstanceID"

Left JOIN  "Core"."ObjectAttributes" As "ObjectAttEndNodeInstance"
ON "ObjectAttEndNodeInstance"."ObjectAttributeID"="MetadataEndNodeInstace"."ObjectAttributeID"

Left JOIN  "Core"."ObjectTypes" As "ObjectTypeEndNodeInstance"
ON "ObjectTypeEndNodeInstance"."ObjectTypeID"="ObjectAttEndNodeInstance"."ObjectTypeID"

Left JOIN  "Core"."Attributes" As "AttLinkEndInstance"
ON "AttLinkEndInstance"."AttributeID"="ObjectAttEndNodeInstance"."AttributeID"
-- Over 



WHERE  "Core"."Instances"."InstanceName"='From Box Elder County Urban to Withdrawal Node 4' 
AND "Core"."Attributes"."NativeAttributeName"='ObjectInstances'
AND "AttLinkInstance"."NativeAttributeName"='ObjectInstances'

OR "Core"."Instances"."InstanceName"='Blacksmith Fork;to Hyrum Reservoir' 
AND "AttLinkInstance"."NativeAttributeName"='ObjectInstances'
AND "Core"."Attributes"."NativeAttributeName"='ObjectInstances'
