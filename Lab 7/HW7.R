require("Lock5Data")
require("e1071")
data(NBAStandings1e)
attach(NBAStandings1e)
len <- length(Wins)
y <-c()
for(i in 1:len){
  if(WinPct[i] >0.6){
    y <- c(y, "Good")
 } else if(WinPct[i] >0.4){
    y <- c(y,"Average")
  } else{
    y <- c(y,"Bad")}
}
yfac <- factor(y)
x = NBAStandings1e[ , c(5,6)]
model <- svm(x,yfac)
pred <- predict(model, x)
table(pred,yfac)
detach(NBAStandings1e)


# Test model on new data
data(NBAStandings2016)
attach(NBAStandings2016)
xnew <- NBAStandings2016[ , c(5,6)]
ynew <- c()
len <- length(Wins)
for(i in 1:len){
  if(WinPct[i] >0.6){
    ynew <- c(ynew, "Good")
   }else if(WinPct[i] >0.4){
    ynew <- c(ynew,"Average")
  } else{
    ynew <- c(ynew,"Bad")
  }
}

prednew <- predict(model, xnew)
table(prednew,ynew)
predictions <- as.character(prednew)

#Create desired plots
good_points_pred <- xnew[predictions=="Good", ]




