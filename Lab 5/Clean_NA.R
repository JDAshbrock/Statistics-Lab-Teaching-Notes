Clean_NA <- function(list){

len <- length(list)
newlist <- c()
for(i in 1:len){
	if(!is.na(list[i])){
		newlist <- c(newlist, list[i])
	}
}

return(newlist)
}
	