#Decision Trees

#types - Regression & Classification
iris
head(iris)

library(rpart)
library(rpart.plot)
#regression tree
#DV - Sepal.Length
rtree = rpart(Sepal.Length ~ . , data = iris, method = 'anova')
rtree
rpart.plot(rtree, nn=T)
rpart.plot(rtree, nn=T, cex = 0.8, fallen.leaves = T)

#classification tree
#DV - Species
ctree = rpart(Species ~ ., data = iris, method = 'class')
ctree
rpart.plot(ctree, extra = 104, nn=T, cex = 0.8)
printcp(ctree)
ctreeprune1 = prune(ctree, cp=0.44)
ctreeprune1
rpart.plot(ctreeprune1, cex = 0.8, nn= T, extra = 104)
(ndata=sample_n(iris,3))
predict(ctree, newdata = ndata, type = 'prob')
