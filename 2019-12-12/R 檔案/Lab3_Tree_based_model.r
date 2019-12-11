#install.packages('tree')

library(ISLR)
library(tree)
data(Carseats)

High = ifelse(Carseats$Sales <= 8, "No" ,"Yes")
Carseats = data.frame(Carseats ,High)

head(Carseats)

tree.carseats = tree(High~.-Sales, data=Carseats)

summary(tree.carseats )

plot(tree.carseats)
text(tree.carseats)

set.seed(2)
train = sample (1:nrow(Carseats), 200) #50%訓練集 50%測試集
Carseats.test = Carseats[-train, ]
High.test = High[-train] #response

tree.carseats = tree(High~.-Sales , data = Carseats, subset = train)
tree.pred = predict(tree.carseats ,Carseats.test ,type="class") #指定type="class"表示會回傳預測的種類
table(tree.pred, High.test)#混淆矩陣
mean(tree.pred==High.test)#測試集準確度

#install.packages('randomForest')

library(randomForest)
library(MASS)
set.seed(1)

head(Carseats)

bag.Carseats = randomForest(High~.-Sales, data = Carseats, mtry=10, ntree=500)
bag.Carseats

varImpPlot(bag.Carseats)

set.seed(20191212)
train = sample (1:nrow(Carseats), 200) #50%訓練集 50%測試集
Carseats.test = Carseats[-train, ]
High.test = High[-train] #response

rf.Carseats = randomForest(High~.-Sales, data = Carseats, mtry=4, ntree=100, subset=train)
rf.pred = predict(rf.Carseats ,Carseats.test ,type="class") #指定type="class"表示會回傳預測的種類
table(rf.pred, High.test)#混淆矩陣
mean(rf.pred==High.test)#測試集準確度
