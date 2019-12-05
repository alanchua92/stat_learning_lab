
x <- 5

y <- 8

x+y#加

x-y#減

x*y#乘

x/y#除

x^y#次方

x^y==x**y

sqrt(x^2)#平方根

log10(3)# log以10為底

log(3)# log以e為底

exp(3)

y%/%x#商數

y%%x#餘數

x<-c(1,2,3,4,5,6)
x

print(x)#打印

y<-2:7
y

x+y

x*y

x%*%y#內積

seq(5,10,2)

rep(c(1, 2, 3), times = 3, each = 2)

matrix(5:8, nrow = 2, ncol = 2)

x<-matrix(5:8, nrow = 2, ncol = 2, byrow = TRUE)
x

x[1,2]

x <- c(1, 2, 4, 3, 1, 2, 3, 4,1)

factor(x)

factor(x, ordered = TRUE)

name <- c("Joe", "Bob", "Vicky")

age <- c("28", "26", "34")

gender <- c("Male","Male","Female")

data <- data.frame(name, age, gender)

data

data[1,]

data[,3]

summary(data)

str(data)

colnames(data)

iris

head(iris)

plot(iris)

plot(iris$Sepal.Length,iris$Sepal.Width)

x<-5
y<-10

x>y

x<=y

x!=y#不等於

a<-c(1,2,3,4,5)
a>0 & a>6 #交集
a>0 | a>6 #交集

x <- 1
if (x > 0) {
   y <- 5
 } else {
   y <- 10
 }
y

x <- -5
if (x > 0) {
   y <- 5
 } else {
   y <- 10
 }
y

x<- 6 
y <- ifelse(x > 0, 5, 10)
y

y <- 0
for (x in c(1:10)) 
    y <- x + y 
y

x <- 1
y <- 0
while (x <= 10) { # while 只要符合判斷式，就會一直重複執行括號內程式碼，直到不符合為止。
   y <- x + y
  x <- x + 1 # 這行很重要，如果沒有這行，程式碼會一直執行不會停止，因為判斷式是 x 小於等於 10，x 初始值是 0，如果不對 x 做些動作，x 會一直小於等於 10，所以這邊加 1，是希望執行到 x = 11 時，迴圈就會停止。
 }
y

?matrix
