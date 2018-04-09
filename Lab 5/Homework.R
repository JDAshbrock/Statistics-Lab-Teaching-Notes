require("Lock5Data")
data(SpeedDating)

attM <- as.numeric(SpeedDating[ ,11])
LikeM <- as.numeric(SpeedDating[ ,3])
attF <- as.numeric(SpeedDating[ , 12])
LikeF <- as.numeric(SpeedDating[ ,4])
IndM <- Simul_Clean_NA(attM,LikeM)
IndF <- Simul_Clean_NA(attF, LikeF)
attM <- attM[IndM]
attF <- attF[IndF]
LikeM <- LikeM[IndM]
LikeF <- LikeF[IndF]


males <- data.frame(attM,LikeM)
females <- data.frame(attF,LikeF)
lm(formula = LikeM ~ attM, data = males)
lm(formula = LikeF ~ attF, data = females)
cor(attM, LikeM)
cor(attF, LikeF) 

