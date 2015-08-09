-- 4.6 FileBased

/*
This query shows file-based references, their attributes, units, object names, and instances, and data source 
for all the parameters in WaM-DaM

Result:
users can uses these files in their models or as a reference for more details 

*/


SELECT NativeObjectName,InstanceName,"NativeAttributeName","UnitName",
AttributeTypeCodeCV,
"FileBased"."FileName",
FileFormateCV,
FileLocationOnDesk

--"DataStructures"."DataStructureName"
--"CommonObjectType",
--"MasterNetworkName",
-- "NativeObjectName",
--,"Instances"."InstanceName",

FROM "DataStructures"

Left JOIN "ObjectTypes" 
ON "ObjectTypes"."DataStructureID"="DataStructures"."DataStructureID"

Left JOIN  "ObjectAttributes"
ON "ObjectAttributes"."ObjectTypeID"="ObjectTypes"."ObjectTypeID"

Left JOIN  "Attributes"
ON "Attributes"."AttributeID"="ObjectAttributes"."AttributeID"

Left JOIN "Units" 
ON "Units"."UnitID"="Attributes"."UnitID"

Left JOIN "MetadataMapping"
ON "MetadataMapping"."ObjectAttributeID"="ObjectAttributes"."ObjectAttributeID"

Left JOIN "Instances" 
ON "Instances"."InstanceID"="MetadataMapping"."InstanceID"

Left JOIN "DataStorage" 
ON "DataStorage"."DataStorageID"="MetadataMapping"."DataStorageID"

LEFT JOIN "ScenarioMetadata"
ON "ScenarioMetadata"."MetadataMappingID"="MetadataMapping"."MetadataMappingID"

Left JOIN "Scenarios" 
ON "Scenarios"."ScenarioID"="ScenarioMetadata"."ScenarioID"

Left JOIN "MasterNetworks" 
ON "MasterNetworks"."MasterNetworkID"="Scenarios"."ScenarioID"

Left JOIN "FileBased" 
ON "FileBased"."DataStorageID"="DataStorage"."DataStorageID"

WHERE AttributeTypeCodeCV='FB'

