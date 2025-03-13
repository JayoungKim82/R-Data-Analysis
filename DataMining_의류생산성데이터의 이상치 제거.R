setwd("E:\\자영폴더\\자영공부")

prod <- read.csv("데이터마이닝 01강 실습파일\\productivityORG.csv")
head(prod)
summary(prod)
prod$date <- as.Date(prod$date,format='%m/%d/%Y')
prod$quarter <- factor(prod$quarter)
prod$department <- factor(prod$department)
prod$day <- factor(prod$day)

attach(prod)
par(mfrow=c(3,4))
boxplot(target, col="cyan3",xlab="Target Productivity")
boxplot(smv, col="cyan3",xlab="Standard Minute Value")
boxplot(wip, col="cyan3",xlab="Work in Progress")
boxplot(over_time, col="cyan3",xlab="Overtime")
boxplot(incentive, col="cyan3",xlab="Incentive")
boxplot(idle_men, col="cyan3",xlab="Idle Men")
boxplot(idle_time, col="cyan3",xlab="Idle Time")
boxplot(numchange, col="cyan3",xlab="Number of Changes in Style")
boxplot(numworkers, col="cyan3",xlab="Number of Workers")
boxplot(productivity, col="cyan3",xlab="Productivity")
detach(prod)

dout <- rep(0,15)
dout2 <- rep(0,15)
for(i in 6:15) {
  t3 <- quantile(prod[,i],0.75)
  t1 <- quantile(prod[,i],0.25)
  tq <- IQR(prod[,i],0.75)
  dout[i] <- t3 + 1.5*tq
  dout2[i] <- t1 - 1.5*tq
}

outindex <- matrix(0,1197,15)
for(i in 1:1197)
  for(j in 6:15){
    if(prod[i,j]>dout[j] || prod[i,j]<dout2[j]) outindex[i,j]<- 1
  }
prod2 <- prod[apply(outindex, 1, sum)==0,]
prodnew <- prod2[,-c(1,11:13)]
head(prodnew)


