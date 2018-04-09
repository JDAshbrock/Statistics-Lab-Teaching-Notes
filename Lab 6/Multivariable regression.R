# Cleaning Function
Simul_Clean_NA <- function(list1, list2){
indices <- c()
len <- length(list1)
for(i in 1:len){
	if(!is.na(list1[i]) && !is.na(list2[i])){
		indices <- c(indices, i)
	}
}
return(indices)
}
# Load desired data
require("Lock5Data")
data(BodyFat)

BF <- as.numeric(BodyFat[ , 1])
weight <- as.numeric(BodyFat[ ,3])
neck <- as.numeric(BodyFat[ ,5])
wrist <- as.numeric(BodyFat[ ,10])
height <- as.numeric(BodyFat[ ,4])
chest <- as.numeric(BodyFat[ , 6])
frame = data.frame(BF, weight,neck,wrist)


model = lm(formula = BF ~  weight + wrist + height + chest + neck)
summary(model)

