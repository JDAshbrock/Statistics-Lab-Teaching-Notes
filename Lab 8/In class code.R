require("rattle")
require("rpart")


num_points <- 100
depth_of_tree <- 0.01
depth_controller <- rpart.control(cp=depth_of_tree)

x1 <- runif(num_points,0,1)
x2 <- runif(num_points,0,1)
cat <- c()
for(i in 1:num_points){
  if(x1[i]>x2[i]){
    cat <- c(cat,"Red")
  }else{
    cat <- c(cat,"Blue")
  }
}
fac_cat <- as.factor(cat)

tree <- rpart(fac_cat ~ x1+x2, depth_controller)
fancyRpartPlot(tree)

predictions <- predict(tree) # THIS IS PROBABILITIES
color <- c()
shape <- c()

for(i in 1:num_points){
  if(predictions[i,1]>0.5){
    color <- c(color, "Blue")
    if(x1[i]>x2[i]){
      shape <- c(shape, 2)
    }else{
      shape <- c(shape,1)
    } #end shape
  }else{
    color<- c(color, "Red")
    if(x1[i]<x2[i]){
      shape <- c(shape,2)
    }else{
      shape <- c(shape,1)
    } #end shape
  }#end color
  
}
plot(x1,x2,col=color, pch=shape)
table(color,cat)
summary(tree)

