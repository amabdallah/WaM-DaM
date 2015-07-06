## WaM-DaM Documentation Index

### Scope
WaM-DaM is specifically designed to support Systems water management data. We draw the [scope] (https://github.com/amabdallah/WaM-DaM/blob/master/docs/Scope.md)
of WaM-DaM and the list the types of data that it can handle 

### Reviewed Systems 
To draw the common and needed data features for a generic design, we reviewed thirty common available systems models and data management systems. These systems are either used extensively in the literature, we have experience with them, or our collaborators are using them in their active research. These models or systems are not inclusive or necessarily representative of the vast inventory of models. However, these models represent a wide and diverse range of used methods to organize and model water management data. Additional probable features in other models can be accommodated in future improvements to WaM-DaM.
Check out further details about the [Reviewed Systems](https://github.com/amabdallah/WaM-DaM/blob/master/docs/Reviewed_Systems.md)

## Software 
I used <a href="http://www.dbwrench.com" target="_blank">DbWrench 3.2.4</a> to draw the Entity-Relationship (ER) diagram of WaM-DaM logical Data Model

**Credit** 
I adapted this <a href="https://github.com/ODM2/ODM2/tree/master/src/build_schemas" target="_blank">DDL generator</a> script written in Python [by Tony Castranova] that converts the DbWrench XML file of WaM-DaM to forward engineer to MsSQL, MySQL, and PostgreSQL.

### WaM-DaM Design principles 
We complied eight <a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/Design_principles.md" target="_blank">design principles</a> for WaM-DaM based on the reviewed systems, important questions, and uses cases. It is the key contribution of WaM-DaM to support all these principles together: flexible and extensible modular design, networks, scenarios, conditional query for subsets of data, dynamic controlled vocabulary, reusable descriptive and explicit metadata, multiple data formats for systems models, and open-source environment.


### WaM-DaM Architecture
WaM-DaM is organized into four schemas: i) core concepts (blue) which represent the key configuring concepts of WaM-DaM modular design, ii) metadata (orange) which represents key metadata that help users correctly and unambiguously interpret their data, iii) controlled vocabulary (purple) which enforces the consistent use of terms across disparate data sources, and iv) data storage (red) which holds data values of different types based on the user’s choice (e.g., time series and text)

Check out the current WaM-DaM logical data model <a href="http://amabdallah.github.io/WaM-DaM/" target="_blank">schema</a>

### WaM-DaM Core Entities
The <a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/Core.md" target="_blank">Core entities</a> in WaM-DaM comprise ten configuring entities that are needed to infer the context of and relationship between water management data values in a water system. These core entities are Data Structure, Object Type, Attribute, Instance, Master Network, Scenario, and Data Storage, and MetadataMapping (blue boxes in Figure 2). ObjectAttributes and ScenarioMetadata are bridge tables that allow associating many records of each side with the other. 

### WaM-DaM Metadata Entities
The <a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/Metadata.md" target="_blank">Metadata entities</a> in WaM-DaM comprise nine key tables that help uses define descriptive and explicit metadata to support the correct and unambiguous interpretation of the core entities

### WaM-DaM Controlled Vocabulary Entities
<a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/Controlled_vocabularies.md" target="_blank">Controlled Vocabulary (CV)</a> imposes semantics consistency for important fields in WaM-DaM. There are 18 CV tables in WaM-DaM. We populated these tables with test data. Users can adopt the CV entries or add new terms. 
<a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/Future_Work.md" target="_blank">Future work</a> can develop complete lists of CV terms for water management data.    

### WaM-DaM storage Entities
<a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/Storage.md" target="_blank">Data Storage</a> in WaM-DaM holds data values of different types based on the user’s choice (e.g., time series and text).
