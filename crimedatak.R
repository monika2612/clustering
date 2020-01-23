###crimedata
input<-read.csv(file.choose())
View(input)
mydata<- input[1:50,-1]
View(mydata)
normalized_data<-scale(mydata[,1:4])
View(normalized_data)

mydata$centers



# selecting K for kmeans clustering using kselection
install.packages("kselection")
library(kselection)


k <- kselection(mydata[,1:4], parallel = TRUE, k_threshold = 0.9, max_centers=10)
k$max_centers

?kselection

install.packages("doParallel")
library(doParallel)
registerDoParallel(cores=4)
k <- kselection(mydata[,1:4], parallel = TRUE, k_threshold = 0.9, max_centers=10)
k



library(animation)

data <- kmeans.ani(mydata, 2)
data$size



# model Building
fit <- kmeans(normalized_data, 2) # 2 cluster solution
fit$cluster
final2<- data.frame(mydata, fit$cluster) # append cluster membership
View(final2)
library(data.table)
setcolorder(final2, neworder = c("fit.cluster"))
View(final2)
aggregate(input[,2:5], by=list(fit$cluster), FUN=mean)
fit$size





  