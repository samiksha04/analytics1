#https://cran.r-project.org/web/packages/olsrr/olsrr.pdf
#install.packages('olsrr')
library(olsrr) #create a combination of all variables and make a model for you

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
summary(model)

k <- ols_step_all_possible(model)
plot(k)
k
summary(lm(mpg ~ wt, data=mtcars))
summary(lm(mpg ~ wt+ hp, data=mtcars))
summary(lm(mpg ~ hp + wt + qsec, data=mtcars))
