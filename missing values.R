# Missing values

x = c(NA, 1, NA, 2,3, NA)
is.na(x) #is there a missing value
sum(is.na(x))
sum(c(T,F,T,F,F))
mean(x) 
mean(x, na.rm=T)
x
x[is.na(x)] = mean(x, na.rm=T)
x
x1 = c(4,6,8,9)
length(x1[x1 >= 6])
sum(x1 >= 6)
x1 >= 6

x2 = rnorm(100000, mean=50, sd=5)
length(x2)
posn=sample(100000, size=30)
x2[posn] = NA
sum(is.na(x2))


install.packages("VIM")
library(VIM)
?sleep
head(sleep)
dim(sleep)
complete.cases(sleep)
sum(complete.cases(sleep)) 
sum(!complete.cases(sleep)) #no. of rows with no missing data
sleep[complete.cases(sleep),] #rows which are complete
sleep[!complete.cases(sleep),] #rows which have missing values
colSums(is.na(sleep)) #which column how many data missing
rowSums(is.na(sleep)) #which row how many data missing




