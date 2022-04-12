library(openxlsx)
file <- read.xlsx("C:\\Users\\TFSUSER\\Desktop\\Praveenkumar V ISH\\R Download\\References\\Absenteeism_at_work_AAA\\aaw.xlsx")
set.seed(100)
sample <- sample(nrow(file),0.7*nrow(file),replace = FALSE)

traindata <- file[sample,]
testdata <-file[-sample,]

age<- traindata$Age
height<-traindata$Height
weight <- traindata$Weight
trdata<-data.frame(age,height,weight)
summary(trdata)

tage<-testdata$Age
theight<-testdata$Height
tweight<-testdata$Weight
tdata<-data.frame(tage,theight,tweight)
summary(tdata)

par(mar=c(1,1,1,1))
dev.off()

ggplot(trdata,aes(age,height))+geom_point()
ggplot(tdata,aes(tage,theight))+geom_point()

a<- factor(tage)
a
b<-levels(a)

sort(b,decreasing = TRUE)

model<-lm(weight~height,trdata)

guess<- data.frame(height=theight)

graphX <-data.frame(height=tweight)

ans<- predict(model,guess)
ans
class(ans)
result <-data.frame(ans,theight)

result

layout(matrix(c(1,2,3,4), nrow = 2, ncol = 2))

library(ggplot2)
ggplot(result,aes(ans,theight))+geom_point()+geom_smooth(method = "lm")

ggplot(tdata,aes(tweight,theight))+ geom_point()+geom_smooth(method = "lm")


#new--program
rm(list = ls())

library(ggplot2)
library(openxlsx)
file <- read.xlsx("C:\\Users\\TFSUSER\\Desktop\\Praveenkumar V ISH\\R Download\\References\\Absenteeism_at_work_AAA\\aaw.xlsx")
set.seed(100)
sample <- sample(nrow(file),0.9*nrow(file),replace = FALSE)
trdata<- data.frame(age=file$Age[sample],height=file$Height[sample],weight=file$Weight[sample])

agemodel <- lm(age~height+weight,data = trdata)

ageans<-predict(agemodel)

value <- data.frame(predicted=ageans,actual=trdata$age)

ggplot(trdata,aes(ageans,age))+geom_point(col="blue")+geom_abline(col="red")

#----------weight
wmodel<-lm(weight~height+age,trdata)
wans<-predict(wmodel)
ggplot(trdata,aes(wans,weight))+geom_point(col="blue")+geom_abline(col="red")


#linear
model <- lm(weight~height,trdata)
ans<- predict(model)
value<-data.frame(x=ans,y=trdata$weight)
ggplot(value,aes(y,x))+geom_point()+geom_smooth(method = "lm",se=FALSE)


#randomForest
library(randomForest)

testdata<-data.frame(age=file$Age[-sample],height=file$Height[-sample],weight=file$Weight[-sample])

model<- randomForest(age~height+weight,trdata)
ans<-predict(model,data=testdata$height)
plot(ans,trdata$age)
value<-data.frame(x=ans,y=trdata$age)
abline(a=0,b=1)
ggplot(value,aes(x,y))+geom_point(col="red")+geom_abline()

layout(mat = c(1,2,3,4),nrow=2,ncol=2)
plot(model)
dev.off()
