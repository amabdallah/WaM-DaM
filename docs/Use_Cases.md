#### Use Cases to Demonstrate the Capabilities and Benefits of WaM-DaM

We load disperate water manageemnt data to a WaM-DaM SQLite empty database. Then we present six uses cases that demonstrate how WaM-DaM can help users of scentistis and practioners to search for data for their models, keep track of important metadata, and compare similarites and differences across their data.

![](https://github.com/amabdallah/WaM-DaM/blob/master/Files/Figures/WaM-DaM_workflowExample.JPG)

First, we compiled all the data into CSV files under four Excel workbooks where each workbook has spreadsheets that replicate WaM-DaM tables. Then, I wrote a Matlab script to parse and then load data to the WaM-DaM SQLite database. You can use this generic [Matlab script](https://github.com/amabdallah/WaM-DaM/blob/master/Files/MatlabScript/AutomateLoadingDataToWaMDaM.m) to load your data to an empty SQLite WaM-DaM database. You can use the populated SQLite database along with the  <a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/SQLite_Instructions.md" target="_blank"> instrcutions </a> on how to set it up to test the use cases below. 

  

1. What are the available data structures, networks and scenarios, and what are their spatial reference?    
[Query]()[Result]()  
2.	What is the data value(s) of an attribute of a system component?    
2.1 Binary  
[Query]()[Result]()   
2.2 Parameter  
[Query]()[Result]()  
2.3 Seasonal Parameter 
[Query]()[Result]()    
2.4 Text Free  
[Query]()[Result]()  
2.5 Text Controlled    
[Query]()[Result]()    
2.6 File Based  
[Query]()[Result]()  
2.7 Rules  
[Query]()[Result]()    
2.8 time Series    
[Query]()[Result]()   
2.9 Multi-Column Array    
[Query]()[Result]()  
3.	Where the data came from for an attribute, who reported them, and using what method?  
[Query]()[Result]()  
4.	What are the available networks and scenarios, and what are their domain, spatial reference, and vertical datum?  
[Query]()[Result]()  
5.	How these infrastructure components are physically connected to each other in a scenario? list the start and end nodes and directions of flow 
[Query]()[Result]()  
5.1 Start and End nodes of Link Instances 
[Query]()[Result]()  
5.2 Link Instances that start at a node instance  
[Query]()[Result]()  
5.3 Link Instances that end at a node instances 
[Query]()[Result]()  
6.	What are the data and metadata similarities and differences between two scenarios of a network for a model (e.g., WEAP)?
[Query]()[Result]()  
5.1 Differences in Topology 
[Query]()[Result]()  
5.2 Differences in Metadata
[Query]()[Result]()  
5.3 Differences in Data Values 
[Query]()[Result]()  

