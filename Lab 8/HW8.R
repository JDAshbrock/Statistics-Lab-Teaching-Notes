require("Lock5Data")
require("rpart")
require("rattle")

data(HollywoodMovies)
attach(HollywoodMovies)
cat <- c()
NA_index <- c()
len <- 970
for(i in 1:len){
  if(is.na(Profitability[i])){
    NA_index <- c(NA_index,i)
  } else if(Profitability[i]<80){
    cat <- c(cat,"bad")
  } else if(Profitability[i]<120){
    cat <- c(cat, "average")
  } else {
    cat <- c(cat, "good")
  }
}
x <- HollywoodMovies[-NA_index,c(4,6,7,8,13)]
tree <- rpart(cat~., data=x)
fancyRpartPlot(tree)
