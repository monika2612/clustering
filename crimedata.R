crimedata <- read.csv(file.choose())
View(crimedata)
# Normalizing continuous columns to bring them under same scale
normalized_data<-scale(crimedata[,2:5]) #excluding the university name columnbefore normalizing
?dist
d <- dist(normalized_data, method = "euclidean") # distance matrix
?hclust
fit <- hclust(d, method="complete")
?hclust
plot(fit) # display dendrogram
plot(fit, hang=-1)

?cutree
rect.hclust(fit, k=2, border="red")
?rect.hclust
groups <- cutree(fit, k=2) # cut tree into 5 clusters

membership<-as.matrix(groups) # groups or cluster numbers
ans <- data.frame(crimedata, membership)

View(ans)

write.csv(final, file="ans.csv",row.names = F)
aggregate(crimedata[,-1],by=list(ans$membership),mean)

aggregate(Uni[,-1],by=list(final$membership),mean)
