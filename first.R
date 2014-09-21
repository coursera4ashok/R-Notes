o<-read.csv(file='/Users/ashivaru/Reports/options.csv')
x<-subset(o,o$OpPrice > 2)
# print(x)
write.csv(x,file='~/Reports/b.csv')
