x <- c(10,20,40,20,5,5)
country <- c("uk","us","japan","india","pakistan","china")

x<-1:10
y<-1:10*2
 plot(x,y)
 plot(x,y,xlab="POints")
 plot(x,y,xlab="POints",ylab="Points")
 plot(x,y,xlab="POints",ylab="Points",main="mygraph")
 plot(x,y,xlab="POints",ylab="Points",main="mygraph",col="green")
 plot(x,y,xlab="POints",ylab="Points",main="mygraph",col="red")
 plot(x,y,xlab="POints",ylab="Points",main="mygraph",col="red",type="l")
 plot(x,y,xlab="POints",ylab="Points",main="mygraph",col="red",pch="21")
 plot(x,y,xlab="POints",ylab="Points",main="mygraph",col="red",pch="@")
 plot(x,y,xlab="POints",ylab="Points",main="mygraph",col="red",pch=21)
 plot(x,y,xlab="POints",ylab="Points",main="mygraph",col="red",pch=20)
 
 
 
 a<-c(1,2,3,4,5,6,7)
 b<-c(2,5,7,4,3,7,1)
 
 plot(a,b,type="l")
 lines(a,b,col="red")
 
 lines(a,col="green")
 lines(b,col="blue",lwd=3)
 
 