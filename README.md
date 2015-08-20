## The Water Management Data Model (WaM-DaM)

WaM-DaM is a persistent information model (like a standard for a database) to help scientists and practitioners like you to consistently organize all of your water management data (input and output of models) in a single database. WaM-DaM also can help you search and discover data from sources to build models and interpret your data correctly. We proposed WaM-DaM as a basis for a software standard to automate the process to automate discovering data for water management models.    

Think of WaM-DaM as a repository of water management data (purple cylinder) and a translator between numerous data sources on the left and different models on the right (see flowchart). WaM-DaM translates two aspects of the data: the syntax (i.e., structure) and semantics (terminology). WaM-DaM will speed the time to find, organize, and synthesize data from different data sources, and prepare data for modeling.   

<img src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/WaM-DaM_workflow.jpg" alt="Drawing" style="width: 100px;"/>     

**This GitHub repository is organized to direct you to**   
**i)** Understand WaM-DaM design and its schema,    
**ii)** Follow use cases that demonstrate WaM-DaM capabilities and how it works, and    
**iii)** Set up your own WaM-DaM instance and populate it with your data.    

==============================
### Use Cases: What Can WaM-DaM Do?      
WaM-DaM capabilities are demonstrated through six generic use cases that follow the user needs to discover data for their models. You can see and examine these use cases using a prepopulated WaM-DaM SQLite database with the provided SQL commands at the <a href="https://github.com/amabdallah/WaM-DaM/tree/master/02UseCases" target="_blank">use cases</a> page.     


==============================
### Getting Started with WaM-DaM: Get a Copy of WaM-DaM!    
WaM-DaM is implemented in a relational database and ready to load your data into it in SQLite, PostgreSQL, MySQL, and Microsoft SQL Server database systems. You can get a copy of WaM-DaM XML schema, blank copies for the four database systems, and instructions on how to set up a SQLite database at the <a href="https://github.com/amabdallah/WaM-DaM/tree/master/03WaM-DaM_Schema" target="_blank">WaM-DaM Schema</a> page.    


==============================
### WaM-DaM Logical Model: See the Beautiful WaM-DaM!    
This interactive WaM-DaM logical data model is at the <a href="http://amabdallah.github.io/WaM-DaM/diagrams/Full.html" target="_blank">Logical Model</a> page. The schema shows WaM-DaM tables and their attributes, what they mean, and how they are connected with each other. You can see a simpler abstract design schematics and the full documentation of WaM-DaM design at the <a href="https://github.com/amabdallah/WaM-DaM/tree/master/01Documentation" target="_blank">Documentation</a> page.   


==============================
### Who Can Use WaM-DaM? You Can Use it, if:   
*	Your data is represented in space through nodes (points) and/or links (connections between nodes).
*	You have one or more data types for your attributes such as binary, numeric parameters, seasonal, parameters, text parameters, file-based, rules, time series,  multi-column arrays,    

**and you want to**   

1.	Manage and organize all of your data for different models in a central standardized database
2.	Automate the process to discover and prepare your input data to models, and  
3.	Share and publish your data. WaM-DaM supports important contextual metadata like sources, methods, and units to help others correctly interpret the meanings of your data. 


==============================
### Publications and Presentations 
A preliminary WaM-DaM design was published as a peer-reviewed conference paper:<a href="http://www.iemss.org/sites/iemss2014/papers/iemss2014_submission_406.pdf" target="_blank">WaM-DaM:A Data Model to Organize and Synthesize Water Management Data</a> at the <a href="http://www.iemss.org/sites/iemss2014/" target="_blank">iEMSs 2014</a> Here you can download the <a href="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/04Presentations/Files/WaMDaM_AbdallahRosenberg.enw" target="_blank">EndNote citation </a> 
    
You also can check out the professional and conference
<a href="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/04Presentations/ReadMe.md" target="_blank">presentations</a> along the way of WaM-DaM development 


==============================
### Future Work and Limitations 
There are numerous opportunities for <a href="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/03Limitations_FutureWork/Future_Work.md" target="_blank">future work </a> to build on WaM-DaM and benefit from its design in applications. Several of these opportunities may overcome the <a href="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/03Limitations_FutureWork/Limitations.md" target="_blank">limitations</a> of the current design and improve it to be a standard for communicating systems analysis data.


==============================
### Licensing
WaM-DaM and materials in this GitHub repository are disturbed under a BSD 3-Clause license (see           [LICENSE](https://github.com/amabdallah/WaM-DaM/blob/master/LICENSE.md)). 
For alternative licensing arrangements, contact Adel M. Abdallah or David E. Rosenberg directly.    


==============================
### Authors and Contact
For more info, contact Adel Abdallah @       
amabdallah@aggiemail.usu.edu    
<a  href="http://www.engr.usu.edu/cee/faculty/derosenberg/students.htm" target="_blank"><img 
src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/Home.png"/></a><a href="https://www.researchgate.net/profile/Adel_Abdallah4/" target="_blank"><img src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/ResearchGate.png"/></a> <a href="http://www.mendeley.com/profiles/adel-abdallah2/" target="_blank"><img src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/mendeley.png"/></a><a href="http://scholar.google.com/citations?user=l5SLhK8AAAAJ&hl=en" target="_blank"><img 
src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/GoogleScholar.png" /></a><a href="https://www.linkedin.com/in/adelmabdallah" target="_blank" target="_blank"><img 
src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/Linkedin.png"/></a><a href="https://usu.academia.edu/AdelMAbdallah" target="_blank"><img 
src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/Academia.png"/></a><a  href="https://twitter.com/AdelMAbdallah" target="_blank"><img 
src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/Twitter.png"/></a>    
Or    
<a href="http://www.engr.usu.edu/cee/faculty/derosenberg/" target="_blank"> David Rosenberg </a> @    
david.rosenberg@usu.edu


==============================
### Sponsors and Credit 
WaM-DaM development is supported by the National Science Foundation <a href="http://www.nsf.gov/awardsearch/showAward?AWD_ID=1135482" target="_blank">grant</a> . Any opinions, findings, and conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the National Science Foundation.    

WaM-DaM is developed at the Utah Water Research Lab at Utah State University during the period of August, 2012-2015. Check out the <a href="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Rationale_Context.md" target="_blank">Rationale and Context</a> of WaM-DaM development and how it fits with other efforts in this field.  


<a  href="http://www.nsf.gov/awardsearch/showAward?AWD_ID=1135482&HistoricalAwards=false" target="_blank"><img src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/nsf1v.jpg"/></a><a  href="http://ci-water.org/" target="_blank"><img src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/ciwater.png"/></a><a  href="http://uwrl.usu.edu/" target="_blank"><img src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/uwrl.png"/></a><a  href="http://www.usu.edu/" target="_blank"><img src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/usu.jpg"/></a> 

