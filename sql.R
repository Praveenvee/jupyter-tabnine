library(RODBC)
con <- odbcDriverConnect("Driver=SQL Server;Server=Devserver; Database=Live_snap2020;Uid=sa; Pwd=SA@sql2014;")
initdata <- sqlQuery(con,paste("select * from reports"))


dates<-sqlQuery(con,paste(" GetReportDateWise 'snap',0"))

index <- sample(nrow(dates),0.7*nrow(dates),replace = FALSE)

train<- dates[index,c(2,3)]
test<- dates[-index,c(2,3)]

model<- lm(Paid~Applicants,data=train)
summary(model)
list <- data.frame(Applicants=test$Applicants)
pre <- predict(model,list)

vs <- data.frame(applicants=test$Applicants,actual=test$Paid, predicted=pre )
test

library(caTools)

bla <- sample.split(dates,SplitRatio =0.8)

