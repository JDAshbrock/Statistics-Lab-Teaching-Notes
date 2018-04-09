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
data(AllCountries)
pop <- as.numeric(AllCountries[ , 5])
mil <- as.numeric(AllCountries[ , 17])
# Clean the data and store in a frame
clean_indices <- Simul_Clean_NA(pop,mil)
clean_mil <- mil[clean_indices]
clean_pop <- pop[clean_indices]
clean_data <- data.frame(clean_pop, clean_mil)
# Define vector of squares to regress on
clean_pop2 <- clean_pop^2
my_model = lm(formula = clean_mil ~ ), data=clean_data)
