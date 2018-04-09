# What steps to take to compute a factorial of a number
# Suppose we want to calculate 20!
# (20*19*18*17...*3*2*1)
# 1) We need a location to store the current value
# 2) Need a variable to contain what we will be multiplying by
# 3) We need to know how to muiltiply in R
# 4) We need to stop when the number we multiply by is 1
# 5) Need to decrease the number after every multiplication
# 6) Need a copunter variable 
# 7) We need syntax to write a loop

Number_To_Factorial <- 20
Current_Value <- 1
Current_Multiplier <- Number_To_Factorial

for (i in 1:Number_To_Factorial){
	Current_Value <- Current_Value*Current_Multiplier
	Current_Multiplier <- Current_Multiplier-1
}



print(Current_Value)
