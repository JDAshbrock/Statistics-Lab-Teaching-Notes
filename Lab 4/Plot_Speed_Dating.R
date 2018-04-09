#names(SpeedDating)
# [1] "DecisionM"        "DecisionF"        "LikeM"            "LikeF"           
# [5] "PartnerYesM"      "PartnerYesF"      "AgeM"             "AgeF"            
# [9] "RaceM"            "RaceF"            "AttractiveM"      "AttractiveF"     
#[13] "SincereM"         "SincereF"         "IntelligentM"     "IntelligentF"    
#[17] "FunM"             "FunF"             "AmbitiousM"       "AmbitiousF"      
#[21] "SharedInterestsM" "SharedInterestsF"

Plot_SD_Columns <- function(Column1,Column2,scatterX,scatterY) {
require("Lock5Data")
data(SpeedDating)
if(missing(scatterX)){
	scatter1 == FALSE
}

if(missing(scatterY)){
	scatter2 == FALSE
}

Data1 <- as.numeric(SpeedDating[ , Column1])
Data2 <- as.numeric(SpeedDating[ , Column2])

# Scatter the points to see multiplicity, if desired
if(scatterX == TRUE){
	Data1 <- Data1 + runif(276, -0.2,0.2)
}
if(scatterY == TRUE){
	Data2 <- Data2 + runif(276,-0.2,0.2)
}

plot(Data1, Data2)
}

