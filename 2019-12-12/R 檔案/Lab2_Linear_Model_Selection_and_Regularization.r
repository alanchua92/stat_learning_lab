# install.packages("ISLR")
library(ISLR) #安裝需要的package

data(Hitters) #取出資料
head(Hitters) #看資料的前幾筆

?Hitters #可以詳細了解這筆資料的每個變數

names(Hitters) #看資料的欄位名稱

dim(Hitters) #看資料的行、列數 

Hitters = na.omit(Hitters) #將資料中有缺失值的列刪除

dim(Hitters) #刪除缺失值後重新查看資料的行、列數

sum(is.na(Hitters )) #檢查是否還有缺失值尚未刪除

# install.packages("leaps")
library(leaps) #安裝需要的package 

regfit.full=regsubsets(Salary~.,data=Hitters ,nvmax =8)

summary(regfit.full)

regfit.full_1=regsubsets(Salary~.,data=Hitters ,nvmax =19)
summary(regfit.full_1)

reg.summary_1=summary(regfit.full_1)

reg.summary_1$adjr2

par(mfrow =c(2,2))

plot(reg.summary_1$rss ,xlab=" Number of Variables ",ylab=" RSS",type="l")
points(which.min(reg.summary_1$rss), reg.summary_1$rss[which.min(reg.summary_1$rss)], col ="red",cex =2, pch =20)

plot(reg.summary_1$adjr2 ,xlab =" Number of Variables ", ylab=" Adjusted RSq",type="l")
points(which.max(reg.summary_1$adjr2), reg.summary_1$adjr2[which.max(reg.summary_1$adjr2)], col ="red",cex =2, pch =20)

plot(reg.summary_1$cp ,xlab ="Number of Variables",ylab="Cp",type='l')
points(which.min(reg.summary_1$cp), reg.summary_1$cp[which.min(reg.summary_1$cp)], col ="red",cex =2, pch =20)

plot(reg.summary_1$bic ,xlab="Number of Variables",ylab=" BIC",type='l')
points(which.min(reg.summary_1$bic), reg.summary_1$bic[which.min(reg.summary_1$bic)], col =" red",cex =2, pch =20)

regfit.fwd=regsubsets(Salary~.,data=Hitters, nvmax =19, method ="forward")

regfit.bwd=regsubsets(Salary~.,data=Hitters ,nvmax =19,method ="backward")

x=model.matrix(Salary~.,Hitters)[,-1]
y=Hitters$Salary

# install.packages("glmnet")
library(glmnet) #安裝需要的package

set.seed (1)
train=sample(1:nrow(x), nrow(x)/2)
test=(-train)
y.test=y[test]

grid =10^seq(10,-2,length =100) 

lasso.mod =glmnet(x[train ,],y[train],alpha =1, lambda =grid)

set.seed(1)
cv.out = cv.glmnet(x[train ,],y[train],alpha =1) 
plot(cv.out) #畫出在不同的lambda之下模型的MSE

bestlam = cv.out$lambda.min #使模型的MSE最小的lambda，也就是我們想要的lambda
lasso.pred= predict(lasso.mod,s=bestlam ,newx=x[test ,]) #將The Lasso模型的lambda設定為我們選出的lambda，丟入測試集資料進行預測
mean((lasso.pred-y.test)^2) #test MSE

lasso.coef=predict(cv.out ,type ="coefficients",s=bestlam)[1:20 ,] #代入最佳lambda的The Lasso模型的係數

lasso.coef

x_new=x[,names(lasso.coef[lasso.coef!=0])[-1]]
out=glmnet(x_new,y,alpha =1, lambda =0)
lasso.coef_1=predict(out,newx=x_new)
lasso.coef_1


