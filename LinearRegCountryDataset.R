library(ggplot2)
library(openxlsx)

data <-
  read.xlsx("C:\\Users\\TFSUSER\\Desktop\\datas.xlsx", sheet = 1)

a <- ggplot(data, aes(x = passed, y = applied)) + geom_bar()

a <-
  ggplot(iris, aes(Sepal.Length, Petal.Length, color = Species)) + geom_point()
print(a)
print(a + labs(x = "Sepal Length", y = "Petal Length") + ggtitle("PraveenPlot's"))


ds <- datasets::cars
plot(cars,
     type = "o",
     pch = 16,
     col = 2)

vegam <- as.vector(ds[c(1:35), 1])
dhooram <- as.vector(ds[c(1:35), 2])
frame <- data.frame(vegam, dhooram)

mod <- lm(dhooram ~ vegam, frame)
var <- data.frame(vegam = c(16, 17))

ans <- predict(mod, var, interval = 'confidence')
ans
abline(vegam,
       dhooram,
       cex = 2,
       pch = 2,
       col = "2")
plot(ans,
     col = "green",
     type = "o",
     pch = 16)


#its for Heart.csv file
getwd()
setwd()
read <- read.csv("C:\\Users\\TFSUSER\\Desktop\\Heart.csv")

age <- as.vector(read[c(1:150), 1])
bp <- as.vector(read[c(1:150), 4])

frame <- data.frame(age, bp)
plot(frame,
     col = 2,
     lwd = 3,
     pch = 16)

mod <- lm(bp ~ age)
pvar <-
  data.frame(age = c(63, 45, 41, 60, 57, 44, 53, 23, 76, 65, 10, 10, 29, 16, 90))
result <- predict(mod, pvar)
result
layout(matrix(c(1, 2, 3, 4), 2, 2, byrow = TRUE))
plot(mod)
summary(mod)


#connect with database (r->mssql)

library(RODBC)
con <-
  odbcDriverConnect(
    "Driver=SQL Server;Server=ISHDEV09; Database=praveenvee;Uid=sa; Pwd=sa@123; trusted_connection=yes"
  )
table <- sqlQuery(con, paste("select * from fruits;"))
