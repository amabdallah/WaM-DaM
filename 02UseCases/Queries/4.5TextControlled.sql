-- 4.5 TextControlled

/*
This query shows text controlled data values, their attributes, units, object names, and instances, and data source 
for all the parameters in WaM-DaM

Result:
users can import the data values to their model. WaM-DaM keeps track of the meanings of data values, their units, 
to what instance they apply too.... 

*/



SELECT DataStructureName,ObjectTypes.NativeObjectName,MasterNetworkName,ScenarioName, 
Instances.InstanceName,NativeAttributeName,UnitAbbreviation,AttributeTypeCodeCV,TextControlledValue,ValueDefinition	
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

LEFT JOIN Mapping 
ON Mapping .ObjectAttributeID=ObjectAttributes.ObjectAttributeID

LEFT JOIN Instances 
ON Instances.InstanceID=Mapping .InstanceID

LEFT JOIN ScenarioMapping 
ON ScenarioMapping.MappingID=Mapping.MappingID

LEFT JOIN DataStorage 
ON DataStorage.DataStorageID=Mapping .DataStorageID

LEFT JOIN Scenarios 
ON Scenarios.ScenarioID=ScenarioMapping.ScenarioID

LEFT JOIN MasterNetworks 
ON MasterNetworks.MasterNetworkID=Scenarios.ScenarioID

--LEFT JOIN Methods 
--ON Methods.MethodID=Metadata.MethodID

--LEFT JOIN Sources 
--ON Sources.SourceID=Metadata.SourceID

LEFT JOIN TextControlled
ON TextControlled.DataStorageID=DataStorage.DataStorageID

LEFT JOIN TextControlledValues
ON TextControlledValues.TextControlledValueID=TextControlled.TextControlledValueID

WHERE AttributeTypeCodeCV='TC'
