mtcars
km1 = kmeans(mtcars, centers = 3) #cluster into 3 groups
km1$centers
km1 = kmeans(mtcars[,c('mpg','wt')], centers = 3)
km1$centers
df=mtcars[c('mpg','wt')]
df
df2=scale(df)
df2
