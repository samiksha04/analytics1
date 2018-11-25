?AirPassengers
library()
install.packages("amap")
?mean()
??mean
x <- c(0:10, 50)
x
c(mean(x), mean(x, trim = 0.1))
?methods
plot(women)
#datastructures
rep(c(3,6,7), times = 3)
(x1<-1:30)
(x2=c(93L, 5L))
class(x2)
seq(0,100,3)
x6 <- seq(0, 100, 3)
x6[1:5]
x6[seq(1,length(x6), 2)]
x6[seq(2, length(x6), 2)]
x6[c(-2,4)] #not possible
x6[x6 > 30 | x6 < 40] #OR function
x6[x6>30 & x6<40] #AND function
length(x6)
x6[length(x6)-1]
x6[-length(x6)-1]
x6[-(length(x6)-1)]
set.seed(1234) #Seeding value
(x6=sample(1:50))
sort(x6)[-c(1,2)] #Remove 1st 2 values and sort the rest
x6
rev(x6)
x6[2:10] <- 99
x6
x6[x6>30 & x6<40] = 999
x6
(x7=x6[1:4])
(x=seq(1,5, length.out = 15))
(x=rnorm(10000000))
plot(density(x))
abline(v=c(-3,0,3))
(x1 = rnorm(100, mean = 50, sd = 5))
plot(density(x1))
abline(v=mean(x1), h=0.04)
hist(x1)
hist(x1, breaks = 15)
hist(x1, freq = F) #F-False
lines(density(x1), col=2)
summary(x1)
quantile(x1,seq(0,1,0.1)) #decile
quantile(x1,seq(0,1,0.01)) #percentile
quantile(x1,c(0.1, 0.5, .8))
stem(x1)

#Matrix
length(100:111)
matrix(1, ncol=3, nrow = 4)
(m1=matrix(100:111, nrow=4)) # Fill data by default - by every column
(m1=matrix(100:111, nrow=4, bycol= T))
(m1=matrix(100:111, ncol=4, byrow=T)) # Fill data by every row
x=101:124
matrix(x,ncol = 6)
m1[1,] ; m1[,-1]
m1[1,-1]
m1[,1,drop=F]
m1[,-c(1,3), drop=F]
m1[m1>105 & m1<108] #All values lying between 105 & 108
paste("C","D", sep="-")
m1
(colnames(m1) = paste('C', 1:4, sep='')) #giving column names
(rownames(m1) = paste("R", 1:3, sep = '')) #giving row names
m1
(m3=1:24)
dim(m3)=c(6,4)
m3
m3[1:8]
m2=1:12
m2[c(T,F,T,F)]
rbind(m2, c(50,60,70))
m2
(m2 = matrix(m2, ncol=4, nrow=3))
m2=rbind(m2, c(50,60,70,80)) #Adding more rows in the matrix
colSums(m2)
colMeans(m2)
t(m2) #Transpose
sweep(m1, MARGIN = 1, STATS=c(2,3,4,5), FUN = "+") #Increment every number in each row
sweep(m1, MARGIN = 1, STATS=c(2,3,4), FUN = "+")
sweep(m1, MARGIN = 2, STATS=c(2,3,4,5), FUN = "*")

#addmargins
addmargins(m1, margin = 1, sum) 
addmargins(m1, margin = 2, mean)
addmargins(m1,c(1,2), mean)
addmargins(m1,c(1,2), list(list(mean,sum, max), list(var,sd)))#Row and col wise function

#dataframe----
(rollno = 1:30)
(sname = paste('student', 1:30, sep = ''))
(gender= sample(c('M','F'), size = 30, replace=T, prob = c(0.7,.3))) #Picking 30 chits with M&F by replacing the chits
table(gender) #counting frequency
prop.table(table(gender)) #proportion of the values in the table
(marks1 = floor(rnorm(30, mean = 50, sd=10)))
(marks2 = ceiling(rnorm(30,40,5)))
(course = sample(c('BBA','MBA'), size = 30, replace = T, prob = c(.5,.5)))
rollno ; sname ; gender
marks1 ; marks2 ; course

#create DF
df1 = data.frame(rollno, sname, gender, marks1, marks2, course, stringsAsFactors = F) #strings remain as it is, dont get converted to factors
df1
str(df1) #structure of DF
head(df1) #Top 6 rows
tail(df1) #Last 6 rows
(df1$gender = factor(df1$gender))
summary(df1)
boxplot(marks1)
boxplot(marks1 ~ gender + course, data = df1)
df1$gender
(head(df1[ , c(2,4)]))
(df1[1:10, ])
df1[marks1>50 & gender=="F", c(1,2,4)]
df1[marks1>50 | gender=='F', ]

aggregate(df1$marks1, by=list(df1$gender), FUN=sum)
aggregate(marks1 ~ gender, data = df1, FUN=max)
aggregate(cbind(marks1,marks2) ~ gender, data = df1, FUN=max)
aggregate(cbind(marks1,marks2) ~ gender + course, data = df1, FUN=mean)

#Factor----
(grades = sample(c('A', 'B', 'C', 'D'), size = 30, replace = T, prob=c(.3,.2,.4,.1)))
summary(grades)
table(grades)
gradesFactor = factor(grades)
summary(gradesFactor)
(gradesFactorordered = factor(grades, ordered = T))
summary(gradesFactorordered) #default ordering
(gradesFactororderedLevels = factor(grades, ordered = T, levels = c('D','C','B','A'))) #according to how we define
pie(summary(gradesFactororderedLevels))
barplot(summary(gradesFactororderedLevels), col = 1:4)
library(dplyr)
library(tidyverse)
install.packages("tidyverse")
install.packages(c('dplyr','tidyverse')) #install both packages at the same time
library(tidyverse)

#Filter----
head(mtcars)
mtcars %>% select(1:3) %>% arrange(cyl, mpg) #increasing order of mpg and cyl
mtcars %>% select(1:3) %>% arrange(cyl, -mpg) %>% select(c(2,1,3)) %>% head #last head is for 1st 6 rows

mtcars %>% filter(cyl==8)
filter(mtcars, cyl==8)
filter(mtcars, cyl < 6)
filter(mtcars, cyl<6 & vs == 1)
filter(mtcars, cyl<6 | vs == 1)
filter(mtcars, cyl<6 , vs == 1)
filter(mtcars, row_number() ==1L) #L for integer
tail(mtcars)
filter(mtcars, row_number() == n()) #for last row
filter(mtcars, row_number(), 5, n()-2)

#mutate----
mutate(mtcars, displ_l = disp/61) #keeps other columns and adds 1
transmute(mtcars, displ_l = disp/61) #removes other cols
mutate(mtcars, cyl=NULL) #dont display cyl

#slice---- 
#works on rows
slice(mtcars, c(2, 4, 5, 10))


mtcars %>% group_by(am) %>% summarise(mean(mpg), max(wt), min(wt))


