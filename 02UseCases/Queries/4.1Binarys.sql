--4.1 Binarys

/*
This query shows an example binary data values and their meanings 
for an attribute called "Maximum Hydraulic Outflow" for the Water and Evaluation 
and Assessment (WEAP) model in the Lower Bear River Network Model 

Result:
users can import the data values to their model. WaM-DaM keeps track of the meanings of data values, their units, 
to what instance they apply too.... 

*/
-- The SELECT Statement here specifies the attribute name as "Maximum Hydraulic Outflow" but users can change it 
-- to other attributes or they can remove the where clause constraint and search for all the attributes that have 
-- binary data type 

SELECT NativeAttributeName, UnitName, InstanceName,MasterNetworkName,ScenarioName, AttributeTypeCodeCV,Binarys.BinaryValue,BinaryAttribute,ValueDefinition
FROM Attributes 
-- CommonAttributeName
LEFT JOIN ObjectAttributes
ON ObjectAttributes.AttributeID= Attributes .AttributeID

LEFT JOIN CommonAttributes
ON CommonAttributes.CommonAttributeID= Attributes .CommonAttributeID

LEFT JOIN Units
ON Units.UnitID= Attributes.UnitID

LEFT JOIN MetadataMapping
ON MetadataMapping.ObjectAttributeID= ObjectAttributes.ObjectAttributeID

LEFT JOIN Instances
ON Instances.InstanceID= MetadataMapping.InstanceID

LEFT JOIN ScenarioMetadata
ON ScenarioMetadata.MetadataMappingID= MetadataMapping.MetadataMappingID

LEFT JOIN Scenarios
ON Scenarios.ScenarioID= ScenarioMetadata.ScenarioID

LEFT JOIN MasterNetworks
ON MasterNetworks.MasterNetworkID= Scenarios.MasterNetworkID

LEFT JOIN DataStorage
ON DataStorage .DataStorageID = MetadataMapping.DataStorageID 

LEFT JOIN Binarys
ON Binarys.DataStorageID = DataStorage.DataStorageID 

LEFT JOIN BinaryValueMeaning
ON BinaryValueMeaning.BinaryValueMeaningID= Binarys.BinaryValueMeaningID

WHERE NativeAttributeName='Maximum Hydraulic Outflow'  AND InstanceName='Hyrum (10)' AND ScenarioName='BaseCaseLower'



