## Setup Your SQLite Database 

Once you have a blank database of WaM-DaM tables in SQLite, here we provide the instructions on how you could load your own data to your WaM-DaM. 

*There are many ways of how users could interact with databases.*    
**1.** Enter your data into the database manually, one recored at a time. Obviiosuly this is a tredious process but it could be used to learn how the database works.   

**2.** Import your data to each table from a speadsheet. Many of the relational database systems like Microsoft SQL Serve support this "Import Function". This is a good method to import lots of records at once but we need to automate this process and reused it for the same data.    

**3.** Load your data using a scripting language like Python and Matlab to read and parse your data from spreadsheets or text files into your database. You need to use the Open Database Connectivity (ODBC) library which allows your scripting languate to talke to the database. ODBC usually and supported by your machine. Otherwise, if ODBC is not supported, you need to install and use the Java Database Connectivity (JDBC) software.     
  
Here, we demonstrate how you could use Matlab ( just because we're familur with it) to load the data sources into a SQLite WaM-DaM database from Excel. We organized four Excel workbooks that reflect the four groups of tables in WaM-DaM: Core Module, Metadata, CVs, and Data Storage. Each Workbook contains spreadsheets with headlines that correspond to tables and their fields in WaM-DaM. You can tweek this Matlab code to work for your own data.   
You need to organize your data to fit into these four workbooks, and then you can use the Matlab script to load your data into the your database. However, you need to map out the forigen keys between your data mainly for the Mapping and Scenario Mapping tables. Otherwise, you need to insert foreign keys manually to the rest of the tables in each spreadsheet. 

The Matlab script to load data is generic to any data source but mapping foreign keys in the script is specific to the used data sources. The Matlab script is used to demonstrate loading data to WaM-DaM but future software work based on WaM-DaM specifications can automate mapping foreign keys like in the Mapping table seemingly through a friendly and interactive graphical user interface.


We provide the instructions on how a user can set up a SQLite instance of WaM-DaM and use Mozzile FireFox Manager to visualize and interact with the WaM-DaM database. I explain the how to set up a SQLite database in this Youtube demonstration video. if you follow the instructions, the estimated time to setup a SQLite instance and create WaM-DaM blank instance is less than 15 miutes.

#### Software needed:

1. Download Mozilla FireFox web browser
https://www.mozilla.org/en-US/firefox/new/

2.	SQLite Manager Add-on to Mozilla FireFox
https://addons.mozilla.org/en-US/firefox/addon/sqlite-manager/

3. DDL script to creat blank WaM-DaM database for [SQLite](https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Blank_Database/WaM-DaM_for_SQLite.sql)

4. Matlab. You need to install the Database Toolbox which doesnt come with the standartd Matlab software. You also can use Python, R, or any scripting language to load data to your database. 

5. Download SQLite *[Optional]* You could use this SQLite engine to create databases and load them with data through the CMD terminal  
https://www.sqlite.org/index.html
For Windows machines (32 or 64 bits), download the “sqlite-shell-win32-x86-3081002” instance

##A. Setup a SQLite database with a blank WaM-DaM instance

Download one of these pre-populated WaM-DaM SQLite database instance at your convenience and save it to a place that you can later navigate to, like the Desktop    
•	[WaMDaM_August19_2015.sqlite](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Populated_Database/WaMDaM_August19_2015.sqlite?raw=true) [57 MB] – best if you have a fast internet connection  
•	[WaMDaM_August19_2015.zip](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Populated_Database/WaMDaM_August19_2015.zip?raw=true) [50 MB] –requires WINZIP software to unzip it   
•	[WaMDaM_August19_2015.rar](https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Populated_Database/WaMDaM_August19_2015.rar?raw=true) [27 MB] – requires WINRAR software to unzip it   

    

1. Install SQLite Manager   
<a href="https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/Populated_Database/SQLite_Instructions.md" target="_blank"> Add-On </a> to Firefox (only works if you open this link in Mozilla Firefox)
<img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite1.JPG" alt="alt text" width="450" height="320">   

2. Add SQLite Manager botton to Firefox       
<img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite2.JPG" alt="alt text" width="450" height="320">

3. Launch SQLite Manager    
<img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite3.JPG" alt="alt text" width="450" height="320">

4. Add your new Database in SQLite Manager    
<img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite4.png" alt="alt text" width="350" height="280"><img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite5.png" alt="alt text" width="350" height="280">   

5. Create blank WaM-DaM database     
<img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite6.png" alt="alt text" width="350" height="280"><img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite7.png" alt="alt text" width="350" height="280">   

##B. Connect Matlab with SQLite through the JDBC driver 
Follow these <a href="http://www.mathworks.com/help/database/ug/sqlite-jdbc-windows.html" target="_blank"> Matlab instructions </a> to set up a JDBC driver in Matlab so it can communicate with any SQLite database.   

1. Launch the Database Toolbox in Matalb     
<img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/Matlab1.JPG" alt="alt text" width="450" height="320">

2. Set up the JDBC connection    
<img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/Matlab2.JPG" alt="alt text" width="450" height="320">

2. Connect Matlab with SQLite    
<img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/Matlab3.JPG" alt="alt text" width="450" height="320">







