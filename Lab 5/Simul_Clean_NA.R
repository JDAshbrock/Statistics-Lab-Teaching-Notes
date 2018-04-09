# Function will return the indices of the elements where neither list
# contains an NA value. lists must be of same length to begin

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



