###crimedata
library(readxl)
input<-read_excel(file.choose())
View(input)
mydata<- input[1:4000,-1]
View(mydata)
normalized_data<-scale(input[,2:12])
View(normalized_data)

# model Building
fit <- kmeans(normalized_data, 5) # 5 cluster solution
fit$cluster
final2<- data.frame(mydata, fit$cluster) # append cluster membership
View(final2)
library(data.table)
setcolorder(final2, neworder = c("fit.cluster"))
View(final2)
aggregate(input[,2:12], by=list(fit$cluster), FUN=mean)
fit$size

