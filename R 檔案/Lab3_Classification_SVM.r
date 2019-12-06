
# 只取出 virginica 和 versicolor
iris.small <- iris[iris$Species %in% c("versicolor","virginica"),]
iris.small$Species=factor(iris.small$Species,level=c("versicolor","virginica"))

# iris.small 前 5 筆資料
head(iris.small)

# iris.small 的 columns name
names(iris.small)

# iris.small 資料維度
dim(iris.small)

color_list=c("blue","red")
pairs(iris.small[,-5],col=color_list[iris.small$Species],pch=c(16,17)[iris.small$Species])

glm.fit=glm(Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,
            data=iris.small ,family =binomial)
summary(glm.fit)

contrasts(iris.small$Species)
glm.probs= predict(glm.fit ,type ="response")
glm.pred=rep("versicolor",100)
glm.pred[glm.probs>=0.5]="virginica"
table(iris.small$Species,glm.pred)
mean(iris.small$Species==glm.pred)

library(RColorBrewer)
library(gplots)
cut_size=5
#col_list=brewer.pal(n = cut_size, name = 'RdYlBu')
col_list=colorpanel(cut_size, "Blue", "Red")
cut_quant=quantile(glm.probs,seq(0,1,length.out = cut_size+1))
pairs(iris.small[,-5],col=col_list[cut(glm.probs,breaks =cut_quant)],pch=c(16,17)[iris.small$Species])

library(class)
train.X=scale(iris.small[,-5])
pairs(train.X,col=color_list[iris.small$Species],pch=c(16,17)[iris.small$Species])

Species=iris.small$Species
knn.pred=knn (train.X,train.X,Species ,k=1)
table(knn.pred,Species)
mean(knn.pred==Species)

knn.pred=knn (train.X,train.X,Species ,k=3)
table(knn.pred,Species)
mean(knn.pred==Species)

library(e1071)
svmfit =svm(Species~., data=iris.small , kernel ="linear", cost =10,gamma=0.25)
summary(svmfit)
svm.pred=predict(svmfit ,iris.small )
table(iris.small$Species,svm.pred)
mean(iris.small$Species==svm.pred)

svmfit =svm(Species~., data=iris.small , kernel ="radial", cost =10,gamma=0.25)
summary(svmfit)
svm.pred=predict(svmfit ,iris.small )
table(iris.small$Species,svm.pred)
mean(iris.small$Species==svm.pred)
