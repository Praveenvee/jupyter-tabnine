'library(rpart)
library(rpart.plot)

sample <- rpart(passed ~ year+applied,var)

df <- data.frame(var$year-c(2023),var$applied-c(8000),var)

result<-predict(sample,df)
print(result)
plot(result,var$applied,type="l")'

library(rpart)
library(rpart.plot)
tree <- rpart(passed ~ applied + year, var)
a <- data.frame(applied = c(9000), year = c(2021))
result <- predict(tree, a)
print(result)






