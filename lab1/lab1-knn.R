library(class)

str(iris)
summary(iris)

set.seed(23)
rnum<- sample(rep(1:150))

iris <- iris[rnum,]

normalize <- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}

iris.new<- as.data.frame(lapply(iris[,c(1,2,3,4)],normalize))
head(iris.new)

# subset the dataset
iris.train<- iris.new[1:120,]
iris.train.target<- iris[1:120,5]
iris.test<- iris.new[121:150,]
iris.test.target<- iris[121:150,5]
summary(iris.new)

model1<- knn(train=iris.train, test=iris.test, cl=iris.train.target, k=20)
TF <- table(iris.test.target, model1)

acc <- (sum(diag(TF)/sum(TF)))
acc
TF


