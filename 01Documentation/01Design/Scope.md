### Scope of WaM-DaM 

####Water Management Data 
Water management data is a broad encompassing term but it is used here in the context of systems analysis that involves decision making in allocating water for competing demands with crossover with other resources like energy and money. These systems data include among others i) natural hydrologic systems like lakes, streams, and groundwater, ii) engineered infrastructure systems like reservoirs, canals, and distribution networks, iii) economic data like water prices, costs, revenues, iv) environment data like minimum flows and water quality, v) driving climate data that affect water demand and supply like precipitation and evaporation, and vi) human interactions like system operation rules and supply and demand management actions, and vii) model output data like water deliveries and shortages to demand sites and energy generated from hydropower. 

In systems analysis, water management data can be represented in space through water system components that are connected with relationships. These components might be geo-referenced and drawn to scale or they could be conceptual schematics. Water management data also involves different configurations of networks as scenarios due to policy changes. Water management data may change with time like time series data or might not change like a maximum capacity attribute for reservoir or a pipe. 

Systems analysis methods use the concept of nodes and links to represent system components and their interactions. A node or a link is an abstract of a conceptual or real system component that could have a geometric shape into points and lines. Here a node is an abject that can be represented as a point in its center with its attributes (e.g., demand site, reservoir, and watershed). A link represents an object that connects two nodes and transports resources between them (e.g., a pipe that connects a pump station and a house, or a river reach that connects two reservoirs). Systems analysis represents links as one-dimension lines.

Other approaches use a mix of grids, triangulated networks, and node and links networks to represent their data in space like in Arc Hydro (Maidment, 2002), AdHydro (Lai et al., 2013), and Arc SWAT (Olivera et al., 2006). Systems analysis data as the focus on this paper aggregates internal changes within objects and represents them in the center of the node or constant along the link (Loucks et al., 2005). Therefore, tracking spatial changes longitudinal and cross-sectional data within nodes (e.g., watershed) like Arc SWAT (Soil Water Assessment Tool) (Olivera et al., 2006) or within links like in the RiverML Data Model (Jackson, 2014) and the Arc River Data Model (Kim et al., 2015) is out of the scope of WaM-DaM. systems analysis aggregate internal distributed changes within node and link objects and focus on the interaction between them as driving forces.


So distributed water management data are out of the scope of WaM-DaM because WaM-DaM is specifically designed to support systems analysis water management data. A systems analysis model might represent the complex system of groundwater supply and recharge in a region by a node that aggregates supply and recharge variables to study their interactions with other system components like agricultural demand site (Figure 1)
                        ![](https://github.com/amabdallah/WaM-DaM/blob/master/01Documentation/01Design/ExampleNetworksFinal.jpg)
 
Figure 1: Systems analysis schematic for a water supply network. Shapes and colors are used to distinguish different types of nodes. Links’ types are not shown here for simplicity.


##### Referneces:
Jackson, S.R., 2014. RiverML: A Harmonized Transfer Language for River Hydraulic Models, Civil, Architectural, and Environmental Engineering. University of Texas at Austin.  

Kim, D., Muste, M., Merwade, V., 2015. A GIS-based relational data model for multi-dimensional representation of river hydrodynamics and morphodynamics. Environmental Modelling & Software 65(0) 79-93.  

Lai, W., Steinke, R.C., Ogden, F.L., Douglas, C., Miller, S.N., Zhang, Y., 2013. ADHydro: A Large-scale High-resolution Multi-physics Distributed Water Resources Model for Water Resources Simulations in a Parallel Computing Environment, AGU Fall Meetings: San Francisco, USA.  

Loucks, D.P., Van Beek, E., Stedinger, J.R., Dijkman, J.P., Villars, M.T., 2005. Water resources systems planning and management: an introduction to methods, models and applications. Paris: UNESCO.   

Maidment, D.R., 2002. Arc hydro : GIS for water resources. ESRI Press, Redlands, Calif.  
Loucks, D.P., Van Beek, E., Stedinger, J.R., Dijkman, J.P., Villars, M.T., 2005. Water resources systems planning and management: an introduction to methods, models and applications. Paris: UNESCO.

Olivera, F., Valenzuela, M., Srinivasan, R., Choi, J., Cho, H., Koka, S., Agrawal, A., 2006. ARCGIS-SWAT: A Geodata Model And GIS Interface For SWAT. JAWRA Journal of the American Water Resources Association 42(2) 295-309.   
