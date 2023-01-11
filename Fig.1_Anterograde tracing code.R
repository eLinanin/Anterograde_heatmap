# Libraries
install.packages('heatmaply')
library(heatmaply)
# Load data 
Antero <- read.csv("..path to your folder here\\Figure1-Source Data.csv",sep=",")
row.names(Antero)<- Antero$X
Antero<-Antero[1:118,1:6]
Antero<-Antero[order(Antero$Mouse.1),]
Antero_matrix<-data.matrix(Antero)

# cluster rows
hc.rows<-hclust(dist(Antero_matrix))
plot(hc.rows)

# transpose the matrix and cluster columns
hc.cols <- hclust(dist(t(Antero_matrix)))
set.seed(2)
# draw heatmap for all clusters
heatmaply(Antero_matrix, Colv=as.dendrogram(hc.cols), scale='none',col=RdPu(256), rect_gp = "white",)
# draw heatmap for the 2nd cluster (for figure 1)
heatmaply(Antero_matrix[cutree(hc.rows,k=3)==2,], Colv=as.dendrogram(hc.cols), scale='none',col=RdPu(256), grid_color = "black",grid_size = 0.01,fontsize_row = 15,
          fontsize_col = 15,)
# draw heatmap for the 2 other clusters
heatmaply(Antero_matrix[cutree(hc.rows,k=3)==1,], Colv=as.dendrogram(hc.cols), scale='none',col=RdPu(256), grid_color = "black",grid_size = 0.01,fontsize_row = 14, show_dendrogram = c(F, F),titleX = F)
heatmaply(Antero_matrix[cutree(hc.rows,k=3)==3,], Colv=as.dendrogram(hc.cols), scale='none',col=RdPu(256), grid_color = "black",grid_size = 0.01,fontsize_row = 15,
          fontsize_col = 15,)
