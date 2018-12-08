#vactor

#ND with mean 80, sd 10, 100 values

sales=rnorm(100, mean =80, sd= 10)
sales
#trunc, round, floor, ceiling - remove decimal
sales= trunc(sales)
sales
summary(sales)
boxplot(sales)
plot(density(sales))
range(sales)
#matrix
m1=matrix(100:123, ncol = 2)
m1
colSums(m1)
colMeans(m1)
m1[,1]
colnames(m1)=c('A',"B")
head(m1)
tail(m1)

#DF
sname = paste('Student', 1:30, sep='_')
sname
(marks=trunc(runif(30,50,90))) #for normal distribution, n=30, min = 50, max = 90
?runif
(gender=sample(c('M', 'F'), replace = T, size = 30, prob = c(0.7,0.3)))
df1=data.frame(sname, marks, gender)
df1
library(dplyr)
df1 %>% group_by(gender) %>% summarise(mean(marks), n(), min(marks), max(marks), sd(marks)) #avaerage marks of males and females, number, min and maximum marks, sd

sort(df1$marks, decreasing = 
       TRUE)
?arrange

#names, marks (descending order); no gender
df1[(order(df1$marks, decreasing = T)),c('sname','marks')]
df1[(order(df1$marks, decreasing = T)),-3]

#use dplyr
df1 %>% select(sname, marks) %>% arrange(desc(marks))
df1 %>% select(sname, gender) %>% arrange(desc(marks))


df1 %>% sample_n(3)
df1 %>% sample_frac(.3)


#put missing values in a random position
sum(complete.cases(df1))
sum(!complete.cases(df1))
df1[sample(1:30, size = 5),2] = NA #5 missing values on random allocation in marks column
!complete.cases(df1)
df1[!complete.cases(df1),2]

install.packages("mice")
library(mice)
