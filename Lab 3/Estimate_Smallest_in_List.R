sum <- 0
Smallest_in_Trial <- matrix(0,1,1000)
for (j in 1:1000){
	Smallest_in_Trial[j] <- Smallest_in_List(99)
	sum<-sum + Smallest_in_Trial[j]
}
print(sum/1000)
hist(Smallest_in_Trial)
sum <-0
Smallest <- matrix(0, 1, 96)
Num_Points <- matrix(0,1,96)
for (i in 4:99){
	for(j in 1:500) {
		sum <-sum + Smallest_in_List(i)
	}
	average <- sum/500
	Num_Points[i-3] <- i
	Smalest[i-3] <- average
	sum <- 0
	plot(Num_Points,Smallest)
}
		