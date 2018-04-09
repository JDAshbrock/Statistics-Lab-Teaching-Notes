
# Averages is a vector which contains the batting averages of your batting order
Averages = c(.280,.310,.330,.270,.265,.240,.250,.220,.180)
Outs <- 0
Runs <- 0
# The following vector will contain a 1 in position (1,2, or 3) if there 
# is a player on base (1,2 or 3)
Runners_On_Base <- c(0,0,0)
Current_Hitter <- 1

while (Outs <3){
	Runs_From_Hit <- 0
	Hit_RNG <- runif(1,0,1)
	if (Hit_RNG <= Averages[Current_Hitter]){
		# This line of code runs if and only if the player "registers a hit"
		Bases_RNG <- runif(1,0,1)
		# first if-check mimics a single
		if(Bases_RNG <0.5){
			Runs_From_Hit <- Runners_On_Base[2]+Runners_On_Base[3]
			# Check if there was a runner on first, if so he moves to third
			if(Runners_On_Base[1] ==1){
				Runners_On_Base <- c(1,0,1)
			} else {
				Runners_On_Base <- c(1,0,0)
			}
		}
		# Now begin the conditional checking for the other types of hits
		else {
			Runs_From_Hit <- sum(Runners_On_Base)
			# The following conditional checks simply determine where
			# the runner should end up based on where he began
			if (Bases_RNG <0.7){
				Runners_On_Base <- c(0,1,0)
			}
			else if (Bases_RNG < 0.8){
				Runners_On_Base <- c(0,0,1)
			}
			else {
				Runners_On_Base <- c(0,0,0)
				Runs_From_Hit <- Runs_From_Hit +1
			}
		}
	} #The following else controls sn out from not getting a hit
	else {
		Outs<- Outs+1
	}
Current_Hitter <- (Current_Hitter%%9)+1
Runs <- Runs + Runs_From_Hit
}
Runs