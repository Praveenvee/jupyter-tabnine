library(ggplot2)
loc = "C:\\Users\\TFSUSER\\Desktop\\Praveenkumar V ISH\\R Progamming\\Datasets\\datas.csv"

ds<- read.csv(loc)

data = ifelse(is.na(ds$passed),ave(ds$passed,FUN = function (x)mean(x,na.rm=TRUE)),ds$passed)

data1 = ifelse(is.na(ds$ï..applied),ave(ds$ï..applied,FUN=function (x)mean(x, na.rm=TRUE)),ds$ï..applied)

ds<- data.frame(applied = data1,passed = data)

library(caTools)

index <- sample.split(ds$applied,SplitRatio = 0.8)

train<-subset(ds,index==TRUE)
test<-subset(ds,index==FALSE)

model <- lm(passed~applied,train)

summary(model)


input <- data.frame(applied = test[,1])

a <- predict(model, input)
 
input
test$applied
data.frame(input,a)
data.frame(test)
