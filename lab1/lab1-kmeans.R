library(ggplot2)

ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()


x <- iris[,-5]

kc <- kmeans(x, 3, nstart = 2)

kc1 <- kmeans(iris[,3:4],3,nstart = 2)

kc

kc1

y <- iris$Species

table(kc$cluster,y)

table(kc1$cluster,y)

kc$cluster <- as.factor(kc$cluster)
ggplot(iris, aes(Petal.Length, Petal.Width, color = kc$cluster)) + geom_point()

kc1$cluster <- as.factor(kc1$cluster)
ggplot(iris, aes(Petal.Length, Petal.Width, color = kc1$cluster)) + geom_point()
