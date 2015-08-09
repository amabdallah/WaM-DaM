This ReadMe text helps you create blank database scheams for MySQL, MS SQL Server, SQLite, and PostgreSQL, at once. You only provde the XML Schema from DBWrench to the script.

Open the CMD Terminal 
Windows>Start>Accessories>CMD

First navigate to the folder where all the Python script resides 
stay the same directory of 
C:\Users\AdelMabdallah\Desktop
cd Desktop
cd DDL

Edit the name of XML Schema in the build_ddl.py python file and the default schema name 
For example:
input_file = 'WaMDaMAugust2015.xml'
default_schema = 'WaMDaMAugust2015'

% Execute this command line at the CMD terminal while still at the directory above
% copy and past this line after you change thee WaM-DAM.xml name below 

build_ddl.py -d all -x WaMDaMAugust2015.xml -o wamdam_ddl

the Pythos script should build four DDL schemas.......done as shown at this snapshot 

![]https://github.com/amabdallah/WaM-DaM/blob/master/Files/DDL/SnapshotOfResult_DDL_cmd.JPG





Credit: This is an adapted script that is originally writen by Tony Castronova at Utah State University 
https://github.com/ODM2/ODM2/tree/master/src/build_schemas
