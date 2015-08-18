-- 4.5 TextControlled

/*
This query shows text controlled data values, their attributes, units, object names, and instances, and data source 
for all the parameters in WaM-DaM

Result:
users can import the data values to their model. WaM-DaM keeps track of the meanings of data values, their units, 
to what instance they apply too.... 

*/

SELECT NativeObjectName,MasterNetworkName,ScenarioName, 
InstanceName,NativeAttributeName,UnitAbbreviation,AttributeTypeCodeCV,TextControlledValue,ValueDefinition	
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
ON Instances.InstanceID=Mapping.InstanceID

LEFT JOIN ScenarioMapping 
ON ScenarioMapping.MappingID=Mapping.MappingID

LEFT JOIN DataStorage 
ON DataStorage.DataStorageID=Mapping .DataStorageID

LEFT JOIN Scenarios 
ON Scenarios.ScenarioID=ScenarioMapping.ScenarioID

LEFT JOIN MasterNetworks 
ON MasterNetworks.MasterNetworkID=Scenarios.MasterNetworkID

LEFT JOIN TextControlled
ON TextControlled.DataStorageID=DataStorage.DataStorageID

LEFT JOIN TextControlledValues
ON TextControlledValues.TextControlledValueID=TextControlled.TextControlledValueID

WHERE AttributeTypeCodeCV='TC' AND 
NativeAttributeName='PURPOSES'


