data(women)
height <- as.numeric(women[,1])
weight <- as.numeric(women[,2])
plot(height,weight)

lin_model <- lm(weight~height)
predictions <- predict(lin_model)
errors <- predictions - weight
dev.new()
plot(height,errors)

height2<- height^2
quad_model <- lm(weight ~ height+height2)
predictions2 <- predict(quad_model)
errors2 <- predictions2 - weight
dev.new()
plot(height,errors2)

summary(quad_model)






















height2 <-height^2
quad_model <- lm(weight ~ height+height2)
frame <- data.frame(height,height2)
quad_pred <-predict(quad_model, newdata = frame)
quad_errors <- quad_pred-weight
dev.new()
plot(height,quad_errors)
summary(quad_model)

height3 <-height^3
cub_model <- lm(weight ~ height+height2+height3)
frame <- data.frame(height,height2.height3)
cub_pred <-predict(cub_model, newdata = frame)
cub_errors <- cub_pred-weight
dev.new()
plot(height,cub_errors)
summary(cub_model)


