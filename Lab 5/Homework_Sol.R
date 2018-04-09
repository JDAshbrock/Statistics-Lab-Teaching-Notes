clean_NA <- function(list1, list2){
  
  indices <- c()
  len <- length(list1)
  
  for( i in c(1:len)){
    if(!is.na(list1[i]) && !is.na(list2[i])){
      indices <- c(indices, i)
    }
  }
  return(indices)
}

require("Lock5Data")
data(SpeedDating)

LikeF <- as.numeric(SpeedDating[ , 4]) # How much F likes M
LikeM <- as.numeric(SpeedDating[ , 3])
AttM <- as.numeric(SpeedDating[ , 11]) #How attractive M thinks F is
AttF <- as.numeric(SpeedDating[ , 12])

F_Model <- lm(LikeF ~ AttF)
M_Model <- lm(LikeM ~ AttM)

summary(F_Model)
summary(M_Model)

WrongF <- lm(AttF ~ LikeF)
WrongM <- lm(AttM ~ LikeM)


summary(WrongF)
summary(WrongM)

indF <- Clean_NA(LikeF, AttF)
indM <- Clean_NA(LikeM,AttM)

LikeF <- LikeF[indF]
LikeM <- LikeM[indM]
AttM <- AttM[indM]
AttF <- AttF[indF]
clean_F_model <- lm(LikeF ~AttF)
clean_M_model <- lm(LikeM ~ AttM)
summary(clean_F_model)
summary(clean_M_model)