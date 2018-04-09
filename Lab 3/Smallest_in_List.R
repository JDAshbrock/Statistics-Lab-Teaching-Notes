Smallest_in_List <- function(Number_of_Points){
numbers <- runif(Number_of_Points,0,1)
smallest <- numbers[1]
for (i in 2:Number_of_Points){
	if(numbers[i] < smallest){
		smallest <- numbers[i]
	}
}
return(smallest)
}