Table 1 Variables input into SCERM from either observed daily data (obs), the catchment model (catch) or as a function of catchment model inputs and observed data.

|Required Variable			|Unit			|Conversion								|
|---------------------------|---------------|---------------------------------------|
|Flowcatch					|m3 s-1 		|	Input from catchment model          |
|Salinity					|PSU			|	Observed data                       |
|Temperature				|	°C			|	Observed data                       |
|TSS						|	mg L-1		|	Observed data                       |
|Oxygen						|mmol m-3		|Observed data                          |
|Silica						|mmol m-3		|Observed data                          |
|Particulate organic P (POP)|	mmol m-3	|	Observed data                       |
|Total Chl-a (TCHLA)		|	ug L-1		|	Observed data                       |
|NH4+						|mmol m-3		|TNcatch × (NH4+obs / TNobs)            |
|NO3-						|mmol m-3		|TNcatch × (NO3-obs / TNobs)            |
|Dissolved organic N (DON)	|mmol m-3		|TNcatch × (DONobs / TNobs)             |
|Particulate organic N (PON)|	mmol m-3	|	TNcatch × (PONobs / TNobs)          |
|TNcatch					|	mmol m-3	|	Input from catchment model          |
|PO43-						|mmol m-3		|TPcatch × (PO43-obs / TPobs)           |
|Organic P (OP)				|mmol m-3		|TPcatch - (PO43-) – (PO43- * 0.1)|
|TPcatch					|	mmol m-3	|	Input from catchment model          |
|Dissolved organic C (DOC)	|mmol m-3		|Observed data                          |
|Particulate organic C (POC)|	mmol m-3	|	Observed data                       |



Table 2 Variables Breakdown from BC file into TFV.


|Required TFV Variable|	Processed Catchment Variable|	Conversion Factor|
|---------------------|-----------------------------|------------------|
|Flow |	Flowcatch |	1|
|Sal|	Salinity	|1|
|Temp|	Temperature|	1|
|TRACE_1|	zeroes	|1|
|AGE|	zeroes	|1|
|SS1|	TSS|0.3|
|SS2|	TSS	|0.7|
|Oxy|	Oxygen|1|
|Sil|	Silica	|1|
|NH4|	NH4+	|1|
|NO3|	NO3-|	1|
|PO4|	PO43-|	1|
|FRP_ADS|	PO43-|	0.1|
|DOC|	DOC|	0.1|
|POC|	POC	|0.5|
|DON|	DON|	0.3|
|PON|	PON|	1|
|DOP|	OP|	0.3|
|POP|	OP|	0.5|
|DOCR|	DOC|	0.9|
|DONR|	DON|	0.7|
|DOPR|	OP	|0.2|
|CPOM|	POC|	0.5|
|GRN	|TCHLA|	0.167|
|BGA|	TCHLA	|0.125|
|CRYPT|	TCHLA	|0.333|
|DIATOM	|TCHLA	|2.292|
|DINO|	TCHLA	|1.25|
|DINO_IN	|TCHLA	|0.00754717|
