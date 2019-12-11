# 只取出 virginica 和 versicolor
iris.small <- iris[iris$Species %in% c("versicolor","virginica"),]
iris.small$Species=factor(iris.small$Species,level=c("versicolor","virginica"))
rownames(iris.small)=1:nrow(iris.small)
color_list=c("blue","red")
pairs(iris.small[,-5],col=color_list[iris.small$Species],pch=c(16,17)[iris.small$Species])

set.seed(10)
x=scale(iris.small[-5])
km.out =kmeans (x,2)
color_list=c("blue","red")
pairs(x,col=color_list[km.out$cluster],pch=c(16,17)[iris.small$Species])

table(iris.small$Species,km.out$cluster)
(36+47)/(36+47+3+14)

hc.complete=hclust(dist(x), method ="complete")
hc.average=hclust(dist(x), method ="average")
hc.single=hclust(dist(x), method ="single")

par(mfrow =c(1,3))
plot(hc.complete, main ="Complete Linkage", xlab="", sub ="",
cex =.9)
plot(hc.average, main ="Average Linkage", xlab="", sub ="",
cex =.9)
plot(hc.single, main="Single Linkage ", xlab="", sub ="",
cex =.9)

table(iris.small$Species,cutree(hc.complete ,2))
table(iris.small$Species,cutree(hc.average ,2))
table(iris.small$Species,cutree(hc.single ,2))
