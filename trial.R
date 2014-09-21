f1 <- function(MAX_ITER=1000) {
  x<-vector("double",length(MAX_ITER))
  for(i in 1:MAX_ITER) {
    rdata<-rnorm(1000)
    x[i]<-sd(rdata)
  }
  mean(x)
}


b<-read.csv(file=gzfile('/Users/ashivaru/Developer/git/bdaas/data/Baby_Names-2009-2013-CA-CDPH.csv.gz'))

getsubset <- function(x,cond=TRUE) {
  subset(x,cond);
}
getsubset(b, b$NAME=='ANIRUDH')


