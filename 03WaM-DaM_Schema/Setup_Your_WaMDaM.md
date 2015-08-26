## Setup Your SQLite Database 

Once you have a blank database of WaM-DaM tables in SQLite, here we provide the instructions on how you could load your own data to your WaM-DaM. 

*There are many ways of how users could interact with databases.*    
**1.** Enter your data into the database manually, one record at a time. Obviously this is a tedious process but it could be used to learn how the database works.   

**2.** Import your data to each table from a spreadsheet. Many of the relational database systems like Microsoft SQL Server support this "Import Function". This is a good method to import lots of records at once but we need to automate this process and reused it for the same data.    

**3.** Load your data using a scripting language like Python and Matlab to read and parse your data from spreadsheets or text files into your database. You need to use the Open Database Connectivity (ODBC) library which allows your scripting language to talk to the database. ODBC usually and supported by your machine. Otherwise, if ODBC is not supported, you need to install and use the Java Database Connectivity (JDBC) software.     
  
Here, we demonstrate how you could use Matlab (just because we're familiar with it) to load the data sources into a SQLite WaM-DaM database from Excel. We organized four Excel workbooks that reflect the four groups of tables in WaM-DaM: Core Module, Metadata, CVs, and Data Storage. Each Workbook contains spreadsheets with headlines that correspond to tables and their fields in WaM-DaM. You can tweek this Matlab code to work for your own data.   
You need to organize your data to fit into these four workbooks, and then you can use the Matlab script to load your data into your database. However, you need to map out the foreign keys between your data mainly for the Mapping and Scenario Mapping tables. Otherwise, you need to insert foreign keys manually to the rest of the tables in each spreadsheet. 

The Matlab script to load data is generic to any data source but mapping foreign keys in the script is specific to the used data sources. The Matlab script is used to demonstrate loading data to WaM-DaM but future software work based on WaM-DaM specifications can automate mapping foreign keys like in the Mapping table seemingly through a friendly and interactive graphical user interface.

We provide the instructions on how a user can set up a SQLite instance of WaM-DaM and use Firefox SQLite Manager to visualize and interact with the WaM-DaM database. I explain the how to set up a SQLite database in this YouTube demonstration video. if you follow the instructions, the estimated time to setup a SQLite instance and create WaM-DaM blank instance is less than 15 minutes.

#### Software needed:

1. Use Firefox SQLite Manager to interact with your database as described at the <a href="https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/UseCasesFiles/UseCasePage/SQLite_Instructions.md" target="_blank"> SQLite Instructions </a>page.    
*[Optional...Not needed here]* You could use this SQLite engine to create databases and load them with data through the CMD terminal https://www.sqlite.org/index.html   
For Windows machines (32 or 64 bits), download the “sqlite-shell-win32-x86-3081002” instance

2. Use the <a href="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Blank_Database/WaM-DaM_for_SQLite.sql" target="_blank"> SQLite DDL </a> script to create blank WaM-DaM database 

3. Fill your data into these <a href="https://github.com/amabdallah/WaM-DaM/tree/master/03WaM-DaM_Schema/Blank_Database" target="_blank"> blank Excel Workbooks </a> 

4. Use this <a href="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/MatlabScript/AutomateLoadingDataToWaMDaM_08_24_2015.m" target="_blank"> Matlab script </a> to automate loading your data into your SQLite WaM-DaM database.    
**Note** You need to install the Database Toolbox which doesn’t come with the standard Matlab software. Alternatively, you also can use Python, R, or any scripting language that supports ODBC/JDBC to load data to your database. 

##A. Setup a SQLite database with a blank WaM-DaM instance

If you dont have SQLite Add-on Manager installed on Firefox, first, follow the <a href="https://github.com/amabdallah/WaM-DaM/blob/master/02UseCases/UseCasesFiles/UseCasePage/SQLite_Instructions.md" target="_blank"> instructions </a> to set up SQLite manager. Then follow these steps to create a new blank WaM-DaM database and load your data into it using Matlab and the Excel blank workbooks. 

1. Add your new Database in SQLite Manager    
<img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite4.png" alt="alt text" width="350" height="280"><img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite5.png" alt="alt text" width="350" height="280">   

2. Create blank WaM-DaM database     
<img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite6.png" alt="alt text" width="350" height="280"><img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/SQLite7.png" alt="alt text" width="350" height="280">   

##B. Connect Matlab with SQLite through the JDBC driver 
Follow these <a href="http://www.mathworks.com/help/database/ug/sqlite-jdbc-windows.html" target="_blank"> Matlab instructions </a> to set up a JDBC driver in Matlab so it can communicate with any SQLite database.   

1. Launch the Database Toolbox in Matalb     
<img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/Matlab1.JPG" alt="alt text" width="450" height="320">

2. Set up the JDBC connection    
<img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/Matlab2.JPG" alt="alt text" width="450" height="320">

2. Connect Matlab with SQLite    
<img src="https://github.com/amabdallah/WaM-DaM/blob/master/03WaM-DaM_Schema/Sceenshots/Matlab3.JPG" alt="alt text" width="450" height="320">







