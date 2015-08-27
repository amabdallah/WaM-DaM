## Future Work

The design of WaM-DaM is limited to experience drawn from the reviewed water data systems, used data sources, and demonstrated use cases. Future work can incorporate complex and unanticipated aspects of water management data as an improvement to the current design and overcome current <a href="https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/03Limitations_FutureWork/Limitations.md" target="_blank">limitations<a\>. There are several opportunities for future work that can build on WaM-DaM specifications. We are already undertaking many of the opportunities and there are several promising ideas.

### A. Currently undertaken 

#### 1. An Integrated Method to Couple Water Management Data and Serve it to Models
This is my second chapter of my Dissertation. **Details are coming soon** :) 

#### 2. Publish and Share Water Management Data through web services 
WaM-DaM specifications could be used to publish water management data using a standardized Json web language. We have been discussing several approaches and here is a short [proposal](https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/03Limitations_FutureWork/Publish_ShareData.docx) of one of the ideas.

#### 3. Add a new Resource Type to HydroShare 
Here is a short [proposal](https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/03Limitations_FutureWork/WaM_DaM_HydroShare_Linkage.docx) of the rough idea. 

#### 4. Organize water management data for the AdHydo Model    
The AdHydro team at the University of Wyoming needs a "static" database that can organize water management data for the Upper Colorado watershed model. This work is underway....   

### B. Future Promising opportunities to build on WaM-DaM

#### 1. Controlled Vocabularies and Ontology for Water Resources Management Data   
Develop comprehensive lists of controlled vocabularies and ontology for diverse water management data similar to the work by Piasecki and Beran (2009). The list can be complied by holding workshops at conferences and inviting interested people. Online tools also should be used to allow the water resources community to submit suggested vocabulary similar to the work by Horsburgh et al. (2014). The compiled vocabularies should be tested against larger data sets across different disciplines of water management.    

#### 2. WaM-DaM HydroDesktop Plugin to Discover, Download, Visualize Water Management Data [Idea on hold]
Use the controlled vocabulary and ontology in [B.1] and the developed web-services in [A.2] to communicate with remote servers to discover instances of water management data and download it. Use DotSpatial open-source GIS libraries to visualize water management networks (e.g., different shapes and sizes for nodes and links). Adapt existing HydroDesktop tools to visualize and analyze water management time series data (Ames et al., 2012).   
There has been discussions to use a Web-based platform like Tythes instead of HydroDesktop. Updates will come whenever this idea mature enough.

#### 3. Workflows to link WaM-DaM with Hydra and WaDE Web Services
Link WaM-DaM web-services with WaDE web services for water use and availability in seventeen Western States in the US (Larsen and Young, 2014). Thus, WaDE can serve as important data source to WaM-DaM. Also link WaM-DaM web-services with HydraPlatform web-services to leverage the capabilities of HydraPlatform to visualize data and serve it to different models (Knox et al., 2014). HydraPlatform users also can use WaM-DaM metadata and semantic consistency to publish and share and publish their data with others according to WaM-DaM method.

The National Science Foundation (NSF) is calling for Critical Techniques and Technologies for Advancing Foundations and Applications of Big Data Science & Engineering (BIGDATA) Crosscutting Programs. The five identified future research opportunities fit very well with such call as they will help harness, share, publish, and visualize big water resources management data.

#### 4. WaM-DaM to Organize Data for Water-Energy-Food Nexus 
Energy generation, distribution, and use systems are analogous to water resources. Water and energy resources are inextricably linked from their generation to their consumption. Most energy sources need water for cooling and water resources need energy pump, supply, and treat water and wastewater. Water end-uses need energy to heat water for sanitation (Abdallah and Rosenberg, 2014). In addition, food production requires water and energy. Thus, WaM-DaM could be adapted and tested to organize energy and food resources data to help relate these three important resources together.
The NSF is calling for Innovations at the Nexus of Food, Energy and Water Systems (INFEWS). WaM-DaM can serve as a basis to integrate and relate data across the three resources.     


#### 5. A Repository for the Great Salt Lake River Basins Models  
There is an opportunity to use WaM-DaM as a repository of models for the three major rivers basins that end at the Great Salt Lake: Bear, Weber, and Jordan River. Each of these river basins already has a systems model to simulate its water allocation. WaM-DaM could be used as a repository of data for the three models. Users of researchers and water managers can use the repository to access data for the three basins. The repository could be used to build a united systems models for the three basins as well. The <a href="http://greatsaltlakeinfo.org/" target="_blank">Great Salt Lake Information System</a> provides time series data for the Great Salt Lake and the WaM-DaM repository could be added to this information system. There is an opportunity to seek funds from the <a href="http://ffsl.utah.gov/index.php/grant-programs/state-lands-research-grants" target="_blank">Great Salt Lake Research Grants</a>. Although data management is not among the hot topics sought for these grants. A repository idea seems to fit very well with the ultimate goal of these grants as cited here:    
*The Utah Department of Natural Resources, Division of Forestry, Fire & State Lands requests proposals for research projects that will assist the Division in becoming better informed stewards of Great Salt Lake. It is the intent of the Division to gain a better understanding of the lake system which leads to informed decision making regarding long-term management of this important ecosystem.* Building a repository of consistent data for the river basins serves as a step forward to respond to the recent [Utah State Legislature audit](http://le.utah.gov/audit/15_01rpt.pdf) about the projections of Utah's Water Needs. The repository will better inform the decisions makers of the availability of and projections of water use in these three important river basins.

#### 6. WaM-DaM 2.0: Improved Design for Complex Water Management Models 
To solicit WaM-DaM as a community standard, WaM-DaM should be further tested with very complex and large water management models like the Colorado Water Management and Allocation Model (RiverWare) (Zagona et al., 2001), the California Hydro-Economic Model (HOBBES) (Jenkins et al., 2004) and the HydroBase for the State of Colorado water management data which contains several gigabytes of surface, groundwater, water infrastructure, and water rights among others. HydroBase contains over two hundred tables and can serve as a comprehensive testing example for WaM-DaM 2.0 (Malers et al.)

Further developments and refinement to WaM-DaM needs the engagement from the larger water resources community that is involved in the fields of systems analysis and hydroinformatics. This community is mostly represented at the Environmental & Water Resources Institute <a href="http://www.asce.org/environmental-and-water-resources-engineering/environmental-and-water-resources-institute/" target="_blank">(EWRI)</a> of the American Society of Civil Engineers, the Consortium of Universities for the Advancement of the Hydrologic Science Inc., <a href="https://www.cuahsi.org/" target="_blank">(CUAHSI)</a>, and the International Environmental Modelling & Software Society <a href="http://www.iemss.org/society/" target="_blank">(iEMSs)</a>

We invite these communities of scientists and users to engage in further testing to WaM-DaM and provide feedback to improve it. WaM-DaM can serve as a first step towards a standard to organize and communicate systems analysis water management data. 
