
x <- 5

y <- 8

x+y#�[

x-y#��

x*y#��

x/y#��

x^y#����

x^y==x**y

sqrt(x^2)#�����

log10(3)# log�H10����

log(3)# log�He����

exp(3)

y%/%x#�Ӽ�

y%%x#�l��

x<-c(1,2,3,4,5,6)
x

print(x)#���L

y<-2:7
y

x+y

x*y

x%*%y#���n

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

x!=y#������

a<-c(1,2,3,4,5)
a>0 & a>6 #�涰
a>0 | a>6 #�涰

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
while (x <= 10) { # while �u�n�ŦX�P�_���A�N�|�@�����ư���A�����{���X�A���줣�ŦX����C
   y <- x + y
  x <- x + 1 # �o��ܭ��n�A�p�G�S���o��A�{���X�|�@�����椣�|����A�]���P�_���O x �p�󵥩� 10�Ax ��l�ȬO 0�A�p�G���� x ���ǰʧ@�Ax �|�@���p�󵥩� 10�A�ҥH�o��[ 1�A�O�Ʊ����� x = 11 �ɡA�j��N�|����C
 }
y

?matrix

x <- c(1,2,3)
length(x)

x<-rnorm(50)

x

mean(x)
sd(x)

set.seed(123)
x<-rnorm(50)
y<-rnorm(50)
z<-rnorm(50)
data_xyz<-data.frame(x,y,z)

head(data_xyz)

install.packages("ISLR")

library("ISLR")

head(Auto)

summary(Auto)

pairs(Auto)


