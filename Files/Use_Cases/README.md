#### Use Cases to Demonstrate the Capabilities and Benefits of WaM-DaM

We load disperate water manageemnt data to a WaM-DaM SQLite empty database. Then we present six uses cases that demonstrate how WaM-DaM can help users of scentistis and practioners to search for data for their models, keep track of important metadata, and compare similarites and differences across their data.

First, we compiled all the data into CSV files under four Excel workbooks where each workbook has spreadsheets that replicate WaM-DaM tables. Then, I wrote a Matlab script to parse and then load data to the WaM-DaM SQLite database. You can use this generic [Matlab script](https://github.com/amabdallah/WaM-DaM/blob/master/Files/MatlabScript/AutomateLoadingDataToWaMDaM.m) to load your data to an empty SQLite WaM-DaM database. You can use the populated SQLite database along with the  <a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/SQLite_Instructions.md" target="_blank"> instrcutions </a> on how to set it up to test the use cases below. 


![](https://github.com/amabdallah/WaM-DaM/blob/master/Files/Figures/WaM-DaM_workflowExample.JPG)


**Use case # 1:** [What are the required types of water system components and their attributes for a WEAP model?](https://github.com/amabdallah/WaM-DaM/blob/master/docs/Use_Case1.md)   
 

**Use case #2:** [What are the available water system infrastructure components to expand the Lower Bear River Model to the entire Bear River Watershed?](https://github.com/amabdallah/WaM-DaM/blob/master/Files/Use_Cases/Use_Case2.md)    


**Use case #3:** [How are the water system components physically connected? Show directions of flow](https://github.com/amabdallah/WaM-DaM/blob/master/Files/Use_Cases/Use_Case3.md)    


**Use case #4:** [What are the data value(s) of an attribute of a system component?](https://github.com/amabdallah/WaM-DaM/blob/master/Files/Use_Cases/Use_Case4.md)   
This use case shows the data values of all the types of data that WaM-DaM supports: Binarys, Parameters,Seasonal Parameters, Text Free, Text Controlled, File Based, Rules, Time Series, TimeSeriesValues, and Multi-Column Array 


**Use case #5:** [Where the data came from for an attribute, who reported them, and to what organization the person belongs to, and using what method?](https://github.com/amabdallah/WaM-DaM/blob/master/Files/Use_Cases/Use_Case5.md)  
 

**Use case #6:** [What are the data and metadata differences between two scenarios?](https://github.com/amabdallah/WaM-DaM/blob/master/Files/Use_Cases/Use_Case6.md)   

This use cases show how WaM-DaM compares the differences in Topology, Metadata, and Data Values between two scenarios of the Lower Bear River model in WEAP.     


