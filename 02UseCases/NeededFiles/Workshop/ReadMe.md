# WaM-DaM Workshop    
## Discover what water management data is available to run a WEAP model

This 20-minute workshop will introduce the Water Management Data Model (WaM-DaM) and demonstrate some WaM-DaM capabilities to search and discover water management data for use in water resources modeling. You may access the [workshop handout](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Workshop/WaM-DaM_workshop.pdf) [PDF: 7 pages] for the detailed instructions  
We provide the instructions on how a user can set up a SQLite instance of WaM-DaM and use Mozilla Firefox Manager to interact with the WaM-DaM database.

## Software and files needed to complete the activity
1. Download Mozilla Firefox web browser
https://www.mozilla.org/en-US/firefox/new/

2.	SQLite Manager Add-on to Mozilla Firefox [Caution: It does not work to install the Add-On from Google Chrome] 	
https://addons.mozilla.org/en-US/firefox/addon/sqlite-manager/

3. Download one of these pre-populated WaM-DaM SQLite database instance at your convenience and save it to a place that you can later navigate to, like the Desktop    
•	[WaMDaM.sqlite](https://goo.gl/KPEO2Z  ) [67 MB] – best if you have a fast internet connection  
•	[WaMDaMzip.zip](https://goo.gl/ZRBTSC) [30 MB] –requires WINZIP to unzip it   
•	[WaMDaM.rar](https://goo.gl/KMVhXs ) [8 MB] – requires WINRAR to unzip it   


###4. Queries     
#####A.	What are the required attributes for the WEAP model? [query](https://goo.gl/4L57yI )      
This query shows the data structure of Object Types and their Attributes for Water Evaluation and Assessment 
<a href="http://www.weap21.org/index.asp" target="_blank">(WEAP)</a>.  
Users can see the Objects, their topology, and their Attributes that WEAP uses to model water systems. These Object and Attributes are used as input to queries to search and discover water management data in other data structures.      

This query summarizes the required data that users need to find to populate a specific instance of a WEAP model. For example, users need to look for data values of attributes like buffer coefficient that describe reservoirs and cost values for return flows in their model. WaM-DaM stores these objects and their attributes and associates them with the WEAP model.   
 
#####B. Discover available data to expand the Lower Bear River Model to the entire Basin [query](https://goo.gl/c0hkp7)      
The search is based on a boundary of coordinates provided in the SQL script for instances in the upper Bear River Basin . Users need to only change these coordinates in the provided SQL script to discover data in other regions. 

![](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/NeededFiles/Workshop/ExpandBear.JPG)

#####C. Discover available data for a WEAP model in the Tuscaloosa Region, AL [query](https://goo.gl/BCPZoq)           
This query discovers the available data to build a model in the Water and Evaluation and Assessment (WEAP) system for the Tuscaloosa region, Alabama. The search is based on a boundary of coordinates for instances in the Tuscaloosa region, Alabama     

Please provide your <a href="https://goo.gl/SLS8vD" target="_blank">feedback</a> to help us understand and then better serve your needs. 
