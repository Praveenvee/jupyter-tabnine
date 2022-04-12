library(openxlsx)
library(ggplot2)
testdata <-
  read.csv(
    "C:\\Users\\TFSUSER\\Desktop\\Praveenkumar V ISH\\R Download\\References\\archive (1)\\test.csv"
  )
traindata <-
  read.csv(
    "C:\\Users\\TFSUSER\\Desktop\\Praveenkumar V ISH\\R Download\\References\\archive (1)\\train.csv"
  )

model <- lm(y ~ x, data = traindata)

pre <- data.frame(x = testdata$x)

ans <- predict(model, pre)

df <- data.frame(TEST_X = testdata$x,
                 TEST_Y = testdata$y,
                 Predicted = ans)
df

ggplot(df, aes(x = df$TEST_X)) + geom_line(aes(y = df$TEST_Y), lwd = 2, col = "green") +
  geom_line(aes(y = df$Predicted), col = 'red') + geom_point(aes(y = df$TEST_Y)) +
  geom_point(aes(y = df$Predicted), col = "red")

dev.off()


#another dataset for multi linear regression
library(ggplot2)
dataset <-
  read.csv(
    "C:\\Users\\TFSUSER\\Desktop\\Praveenkumar V ISH\\R Download\\References\\startups.csv"
  )

index <- sample(nrow(dataset), 0.9 * nrow(dataset), replace = FALSE)

train <- dataset[index,]
test <- dataset[-index,]


mlmod <-
  lm(Profit ~ research + admin + marketting, data = train)

mlpre <- test[, c(1, 2, 3)]
mlans <- predict(mlmod, mlpre)

rslt <- data.frame(predicted = mlans, actual = test$Profit)
x <- as.vector(rslt$actual)
x1 <- as.vector(rslt$predicted)
y <- as.vector(test$marketting)

total <- data.frame(x, x1, y)

library(ggplot2)
graph <-
  ggplot(dataset, aes(, dataset$Profit)) + geom_point(aes(x = dataset$marketting)) +
  geom_point(aes(x = dataset$research), col = "orange") + geom_point(aes(x = dataset$admin), col =
                                                                       "red") + geom_smooth(aes(x = dataset$marketting)) + geom_smooth(aes(x = dataset$research), col =
                                                                                                                                         "orange") + geom_smooth(aes(x = dataset$admin), col = "red")
print(graph)
