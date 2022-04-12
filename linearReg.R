library(openxlsx)
data <- read.xlsx("datas.xlsx", sheet = 1)
print(data)  #just read the file and load the data into the data and printed data

#linear regression --> x,y,lm(),predictor variable
nrow(data) #check how many rows it has

a<-data$applied
b<-data$passed

relation <- lm(b~a)
pvar <- data.frame(a=2000)
result <- predict(relation,pvar)
print(result)