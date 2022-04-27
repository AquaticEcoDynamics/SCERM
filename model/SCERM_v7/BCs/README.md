# SCERM BC Files

All BC files are created via the one control script:

https://github.com/AquaticEcoDynamics/aed_matlab_modeltools/blob/master/TUFLOWFV/site_processing/swan/Inflows/run_all_inflows.m

This script requires the folowing pre-processed data:

- WIR data (swan.mat)
- Oxygenation plant operational data (oxy.mat)
- Tidal data (tidaldata.mat).

Each BC file is configured and created by separate functions, (e.g create_interpolated_BC_for_inflow_Fremantle.m, create_interpolated_BC_for_inflow_Helena.m). The breakdown of species, secondary variable calculations and other site specific decisions are all contained within each functions. 
E.G. 

https://github.com/AquaticEcoDynamics/aed_matlab_modeltools/blob/master/TUFLOWFV/site_processing/swan/Inflows/functions/create_interpolated_BC_for_inflow_Fremantle.m

**Additional Processing**

Given the long timeframe of the SCERM simulations and that the data holes that exist in the field data, serveral post processing functions are required.

This function updates flow for the following sites with flow calculated from Height by Amina.
```
replace_flows_with_calculated.m; 

     'Bayswater_Inflow.csv',...
     'Bennet_Inflow.csv',...
     'Ellenbrook_Inflow.csv',...
     'Helena_Inflow.csv',...
     'Jane_Inflow.csv',...
     
 ```    
Currently tidal data has not been reported for 2019, so 2019 tidal height is supplied by SCEVO via the function:
```
merge_tidal_data_2019;
```

