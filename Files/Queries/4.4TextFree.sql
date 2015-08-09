--3.4 TextFree

/*
This query shows text free data values, their attributes, units, object names, and instances, and data source 
for all the parameters in WaM-DaM

Result:
users can import the data values to their model. WaM-DaM keeps track of the meanings of data values, their units, 
to what instance they apply too.... 

*/

SELECT DataStructureName,ObjectTypes.NativeObjectName,MasterNetworkName,ScenarioName, 
Instances.InstanceName,NativeAttributeName,UnitAbbreviation,AttributeTypeCodeCV,TextFreeValue
--,MethodName,SourceName,
FROM DataStructures


LEFT JOIN ObjectTypes 
ON ObjectTypes.DataStructureID=DataStructures.DataStructureID

LEFT JOIN  ObjectAttributes
ON ObjectAttributes.ObjectTypeID=ObjectTypes.ObjecttypeID

LEFT JOIN  Attributes
ON Attributes.AttributeID=ObjectAttributes.AttributeID

LEFT JOIN Units 
ON Units.UnitID=Attributes.UnitID

LEFT JOIN MetadataMapping 
ON MetadataMapping .ObjectAttributeID=ObjectAttributes.ObjectAttributeID

LEFT JOIN Instances 
ON Instances.InstanceID=MetadataMapping .InstanceID

LEFT JOIN ScenarioMetadata 
ON ScenarioMetadata.MetadataMappingID=MetadataMapping.MetadataMappingID

LEFT JOIN DataStorage 
ON DataStorage.DataStorageID=MetadataMapping .DataStorageID

LEFT JOIN Scenarios 
ON Scenarios.ScenarioID=ScenarioMetadata.ScenarioID

LEFT JOIN MasterNetworks 
ON MasterNetworks.MasterNetworkID=Scenarios.ScenarioID

--LEFT JOIN Methods 
--ON Methods.MethodID=Metadata.MethodID

--LEFT JOIN Sources 
--ON Sources.SourceID=Metadata.SourceID

LEFT JOIN TextFree
ON TextFree.DataStorageID=DataStorage.DataStorageID

WHERE AttributeTypeCodeCV='TF'
