cebpb <-read.table(file = "Common BATF4 scanned with BMeMe.txt", sep="\t",stringsAsFactors=FALSE)
cebpb <- data.frame(cbind(cebpb[,4],cebpb[,5], cebpb[,6],cebpb[,9]))
cebpb[,4]<-as.numeric(as.character(cebpb[,4]))
cebpb[,3]<-as.numeric(as.character(cebpb[,3]))
cebpb[,2]<-as.numeric(as.character(cebpb[,2]))
cebpb[,4]<-(-log10(cebpb[,4]))
center_pos.cebpb <- rowMeans(cebpb[,2:3])
cebpb_box <- data.frame(pos = center_pos.cebpb, pval = cebpb[,4])
binMap.cebpb <- cut( cebpb_box$pos, breaks = seq(-200,0, by = 10), labels = seq(-200,-1, by = 10 ))
boxplot(cebpb_box$pval~binMap.cebpb,ylab="-log10 Pval",xaxt="n",main="CEBPB0nly FPWM, P-Value < 0.00001",ylim=c(3,8),col="green", add = TRUE)

######### Frequency
gggplot() +geom_histogram(data = reverse,aes(X3),binwidth = 5,alpha=.2, fill="grey") +
    geom_freqpoly(data = reverse,aes(X3,size = 'qsec'),binwidth = 5,col="red")+ geom_freqpoly(data = positive,aes(X3,size = 'qsec'),binwidth = 5,col="blue") +theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                                                                                                                                        panel.background = element_blank(), axis.line = element_line(colour = "black"))+geom_density(alpha=.2, fill="#FF6666")+labs(x = "Sequence Start Point")+labs(title = "Comparison between Matrix (blue) and its reverse compliment (red)")
