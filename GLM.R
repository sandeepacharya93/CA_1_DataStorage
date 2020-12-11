
library('excel')
data<-read.csv(file.choose(),header=TRUE) 
y = data$Sprint
x1 = data$Writing
x2 = data$Reading
x3 = data$Math
x4 = data$English
# data cleaning
dataset = na.omit(data.frame(x1,x2,x3,x4,y))
d = dataset[nrow(dataset),-4]
nd = head(dataset,5)
head(nd)
fit = glm(y~.,data=nd,family='gaussian')
coef(fit)
pred_full = predict(fit,nd)
require(MASS)
fit_reduced = stepAIC(fit,direction = 'backward')
coef(fit_reduced)
pred_reduced = predict(fit_reduced,nd)
data.frame()

# Split data into test and train 
y=data$Sprint
x1=data$Writing
x2=data$Reading
x3=data$Math
x4=data$English
dataset=na.omit(data.frame(y,x1,x2,x3,x4))
nd=dataset#[,-1]
n=nrow(dataset) 
set.seed(5246)
indexes = sample(n,n*(80/100)) 

trainset = nd[indexes,] 

testset = nd[-indexes,] 

fit = glm(y~.,data=trainset,family='gaussian')
coef(fit)
full_pred = predict(fit,testset)
#why didnt prof omit y from dataset
require(MASS)
fit_reduced=stepAIC(fit)
red_pred=predict(fit_reduced,testset)

#exp 2 , from class
library(MASS)
d=Boston
y = d$medv
x1 =d$age
x2 = d$rad
x3 = d$nox
dataset=data.frame(x1,x2,x3,y)
n=nrow(dataset)
set.seed(8125)
indexes = sample(n,n*(70/100)) 
trainset = nd[indexes,] 
testset = nd[-indexes,] 

fit = glm(y~.,data=trainset,family = 'gaussian')
fit_red = stepAIC(fit)

pred_full = predict(fit,testset)
pred_red=predict(fit_red,testset)
actual = testset$y
frmse = sqrt((sum(actual-pred_full))/nrow(testset))
rrmse = sqrt((sum(actual-pred_red))/nrow(testset))

#Monte carlo
library(MASS)
d=Boston