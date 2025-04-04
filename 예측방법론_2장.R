setwd("E:\\자영폴더\\자영공부\\")

# read gdp series
library(readxl)
library(zoo)
gdp = read_excel("forecast_midAssign_.xlsx")
date_q = seq(as.Date("1960-01-01"), as.Date("2024-12-31"),"quarter")
gdp_zoo = zoo(gdp[,2:3], date_q)

# plot gdp series
plot(gdp_zoo/1000, screens=1, col=c(2,1), ylab="GDP(조 원)",  xlab="")
legend("topleft", col=c(1,2), lty=1, c("원계열","계절조정계열"), bty="n")

# gdp differencing & Moving average
gdp_ts <- ts(gdp[,2:3]/1000, start=1960, frequency = 4)
gdp_ts
dlgdp_1 = diff(log(gdp_ts[,2])) #first-order differencing
dlgdp_4 = diff(log(gdp_ts[,2]),4) #forth-order differencing
dlgdp = cbind(dlgdp_1,dlgdp_4)
spectrum(na.omit(dlgdp), spans=c(3,3), col=c("red","steelblue"),
         main="", lty=c(20,1), lwd=1.5)
legend("topright", col=c("steelblue","red"), lty=c(1,20), lwd=1.5,
       c("1차 차분", "4차 차분"), bty="n")
