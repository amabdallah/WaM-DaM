#### Use Cases to Demonstrate the Capabilities and Benefits of WaM-DaM

We load disperate water manageemnt data to a WaM-DaM SQLite empty database. Then we present six uses cases that demonstrate how WaM-DaM can help users of scentistis and practioners to search for data for their models, keep track of important metadata, and compare similarites and differences across their data.

![](https://github.com/amabdallah/WaM-DaM/blob/master/Files/Figures/WaM-DaM_workflowExample.JPG)

First, we compiled all the data into CSV files under four Excel workbooks where each workbook has spreadsheets that replicate WaM-DaM tables. Then, I wrote a Matlab script to parse and then load data to the WaM-DaM SQLite database. You can use this generic [Matlab script](https://github.com/amabdallah/WaM-DaM/blob/master/Files/MatlabScript/AutomateLoadingDataToWaMDaM.m) to load your data to an empty SQLite WaM-DaM database. You can use the populated SQLite database along with the  <a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/SQLite_Instructions.md" target="_blank"> instrcutions </a> on how to set it up to test the use cases below. 

**Use case # 1:** What are the required types of water system components and their attributes for a WEAP model?
[Query]()[Result]()  

**Use case #2:** What are the available water system infrastructure components to expand the Lower Bear River Model to the entire Bear River Watershed? 
[Query]()[Result]()  

**Use case #3:** How are the water system components physically connected? Show directions of flow 
[Query]()[Result]()  


**Use case #4:** What are the data value(s) of an attribute of a system component?
[Query]()[Result]()  

4.1 Binarys
[Query]()[Result]()  

4.2 Parameters  
[Query]()[Result]() 

4.3 Seasonal Parameters 
[Query]()[Result]()  

4.4 Text Free  
[Query]()[Result]()  

4.5 Text Controlled    
[Query]()[Result]()    

4.6 File Based  
[Query]()[Result]()  

4.7 Rules  
[Query]()[Result]()    

4.8 Time Series    
[Query]()[Result]()  

4.81 TimeSeriesValues
[Query]()[Result]()  

4.9 Multi-Column Array    
[Query]()[Result]()    

**Use case #5:** Where the data came from for an attribute, who reported them, and to what organization the person belongs to, and using what method?

**Use case #6:** What are the data and metadata differences between two scenarios?
[Query]()[Result]()  

6.1 Differences in Topology 
[Query]()[Result]()  

6.2 Differences in Metadata
[Query]()[Result]()  

6.3 Differences in Data Values 
[Query]()[Result]()  


