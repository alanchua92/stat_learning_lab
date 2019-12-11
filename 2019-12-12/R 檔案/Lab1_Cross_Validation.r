library(ISLR)
set.seed(1)
train=sample(1:392 ,196)
poly_validation_error=rep(0,5);
mpg=Auto$mpg
for(i in 1:5){
    lm.fit=lm(mpg~poly(horsepower ,i) ,data=Auto ,subset =train )
    validation_pred=predict(lm.fit,Auto[-train,])
    validation_mpg=mpg[-train]
    poly_validation_error[i]=mean((validation_mpg-validation_pred)[-train]^2)
}
plot(1:5,poly_validation_error,xlab="polynomial order",ylab="validation error",type="b")

library(ISLR)
for(tmp_seed in 1:20){
    set.seed(tmp_seed)
    train=sample(1:392 ,196)
    poly_validation_error=rep(0,5);
    mpg=Auto$mpg
    for(i in 1:5){
        lm.fit=lm(mpg~poly(horsepower ,i) ,data=Auto ,subset =train )
        validation_pred=predict(lm.fit,Auto[-train,])
        validation_mpg=mpg[-train]
        poly_validation_error[i]=mean((validation_mpg-validation_pred)[-train]^2)
    }
    if(tmp_seed==1){
        plot(1:5,poly_validation_error,xlab="polynomial order",ylab="validation error",type="l",col="grey",ylim=c(12.5,32.5))
    }else{
        lines(1:5,poly_validation_error,col="grey")
    }
}


library(boot)
loocv.err=rep(0,5)
for(i in 1:5){
    glm.fit=glm(mpg~poly(horsepower,i) ,data=Auto)
    loocv.err[i]=cv.glm(Auto,glm.fit)$delta[1]
}
plot(1:5,loocv.err,xlab="polynomial order",ylab="loocv error",type="b")
which.min(loocv.err)

k.cv.err=rep(0,5)
for(i in 1:5){
    glm.fit=glm(mpg~poly(horsepower,i) ,data=Auto)
    k.cv.err[i]=cv.glm(Auto,glm.fit,K=10)$delta[1]
}
plot(1:5,k.cv.err,xlab="polynomial order",ylab="loocv error",type="b")
which.min(k.cv.err)

library(ISLR)
for(tmp_seed in 1:20){
    set.seed(tmp_seed)
    k.cv.err=rep(0,5)
    for(i in 1:5){
        glm.fit=glm(mpg~poly(horsepower,i) ,data=Auto)
        k.cv.err[i]=cv.glm(Auto,glm.fit,K=10)$delta[1]
    }
    if(tmp_seed==1){
        plot(1:5,k.cv.err,xlab="polynomial order",ylab="10 fold cross validation error",type="l",col="grey",ylim=c(12.5,32.5))
    }else{
        lines(1:5,k.cv.err,col="grey")
    }
}

require(e1071)
set.seed(1)
obj <- tune(svm, Species~., data = iris, 
          ranges = list(gamma = 2^(-4:1), cost = 2^(1:5)),kernel="radial")
summary(obj)
plot(obj)

m_svm<-svm(Species~., data = iris,gamma=0.625,cost=2,kernel="radial")
svm_pred=predict(m_svm)
table(iris$Species,svm_pred)
mean(iris$Species==svm_pred)
