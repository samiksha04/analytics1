# Decision Trees : - regression tree
#install and load this library
install.packages("ISLR")
library(ISLR)
data(Carseats)
?Carseats
data = Carseats
head(data)

#Libraries for Decision Tree
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)

#Model
tree1 = rpart(Sales ~ . , data=data, method='anova' ) #Select all variables except Sales for x variables as Sales has gone into Y variables
tree1
rpart.plot(tree1, cex=.8)

#this is large tree, so prune it: check cp - complexity parameter
printcp(tree1)
#cp value should be chosen such that xerror(cross validation error) is least
prunetree = prune(tree1, cp=0.03)
#here we have selected a different value to simplify the tree
mean(data$Sales)
prunetree
rpart.plot(prunetree, nn=T)
table(data$ShelveLoc)
#Interpretation
#if ShelveLoc=Good, and Price >= 109.5, sales predicted is 9.2
#Leaf node has a start with it in the row end - no further splits
#improve the plot
rpart.plot(prunetree, nn=T, cex=.8, type=4)
#read this document to improve the plot
#https://cran.r-project.org/web/packages/rpart.plot/rpart.plot.pdf
#http://www.milbo.org/rpart-plot/prp.pdf

#Predict for test value
library(dplyr)
(testdata = sample_n(data,2))
(predictedSales=predict(prunetree, newdata=testdata, type='vector'))
cbind(testdata, predictedSales)
#next line will show error because we have to predict numerical value instead of class/ category, so type of response reqd is vector not class
(predict(prunetree, newdata=testdata, type='class'))
#ERROR - use vector

#see online help here
#https://www.datacamp.com/community/tutorials/decision-trees-R
