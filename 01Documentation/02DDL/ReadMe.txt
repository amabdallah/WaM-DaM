This ReadMe text helps you create blank database scheams for MySQL, MS SQL Server, SQLite, and PostgreSQL, at once. You only provde the XML Schema from DBWrench to the script.

Adel Abdallah
June 15, 2016
------------------ 

Open the CMD Terminal 
Windows>Start>Accessories>CMD

First navigate to the folder where all the Python script resides 
stay the same directory of 
C:\Users\AdelMabdallah\Desktop
cd Desktop
cd DDL

Edit the name of XML Schema in the build_ddl.py python file and the default schema name 
For example:
input_file = 'WaMDaMAugust19_2015'
default_schema = 'WaMDaMAugust19_2015'

% Execute this command line at the CMD terminal while still at the directory above
% copy and past this line after you change thee WaM-DAM.xml name below 

build_ddl.py -d all -x WaMDaMAugust19_2015.xml -o wamdam_ddl

the Pythos script should build four DDL schemas.......done 


