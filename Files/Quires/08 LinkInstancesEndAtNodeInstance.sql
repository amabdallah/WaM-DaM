-- General Query across the database 

-- for a selected node instances, what is the link that ends at it and what is the object type name for that link instance?


SELECT "LinkInstanceEnd"."InstanceName" AS "LinkInstanceName","ObjectTypeLinkInstance"."NativeObjectName" AS "LinkObjectType",
"Core"."Instances"."InstanceName" As "NodeInstanceName","Core"."ObjectTypes"."NativeObjectName" AS "NodeObjectType","MasterNetworkName","DataStructures"."DataStructureName"

FROM "Core"."DataStructures"

Left JOIN "Core"."ObjectTypes" 
ON "Core"."ObjectTypes"."DataStructureID"="Core"."DataStructures"."DataStructureID"

Left JOIN  "Core"."ObjectAttributes"
ON "Core"."ObjectAttributes"."ObjectTypeID"="Core"."ObjectTypes"."ObjectTypeID"

Left JOIN "Core"."MetadataMapping"
ON "Core"."MetadataMapping"."ObjectAttributeID"="Core"."ObjectAttributes"."ObjectAttributeID"


Left JOIN "Core"."SceanrioMetadata"
ON "Core"."SceanrioMetadata"."MetadataMappingID"="Core"."MetadataMapping"."MetadataMappingID"

Left JOIN "Core"."Scenarios"
ON "Core"."Scenarios"."ScenarioID"="Core"."SceanrioMetadata"."ScenarioID"

Left JOIN "Core"."MasterNetworks" 
ON "Core"."MasterNetworks"."MasterNetworkID"="Scenarios"."ScenarioID"


Left JOIN  "Core"."Attributes"
ON "Core"."Attributes"."AttributeID"="Core"."ObjectAttributes"."AttributeID" 

Left JOIN "Core"."Instances" 
ON "Core"."Instances"."InstanceID"="Core"."MetadataMapping"."InstanceID"

Left JOIN "Metadata"."Connections" As "EndNode"
ON "EndNode"."EndNodeInstanceID"="Core"."Instances"."InstanceID"

Left JOIN "Core"."Instances" As "LinkInstanceEnd"
ON "LinkInstanceEnd"."InstanceID"="EndNode"."LinkInstanceID"

Left JOIN "Core"."MetadataMapping" As "MetadataLinkInstace"
ON "MetadataLinkInstace"."InstanceID"="LinkInstanceEnd"."InstanceID"

Left JOIN  "Core"."ObjectAttributes" As "ObjectAttLinkInstance"
ON "ObjectAttLinkInstance"."ObjectAttributeID"="MetadataLinkInstace"."ObjectAttributeID"

Left JOIN  "Core"."ObjectTypes" As "ObjectTypeLinkInstance"
ON "ObjectTypeLinkInstance"."ObjectTypeID"="ObjectAttLinkInstance"."ObjectTypeID"

Left JOIN  "Core"."Attributes" As "AttLinkInstance"
ON "AttLinkInstance"."AttributeID"="ObjectAttLinkInstance"."AttributeID"

WHERE  "Core"."Instances"."InstanceName"='Box Elder;County Urban (6)' 
AND "Core"."Attributes"."NativeAttributeName"='ObjectInstances'
AND "AttLinkInstance"."NativeAttributeName"='ObjectInstances'






