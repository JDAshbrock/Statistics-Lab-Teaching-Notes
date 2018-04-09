# Compute the Correlation coefficient after cleaning data in the 
# All countries data set. The first two functions are data-cleaners

# This function takes two lists as input and outputs the indices for which
# neither of the list has an NA entry
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

require("Lock5Data")
data(AllCountries)
GDP <- as.numeric(AllCountries[ ,5])
Electricity_Usage <- as.numeric(AllCountries[ ,24])
indices <- Simul_Clean_NA(GDP,Electricity_Usage)
GDP <- GDP[indices]
Electricity_Usage <- Electricity_Usage[indices]
dataset <- data.frame(GDP,Electricity_Usage)
lm(formula = Electricity_Usage ~ GDP, data=dataset)
cor(GDP,Electricity_Usage)
plot(GDP, Electricity_Usage)
abline(1020.24, 0.1892)





# What is the outlier?
len <- length(GDP)
desired_countries<- c()
for (i in 1:len){
	if(Electricity_Usage[i] > 40000){
		desired_countries <- c(desired_countries, i)
	}
}
as.character(AllCountries[desired_countries[1],1])




