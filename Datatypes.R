var <- TRUE
print (var)
fruits <- c('apple', 'orange', 'banana', 'papaya')
print(fruits)

print(class(fruits))

var.list <-
  list(c("one", "two", 'Three', 'four'), 20.1, 30.2, sin, TRUE)
print(var.list)


mat <-
  matrix(
    c('1', '2', '3', '4', '4', '3'),
    nrow = 2,
    ncol = 3,
    byrow = TRUE
  )
print(mat)

arr <- array(c('green', 'red'), dim = c(4, 4, 3))
print(arr)
fact_f <- factor(fruits)#just created the factor
print(fact_f)
(nlevels(fact_f))  #used to print levels of our factors

cat(fruits)
cat(fact_f)
print(fruits)

new.function <- function() {
  print("hello da balajee")
}
new.printing <- function() {
  print("blablablaaaa")
}
printing <- function() {
  print("called")
}

setwd("C:\\Users\\TFSUSER\\Desktop\\")
getwd()
var <- read.csv("datas.csv")
colnames(var)[1] <- "year"

