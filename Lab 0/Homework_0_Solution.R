#  Program to calculate interest gained in our fund

#Initial amount of money invested
Initial_Investment <- 10000 
#Multiplier to control the interest rate
Interest_Rate <- 1.075
#Temporary variable to contain the amount currently contained in the fund
Current_Amount <- Initial_Investment 
# Amount to add to the fund each year
Amount_Per_Year <- 2000

for (year in 2001:2030){
	# Line to ggenerate the interest gained on Jan 1
	Current_Amount <- Current_Amount*Interest_Rate
	# Line to update the amount after you add your yearly $2,000
	Current_Amount <- Current_Amount + Amount_Per_Year
}
print(Current_Amount)
