# [1] "Country"        "LandArea"       "Population"     "Density"       
# [5] "GDP"            "Rural"          "CO2"            "PumpPrice"     
# [9] "Military"       "Health"         "ArmedForces"    "Internet"      
#[13] "Cell"           "HIV"            "Hunger"         "Diabetes"      
#[17] "BirthRate"      "DeathRate"      "ElderlyPop"     "LifeExpectancy"
#[21] "FemaleLabor"    "Unemployment"   "EnergyUse"      "Electricity"   
#[25] "Developed" 

Plot_Countries <- function(Column1,Column2,scatterX,scatterY) {
require("Lock5Data")
data(AllCountries)
if(missing(scatterX)){
	scatterX == FALSE
}

if(missing(scatterY)){
	scatterY == FALSE
}

Data1 <- as.numeric(AllCountries[ , Column1])
Data2 <- as.numeric(AllCountries[ , Column2])

# Scatter the points to see multiplicity, if desired
if(scatterX == TRUE){
	Data1 <- Data1 + runif(217, -0.2,0.2)
}
if(scatterY == TRUE){
	Data2 <- Data2 + runif(217,-0.2,0.2)
}

plot(Data1, Data2)
}

