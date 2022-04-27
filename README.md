

# SCERM


[![TUFLOW-FV](https://img.shields.io/badge/TUFLOW--FV-2020.008-yellow)](https://tuflow.com/products/tuflow-fv/)
[![AED](https://img.shields.io/badge/AED-2.0.0-brightgreen)](https://aquatic.science.uwa.edu.au/research/models/AED/quickstart.html)
[![GPLv3 license](https://img.shields.io/badge/License-GPLv3-blue.svg)](http://perso.crans.org/besson/LICENSE.html)


## The Swan-Canning Estuarine Response Model

This repository houses the hydrodynamic-biogeochemical model for the [Swan Canning estuary](https://parks.dpaw.wa.gov.au/park/swan-canning-riverpark), located in Perth, Western Australia. 

The model uses the TUFLOW-FV 3D finite volume hydrodynamic model, and the AED water quality model.

Various generations of the model system exist and are archived; here the latest SCERM generation is active - SCERM v7. The model supports the Swan Canning Virtual Estuary Observatory (SCEVO) system and is used to improve understanding of management efforts and climate change.

## Usage

This repository includes the model files required for a TUFLOW-FV - AED simulation run. Running the setup contained herein requires users to have an active TUFLOW-FV license with the AED [pre-compiled plugin](https://aquatic.science.uwa.edu.au/research/models/AED/quickstart.html). Input files and model output files are able to be processed using the aed_matlab_modeltools repository and supporting scripts and site data. Please contact the developers for further information.

## References

Huang, P., Trayler, K., Wang, B., Saeed, A., Oldham, C.E., Busch, B. and Hipsey, M.R., 2019. An integrated modelling system for water quality forecasting in an urban eutrophic estuary: The Swan-Canning Estuary virtual observatory. Journal of Marine Systems, 199, p.103218.

Huang, P., Kilminster, K., Larsen, S. and Hipsey, M.R., 2018. Assessing artificial oxygenation in a riverine salt-wedge estuary with a three-dimensional finite-volume model. Ecological Engineering, 118, pp.111-125.

Paraska, D., Zhai, S., Busch, B., Oldham, C.E., Huang, P., Dang, V.H. and Hipsey, M.R., 2022. Hydrological and nutrient modelling of the Swan Canning catchment-estuary system. Cooperative Research Centre for Water Sensitive Cities, Melbourne, Australia. 
