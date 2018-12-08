#partition the data into train and test set
mtcars
library(caret)
#index=createDataPartition(y=mtcars$am,p=0.7, list=F)
nrow(mtcars)
index = sample(x=1:nrow(mtcars), size=.7 * nrow(mtcars)) #pick up how many rows are there from the data set
index
train= mtcars[index,]
test= mtcars[-index,]
nrow(train)
nrow(test)
nrow(train) + nrow(test)

library(olsrr)
fit = lm(mpg ~ disp + hp + wt + qsec, data = train)
k = ols_step_all_possible(fit)
plot(k)
k
summary(lm(mpg ~ wt, data= train))
summary(lm(mpg ~ wt + hp, data= train))
finalmodel = lm(mpg ~ wt + hp, data= train)
library(gvlma)
gvmodel = gvlma(finalmodel)
gvmodel

finalmodel = lm(mpg ~ wt + hp, data= train)
(predictedvalues = predict(finalmodel, ndata=test))
cbind(test$mpg, predictedvalues)


#caTools----
require(caTools)
set.seed(101) 
sample = sample.split(data$anycolumn, SplitRatio = .75)
train = subset(data, sample == TRUE)
test  = subset(data, sample == FALSE)
train ; test
table(train$am); table(test$am)

mtcars$id <- 1:nrow(mtcars)