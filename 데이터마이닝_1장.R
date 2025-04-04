setwd("E:\\자영폴더\\자영공부\\데이터마이닝 01강 실습파일")

prod <- read.csv("productivityORG.csv")
prod$date <- as.Date(prod$date, format = '%m/%d/%y')
prod$quarter <- factor(prod$quarter)
prod$department <- factor(prod$department)
prod$day <- factor(prod$day)
prod$team <- factor(prod$team)
summary(prod)

#boxplot
attach(prod)
par(mfrow=c(3,4))
boxplot(target, col="cyan3", xlab="Target Productivity")
boxplot(smv, col="cyan3", xlab="Standard Minute Value")
boxplot(wip, col="cyan3", xlab="Work in progress")
boxplot(over_time, col="cyan3", xlab="Overtime")
boxplot(incentive, col="cyan3", xlab="Incentive")
boxplot(idle_time, col="cyan3", xlab="Idle Time")
boxplot(idle_men, col="cyan3", xlab="Idle Men")
boxplot(numchange, col="cyan3", xlab="Number of Changes in Style")
boxplot(numworkers, col="cyan3", xlab="Number of Workers")
boxplot(productivity, col="cyan3", xlab="Productivity")

#remove outlier
dout <- rep(0,15)
dout2 <- rep(0,15)
for(i in 6:15){
  t3 <- quantile(prod[,i], 0.75)
  t1 <- quantile(prod[,i], 0.25)
  tq <- IQR(prod[,i], 0.75)
  dout[i] <- t3 + 1.5*tq
  dout2[i] <- t1 - 1.5*tq
}

outindex <- matrix(0,1197,15)

