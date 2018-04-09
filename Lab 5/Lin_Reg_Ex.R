
# NOTE that this function is actually plotting population versus 
# military spending as a percentage of total budget
# Column 11 is actually the total armed forces


require("Lock5Data")
data(AllCountries)
pop <- as.numeric(AllCountries[ , 3])
mil <- as.numeric(AllCountries[ , 9])
My_data = data.frame(pop,mil)

# The following line implements a function I WROTE 
# which returns the indices for which neither list has an NA at that index
# This is my method for deleting NA values
clean_indices <- Simul_Clean_NA(pop,mil)
clean_mil <- mil[clean_indices]
clean_pop <- pop[clean_indices]
clean_data <- data.frame(clean_pop, clean_mil)

# Compute the model and coefficient of determination
lm(formula = clean_mil ~ clean_pop, data = clean_data)
cor(clean_mil,clean_pop)

# The following code plots the unfiltered data
plot(clean_pop,clean_mil)
# The following entries came from the lm function
abline(6.866975, 0.009537)

# Filtering Outliers (which were determined visually)
filtered_mil <- c()
filtered_pop <- c()
len <- length(clean_mil)
for(i in 1:len){
	if(clean_mil[i]<20 && clean_pop[i]<1000){
		filtered_mil <- c(filtered_mil, clean_mil[i])
		filtered_pop <- c(filtered_pop, clean_pop[i])
	}
}

# Compute new LSRL and coefficient of determination
filtered_data <- data.frame(filtered_pop,filtered_mil)
lm(formula = filtered_mil ~ filtered_pop, data=filtered_data)
# dev.new() opens a new plotting window if we want to compare
dev.new()
plot(filtered_pop,filtered_mil)
abline(5.3936,0.0338)
cor(filtered_mil,filtered_pop)


		