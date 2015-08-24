## WaM-DaM Documentation

### Scope
WaM-DaM is specifically designed to support Systems water management data. We draw the [scope] (https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Scope.md)
of WaM-DaM and the list the types of data that it can handle 

### Reviewed Systems 
To draw the common and needed data features for a generic design, we reviewed thirty common available systems models and data management systems. These systems are either used extensively in the literature, we have experience with them, or our collaborators are using them in their active research. These models or systems are not inclusive or necessarily representative of the vast inventory of models. However, these models represent a wide and diverse range of used methods to organize and model water management data. Additional probable features in other models can be accommodated in future improvements to WaM-DaM.
Check out further details about the [Reviewed Systems](https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Reviewed_Systems.md)

## Software 
I used <a href="http://www.dbwrench.com" target="_blank">DbWrench 3.3.1</a> to draw the Entity-Relationship (ER) diagram of WaM-DaM logical Data Model

**Credit** 
I adapted and used this <a href="https://github.com/amabdallah/WaM-DaM/tree/master/01Documentation/02DDL" target="_blank">DDL generator</a> script written in Python [by Tony Castranova] that converts the DbWrench XML file of WaM-DaM to forward engineer to MSSQL, MySQL, SQLite, and PostgreSQL.

### WaM-DaM Design principles 
We complied eight <a href="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Design_principles.md" target="_blank">design principles</a> for WaM-DaM based on the reviewed systems, important questions, and uses cases. It is the key contribution of WaM-DaM to support all these principles together: flexible and extensible modular design, networks, scenarios, conditional query for subsets of data, dynamic controlled vocabulary, reusable descriptive and explicit metadata, multiple data formats for systems models, and open-source environment.


### WaM-DaM Architecture


Conceptual Data Model 


![](https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/WaM-DaM_Conceptual.jpg)


Logical Data Model 

Changes to the conceptual model 

The logical data model uses the Relational Model Theory to implement the conceptual model so it can be used in RDBSMS. The logical model specifies the concepts identified in the conceptual model into entities (or tables) with fields, and connects their relationships through primary and foreign keys. The relationship between entities has a cardinality which refers to the count of relationships that each entity can have with another like one to many, one to one, and many to many. 

**Added these bridge tables to mapp out many to many relationships and resolve the circular reference**           

**ObjectAttributes:** an Object Type can have many attributes (e.g., Reservoir can have Capacity, Inflow, Release) and vice versa (e.g., inflow can apply to Demand Site, Reservoir)   
**Mapping:** it is the centeral table in WaM-DaM where data values for different formats are connected to their attributes, metadata, instances, and scenarios.    
**ScenarioMapping:**The ScenarioMapping table maps out the relationships of many instances that belong to many scenarios and vice versa.    
**Data Storage:** maps out the many to many relationships identified in Section 3.6 between a data value and many instances and vice versa.   


WaM-DaM is organized into four schemas: i) core concepts (blue) which represent the key configuring concepts of WaM-DaM modular design, ii) metadata (orange) which represents key metadata that help users correctly and unambiguously interpret their data, iii) controlled vocabulary (purple) which enforces the consistent use of terms across disparate data sources, and iv) data storage (red) which holds data values of different types based on the user’s choice (e.g., time series and text)

![](https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/WaMDaM_Logical.jpg)


#### Documentation  
WaM-DaM is a set of related database tables that are organized into four groups handling different aspects of water management data:  
* Core constructs (blue) which represent the key configuring constructs of WaM-DaM modular design, 
* Metadata (orange) which represents key metadata that help users correctly and unambiguously interpret their data, 
* Controlled Vocabularies (CVs) (purple) which enforces the consistent use of terms across disparate data sources (only one CV box is shown for simplicity), and 
* Data Storage (red) which holds data values of different types based on the user’s choice (e.g., time series and text)   


Check out the current WaM-DaM logical data model <a href="http://amabdallah.github.io/WaM-DaM/diagrams/Full.html" target="_blank">schema</a>

### WaM-DaM Core Entities
The <a href="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Core.md" target="_blank">Core entities</a> in WaM-DaM comprise ten configuring entities that are needed to infer the context of and relationship between water management data values in a water system. These core entities are Data Structure, Object Type, Attribute, Instance, Master Network, Scenario, and Data Storage, and MetadataMapping (blue boxes in Figure 2). ObjectAttributes and ScenarioMetadata are bridge tables that allow associating many records of each side with the other. 

### WaM-DaM Metadata Entities
The <a href="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Metadata.md" target="_blank">Metadata entities</a> in WaM-DaM comprise nine key tables that help uses define descriptive and explicit metadata to support the correct and unambiguous interpretation of the core entities

### WaM-DaM Controlled Vocabulary Entities
<a href="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Controlled_vocabularies.md" target="_blank">Controlled Vocabulary (CV)</a> imposes semantics consistency for important fields in WaM-DaM. There are 18 CV tables in WaM-DaM. We populated these tables with test data. Users can adopt the CV entries or add new terms. 
<a href="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/03Limitations_FutureWork/Future_Work.md" target="_blank">Future work</a> can develop complete lists of CV terms for water management data.    

### WaM-DaM storage Entities
<a href="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Storage.md" target="_blank">Data Storage</a> in WaM-DaM holds data values of different types based on the user’s choice (e.g., time series and text).
