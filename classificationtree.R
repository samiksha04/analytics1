# Decision Tree - Classification
#we want predict for combination of input variables, is a person likely to servive or not

#import data from online site
path = 'https://raw.githubusercontent.com/thomaspernet/data_csv_r/master/data/titanic_csv.csv'
titanic <-read.csv(path)
head(titanic)
names(titanic)
data = titanic[,c(2,3,5,6,7)]  #select few columns only
head(data)
dim(data)
#load libraries
library(rpart)
library(rpart.plot)
str(data)
#Decision Tree
names(data)
fit <- rpart(survived ~ ., data = data, method = 'class') #In regression, method = Anova; here it is class
fit
rpart.plot(fit, extra = 106, cex=.8,nn=T)  #plot
rpart.plot(fit, extra = 106, cex=.8,nn=T)

printcp(fit) #select complexity parameter where xerror is least, but we take a higher value to make the tree look simpler
prunetree2 = prune(fit, cp=.014)
rpart.plot(prunetree2, cex=.8,nn=T)
prunetree2
nrow(data)
table(data$survived)
#yval is the mode of 0s and 1s
#Predict class category or probabilities
(testdata = sample_n(data,2))
predict(prunetree2, newdata=testdata, type='class')
predict(prunetree2, newdata=testdata, type='prob')

#Use decision trees for predicting
#customer is likely to buy a product or not with probabilities
#customer is likely to default on payment or not with probabilities
#Student is likely to get selected, cricket team likely to win etc

#Imp steps
#Read data set
#Train + Test sample
#Model - classification (Method = class) or regression (Method=Anova)
#Check for CP (least Xerror)
#select columns for prediction
#load libraries, create model
#prune the tree with cp value
#plot the graph
#predict for new cases