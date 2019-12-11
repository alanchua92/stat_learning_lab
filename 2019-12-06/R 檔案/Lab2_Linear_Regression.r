
library(ISLR)
data(Auto)

pairs(Auto)

names(Auto)

cor(Auto[1:8]) #排除掉qualitative varibale

lm_fit_Auto = lm(mpg~.-name, data=Auto)
summary(lm_fit_Auto)

lm_fit_int = lm(mpg~cylinders:displacement+displacement:weight, data=Auto)
summary(lm_fit_int)

lm_fit_int_1 = lm(mpg~cylinders*displacement+displacement*weight, data=Auto)
summary(lm_fit_int_1)

set.seed(1) #固定亂數種子，讓你的模擬r結果能夠可重複出現
x1=rnorm(100) #產生100個標準常態(N(0,1))的值當成一個解釋變數
x2=rnorm(100)
y=5+2*x1+3*x2+rnorm (100) #反應變數

plot(x2, y)

lm_fit = lm(y~x1+x2) #Perform regression without an interecept
summary(lm_fit) #print the results
