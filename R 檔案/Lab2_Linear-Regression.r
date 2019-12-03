
library(ISLR)
data(Auto)

pairs(Auto)

names(Auto)

cor(Auto[1:8]) #�ư���qualitative varibale

lm_fit_Auto = lm(mpg~.-name, data=Auto)
summary(lm_fit_Auto)

set.seed(1) #�T�w�üƺؤl�A���A������r���G����i���ƥX�{
x1=rnorm(100) #����100�ӼзǱ`�A(N(0,1))���ȷ��@�Ӹ����ܼ�
x2=rnorm(100)
y=5+2*x1+3*x2+rnorm (100) #�����ܼ�

plot(x2, y)

lm_fit = lm(y~x1+x2) #Perform regression without an interecept
summary(lm_fit) #print the results
