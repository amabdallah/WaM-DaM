#### The Water Management Data Model (WaM-DaM)

Water Management Data Model (WaM-DaM) is a persistent information model (like a standard) to help scientists and practitioners like you to organize all of your water management data (input and output of models) consistently in a single database. WaM-DaM then can help you search and discover data from sources to build models and interpret their data correctly. 
Think of WaM-DaM as a repository of water management data (purple cylinder) and a translator between numerous data sources on the left and different models on the right (see flowchart). WaM-DaM translates two aspects of the data: the syntax and semantics. WaM-DaM will speed the time to find, organize, and synthesize data from different sources and prepare data for modeling.
**This GitHub repository is organized to direct you to** **i)** understand WaM-DaM design, **ii)** follow uses cases that demonstrate WaM-DaM capabilites and how it works, and **iii)** set up your own WaM-DaM instances and populate it with your data. 

<img src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/WaM-DaM_workflow.jpg" alt="Drawing" style="width: 100px;"/>

#### Who can use WaM-DaM? You can use WaM-DaM if:   
1.	Your data is represented in space through nodes (points) and/or links (connections between nodes).    
2.	You have one or more data types such as binary, numeric parameters, seasonal, parameters, text parameters, file-based, rules, time series,  multi-column arrays.   
3.	You want to manage and organize all of your data for different models in a central standarized database
4.	You want to automate the process to discover and prepare your input data to models in a generic way. 
4.	You want to share and publish your data. WaM-DaM supports important metadata like sources, methods, and units to help others correctly interpret the meanings of your data.Check out the [scope](https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Scope.md) of WaM-DaM data.  

#### Getting Started with WaM-DaM
WaM-DaM is implemented in a relational database and ready for use to load your data into it it. You can choose one of these relational database systems to set up your own WaM-DaM instances: SQLite, PostGreSQL, MySQL, and Microsfot SQL Server. If you are a beginner, we recommend you to use SQLite because it is very simple to use and set up, doesn’t require a server, and you can use the free Mozilla Firefox Manager to interact with its data. 

Check out the [Instructions](https://github.com/amabdallah/WaM-DaM/tree/master/01Documentation/05Workshop) on how you can set up a WaM-DaM database in SQLite. The instructions are demonstrated live in a video screenshot :)

Check out this <a href="https://github.com/amabdallah/WaM-DaM/tree/master/01Documentation/05Workshop" target="_blank"> WaM-DaM Workshop </a>  activity to discover water management data for a WEAP model 

Check out the WaM-DaM <a href="https://github.com/amabdallah/WaM-DaM/tree/master/03UseCases" target="_blank">XML and blank database schemas</a> for SQLite, Microsoft SQL Server, PostgreSQL, and MySQL.

#### Documentation  
WaM-DaM is a set of related database tables that are organized into four groups handling different aspects of water management data:  
* Core constructs (blue) which represent the key configuring constructs of WaM-DaM modular design, 
* Metadata (orange) which represents key metadata that help users correctly and unambiguously interpret their data, 
* Controlled Vocabularies (CVs) (purple) which enforces the consistent use of terms across disparate data sources (only one CV box is shown for simplicity), and 
* Data Storage (red) which holds data values of different types based on the user’s choice (e.g., time series and text)   
![](https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/WaMDaM_Logical.jpg)

Check out this interactive WaM-DaM logical data model <a href="http://amabdallah.github.io/WaM-DaM/" target="_blank">(WaM-DaM schema)</a> and see the full [Documentation](https://github.com/amabdallah/WaM-DaM/tree/master/01Documentation) abou WaM-DaM architecture

#### Use Cases
In the Getting Started with WaM-DaM section above, you can get an empty database of WaM-DaM. Then the Documentation section gives you an idea about WaM-DaM tables, what they mean, and how they are connected with each other. This section provids sizx used cases that demonestrate the capabilities of WaM-DaM and how users can benifeit from it. These uses cases need the prepopulated WaM-DaM SQLite database. Check out the SQL scripts that guide you for the <a href="https://github.com/amabdallah/WaM-DaM/tree/master/03UseCases" target="_blank">use cases</a>     

Check out more info about the project and [Rationale and Context](https://github.com/amabdallah/WaM-DaM/blob/master/docs/Rationale_Context.md) of WaM-DaM development

#### Publications
A preliminary WaM-DaM design was published in 2014 as a peer-reviewed conference paper:
<a href="http://www.iemss.org/sites/iemss2014/papers/iemss2014_submission_406.pdf" target="_blank">WaM-DaM:A Data Model to Organize and Synthesize Water Management Data</a> 

You can download the EndNote citation [file](https://github.com/amabdallah/WaM-DaM/blob/master/Files/WaMDaM_AbdallahRosenberg.enw)

#### Presentations
Check out the professional and conference [presentations](https://github.com/amabdallah/WaM-DaM/blob/master/docs/Presentations.md) along the way of WaM-DaM development 

### Future Work and Limitations 
There are numerous opportunities for <a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/Future_Work.md" target="_blank">futute work </a> to build on on WaM-DaM and benifit from its design. Several of these opportunities need to overcome the <a href="https://github.com/amabdallah/WaM-DaM/blob/master/docs/Limitations.md" target="_blank">limitations</a>
 of the current design and improve it.  

### LICENSING
Materials in this GitHub repository are disturbed under a BSD 3-Clause license (see           [LICENSE](https://github.com/amabdallah/WaM-DaM/blob/master/LICENSE.md)). 
For alternative licensing arrangements, contact Adel M. Abdallah or David E. Rosenberg directly.    

## AUTHOR and CONTACT
For more info, please free to email    
<a href="http://www.engr.usu.edu/cee/faculty/derosenberg/students.htm" target="_blank"> Adel Abdallah </a> at: amabdallah@aggiemail.usu.edu 

   

<a title="Adel M. Abdallah" href="https://www.researchgate.net/profile/Adel_Abdallah4/"><img src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/ResearchGate.png" alt="Adel M. Abdallah" /></a> <a title="Adel M. Abdallah" href="http://www.mendeley.com/profiles/adel-abdallah2/"><img 
src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/mendeley.png" alt="Adel M. Abdallah" /></a><a title="Adel M. Abdallah" href="http://scholar.google.com/citations?user=l5SLhK8AAAAJ&hl=en"><img 
src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/GoogleScholar.png" alt="Adel M. Abdallah" /></a><a title="Adel M. Abdallah" href="https://www.linkedin.com/in/adelmabdallah"><img 
src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/Linkedin.png" alt="Adel M. Abdallah" /></a><a title="Adel M. Abdallah" href="https://usu.academia.edu/AdelMAbdallah"><img 
src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/Academia.png" alt="Adel M. Abdallah" /></a><a title="Adel M. Abdallah" href="https://twitter.com/AdelMAbdallah"><img 
src="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/Icons/Twitter.png" alt="Adel M. Abdallah" /></a>

<a href="http://www.engr.usu.edu/cee/faculty/derosenberg/" target="_blank"> David Rosenberg </a> at: david.rosenberg@usu.edu

## Sponsors and Credit 
WaM-DaM development is supported by the National Science Foundation Grant <a href="http://www.nsf.gov/awardsearch/showAward?AWD_ID=1135482" target="_blank">NSF grant</a> . Any opinions, findings, and conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the National Science Foundation.   

[![NSF](http://www.nsf.gov/images/logos/nsf1v.jpg)](http://www.nsf.gov/awardsearch/showAward?AWD_ID=1135482&HistoricalAwards=false)[![CI-Water](http://ci-water.org/images/logo/ciwater.png)](http://ci-water.org/)


