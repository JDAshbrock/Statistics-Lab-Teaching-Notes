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
require("Lock5Data")
data(AllCountries)

mil <- as.numeric(AllCountries[ , 9])
arm <- as.numeric(AllCountries[ , 11])
ind <- Simul_Clean_NA(mil,arm)
mil <- mil[ind]
arm <- arm[ind]

# Lets first see a linear fit:
lin <- lm(mil ~ arm)
plot(arm,mil)
abline(lin, col="red")

#now a quadratic fit:
arm2 = arm^2
quad <- lm(mil ~ arm + arm2)
l <- seq(from = min(arm), to = max(arm), length.out=100)
d <- data.frame(arm=l, arm2=l^2)
dev.new() # new plot window
plot(arm, mil)
predictions <- predict(quad, newdata = d)
lines(l ,predictions, col=2)



# Example of overfitting the data

arm3 = arm^3
arm4 = arm^4
arm5 = arm^5


model5 <- lm(mil ~ arm+arm2+arm3+arm4+arm5)
l <- seq(from = min(arm), to = max(arm), length.out=100)
# the data frame fed into predict must have the same column names
# as the original data which was fit and must be of the same type
d <- data.frame(arm = l, arm2=l^2, arm3=l^3, arm4=l^4, arm5=l^5)
dev.new() # new plot window
plot(arm, mil, ylim = c(-20,40))
predictions <- predict(model5, newdata = d)
lines(l ,predictions, col=2)


# Even higher? Degree 8
dev.new() # new plot screen
arm6=arm^6
arm7=arm^7
arm8=arm^8
model9 <- lm(mil ~ arm+arm2+arm3+arm4+arm5+arm6+arm7+arm8)
d <- data.frame(arm = l, arm2=l^2, arm3=l^3, arm4=l^4, arm5=l^5, arm6=l^6,arm7=l^7,arm8=l^8)
plot(arm,mil)
predictions <- predict(model9, newdata=d)
lines(l, predictions, col=2)

# If we have time, let us see how much the high order polynomials vary
# when selecting a random subset of the points. THis is the "variance"
# of bias-variance tradeoff. 

