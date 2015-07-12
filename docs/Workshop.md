# WaM-DaM Workshop    
## Discover what water management data is available to run a WEAP model

This 20-minute workshop will introduce the Water Management Data Model (WaM-DaM) and demonstrate some WaM-DaM capabilities to search and discover water management data for use in water resources modeling. 

You may access the [workshop handout](https://github.com/amabdallah/WaM-DaM/raw/master/Files/WaM-DaM_workshop.pdf) [7 pages] for the detailed instrucutions  


We provide the instructions on how a user can set up a SQLite instance of WaM-DaM and use Mozzile FireFox Manager to visualize and interact with the WaM-DaM database. I explain the how to set up a SQLite database in this Youtube demonstration video. if you follow the instructions, the estimated time to setup a SQLite instance and create WaM-DaM blank instance is less than 15 miutes.

## Software needed:
1. Download Mozilla FireFox web browser
https://www.mozilla.org/en-US/firefox/new/

2.	SQLite Manager Add-on to Mozilla FireFox
https://addons.mozilla.org/en-US/firefox/addon/sqlite-manager/

3. Download the Pre-populated WaMDaM instance here and unzipp the folder.
https://github.com/amabdallah/WaM-DaM/blob/master/Files/WaMDaM.rar

###4. Queries     
#####i. Check out the WEAP data structure using this [query](https://github.com/amabdallah/WaM-DaM/blob/master/Files/WorkshopQuries2/01CheckWEAPdataStructure.sql)      
This query shows the data structure of Object Types and their Attributes for Water Evaluation and Assessment (WEAP) model.    

Users can see the Objects, their topology, and their Attributes that WEAP uses to model water systems. These Object and Attributes are used as input to queries to search and discover water management data in other data structures   

#####ii. Available data to expand the Lower Bear River Model using this [query](https://github.com/amabdallah/WaM-DaM/blob/master/Files/WorkshopQuries2/02DiscoverAvailableDataToExpandBear.sql)     
This query discovers the available data to expand the existing Lower Bear River Model in the Water and Evaluation 
and Assessment (WEAP) model to the entire Bear Watershed. The search is based on a boundary of coordinates for instances in the upper Bear River Watershed. 

Users need to only change these coordinates to discover data in other regions. Users can see the number of available instances and attributes for object types that WEAP requires. They can see the sources of each Object types and the native name in its original source along with the controlled or common name. Users can further search for more metadata and data about these instances. Then they can choose which ones to import to their model 

#####iii.Identify missing data to expand  the WEAP model using this query [query](https://github.com/amabdallah/WaM-DaM/blob/master/Files/WorkshopQuries2/03DiscoverMissingDataToExpandBear.sql)       
This query shows the data structure of Object Types and their Attributes 
for Water Evaluation and Assessment (WEAP) model. The search is based on a boundary of coordinates for instances in the upper Bear River Watershed. 

Users need to only change these coordinates to discover data in other regions. Users can see the Objects, their topology, and their Attributes that WEAP uses to model water systems. These Object and Attributes are used as input to queries 
to search and discover water management data in other data structures    

#####iv. Discover available data for a WEAP model in the Tuscaloosa Region using this [query](https://github.com/amabdallah/WaM-DaM/blob/master/Files/WorkshopQuries2/04DiscoverSearchAlabama.sql)    
This query discovers the available data to to build a model in the Water and Evaluation 
and Assessment (WEAP) system for the Tuscaloosa region, Alabama. The search is based on a boundary of coordinates for instances in the Tuscaloosa region, Alabama     

Users need to only change these coordinates to discover data in other regions. Users can see the Objects, their topology, and their Attributes that WEAP uses to model water systems. These Object and Attributes are used as input to queries 
to search and discover water management data in other data structures Users can further search for more metadata and data about these instances. Then they can choose which ones to import to their model

