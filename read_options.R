o<-read.csv(file='/Users/ashivaru/options.csv')
x<-subset(o,o$OpPrice > 2)
# print(x)
write.csv(x,file='b.csv')