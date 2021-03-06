# Combined Plots
#plot, histogram, pie, boxplot, linechart, correlation plot

#plot
women
plot(women)
plot(women, type='p', pch=15, col='red')
plot(women, type='l')
plot(women, type='b')
plot(women, type='b', pch=18, lty=2, col=2) #lty for line/dash type
plot(women, xlim=c(30,100), ylim=c(min(women$weight)-10, 200), pch=10)
plot(women, type='p', pch=16, col='red') #pch is for plottng symbols
#more features with plot
plot(x=women$weight, y=women$height, pch=15, xlab='Weight', ylab='Height', col='red', cex=2, type='b') #cex for amplification
title(main='Main Title', sub='Sub Title')
#see cheat sheet on base graphs

plot(x=mtcars$wt, y=mtcars$mpg, col=mtcars$gear, pch=c(4,6,8), cex=mtcars$am) #color will be different for different values of gear

plot(women)
abline(lm(women$weight ~ women$height), col='red', lty=2, lwd=4) #lm is for best fit line


#boxplot
boxplot(women$height)
abline(h=c(58, 62,65,68,72))

#draw lines on plot for number summary
summary(women)
quantile(women$height)
quantile(women$height, seq(0,1,.1))
quantile(women$height, seq(0,1,.01))
stem(women$height)
boxplot(women$height, col='green')
abline(h=quantile(women$height))
text(1+.2, quantile(women$height), labels=c('min','1Q','median','3Q','max')) #1 means 1st plot; had there been 2 plots, it was 2+0.2, 0.2 on the right

#histogram
hist(women$height)
hist(women$height, breaks=10)
hist(women$height, breaks=5, col=1:5)

#histogram2
(x = rnorm(100,50,10))
hist(x)

hist(x, freq=F, col=1:5) #1 to 5 will be the sequence of colouring
hist(x, freq=F, col=1:10)
lines(density(x))

#density plot : shape of data
plot(density(x), col='red')

#pie
gender = sample(c('M', 'F'), size = 100, replace = T)
table(gender)
pie(table(gender))
x = c(10,20,40,50)
pie(x)
xlabels = c('A','B','C','D')
x/sum(x)
(labels2 = paste(xlabels, round(x/sum(x),2) * 100 , sep='-'))

(labels3 = paste0(labels2, "%"))
pie(x, labels=labels3)
((labels2 = paste0(xlabels, round(x/sum(x),2) * 100 , '%'))) #join multiple things with paste0, but no separator
pie(x, labels=labels2)
x
#barplot
barplot(x,col=1:4)
barplot(x,col=1:4, horiz = T)

#correlation plot
pairs(women)
cor(women$height,women$weight)
cov(women$height, women$weight)
head(mtcars)
?mtcars

cor(mtcars)
names(mtcars)
pairs(mtcars)
pairs(mtcars[1:4])
options(digits=4)
pairs(mtcars[c('mpg', 'wt','hp')])
