library(caTools)
library(randomForest)
library(party)

data <- readingSkills

index <- sample.split(data$nativeSpeaker,SplitRatio = 0.8)

train <- subset(data, index==TRUE)
test <- subset(data,index==FALSE)

out <- randomForest(nativeSpeaker~age+shoeSize+score,data = train)
out

ans<-predict(out,test[1:4])

data.frame(output = ans, test)
           
