#chapter 1 R데이터 처리

#객체의 생성과 저장
2*3+1
a <-2
b <-3
c <-1
a*b+c
d <- a*b+c
d

#객체의 형태
typeof(d)
x <-"KNOU"
typeof(x)
y <-TRUE
y
typeof(y)
yy <- 2>3
yy
typeof(yy)
z <- as.factor(1)
z
typeof(z) #R내부에서 factor형의 데이터가 정수값으로 변환되어 저장되어 있어 interger로 출력
is.factor(z)
e<-c(1,10,100)
e
f <- 1:5
f
g <- seq(1,9,2)
g
h <- rep(1,5)
h
i <- c(e,f,g)
i
j <- matrix(1:8, ncol = 2)
j
k <- matrix(1:8, nrow=2)
k
l <- cbind(g,h)
l
m <- rbind(g,h)
m
n <- as.character(h)
n
cbind(g,n)
typeof(cbind(g,n)) #행렬의 원소는 n이character이고, g는 double형태이다. 타입이 다른 두 형태가 cbind, rbind로 묶이면 둘 중 하나의 데이터로 강제로 통일 시킨다.
typeof(g)
name <- c("Kim","Lee","Park")
age <- c(35,42,27)
sex <- as.factor(c("Female","Male","Female"))
dat <- data.frame(name,age,sex)
dat
typeof(dat)
v <- 1:4
v
v[2]
v[2] <-100
v
m <- matrix(1:8, ncol = 2)
m
m[1,2]
m[1,]
m[,2]
df <- as.data.frame(m)
typeof(m)
typeof(df)
df
df[1,2]
df[1,]
df[,2]
df$V2
v0 <- 1:4
is.na(v0)
is.na(v0[2])
v0[2] <- NA
v0
is.na(v0)
is.na(v0[1])
is.na(v0[2])
s1 <-2
v1 <- 1:3
m1 <- matrix(1:6, ncol = 2)
v1
v1 + s1
v1 * s1
v1 / s1
v1 ^2
m1
m1 + s1
m1 * s1
v1 <- 1:3
v2 <- rep(10,3)
v3 <- 1:5
v4 <- 1:6
v2
v1 + v2
v1 * v2
v1 + v3
v1 + v4 #v1은 벡터의 길이가 3, v4은 벡터의 길이가 6으로 배수의 관계에 있어 경고메시지가 출력되지 않음
library(readxl)
#install.packages("readxl")
dat0 <- read_excel("patients_2sheets.xlsx")
dat1 <- read_excel("patients_2sheets.xlsx", sheet = "whole")
dat2 <- read_excel("patients_2sheets.xlsx", sheet = "subset", col_names = FALSE)
dat3 <- read_excel("patients_2sheets.xlsx", sheet="subset", col_names = c("id","age","sex","treatment","CA19.9","CRP","Stage","complication"))
dat2
dat3
dat4 <- read.csv("patients.csv")
dat5 <- read.table("patients_tab.txt", header=T)
dat4
dat5
write.csv(dat3,"subset_data.csv")
write.table(dat3,"subset_data.txt")
save(dat3,file="subset_data.RData")
load("subset_data.RData")

#dplyr Package
library(dplyr)
x <- 1:10
sum(x)
x %>% sum()

sum(round(log(x)))
x %>% log() %>% round() %>% sum()
sum(round(log(x),digits = 1))
x %>% log() %>% round(digits = 1) %>% sum()

dat.base1 <- dat1
colnames(dat1)
colnames(dat.base1)[4] <-"TX"
colnames(dat.base1)[5] <- "CA19.9"

dat.base1.1 <- dat1
colnames(dat.base1.1)[colnames(dat.base1.1)=="treatment"] <-"TX"
colnames(dat.base1.1)[colnames(dat.base1.1)=="CA19-9"] <-"CA19.9"
colnames(dat.base1.1)
dat.dplyr1 <- dat1 %>% rename(TX=treatment, CA19.9="CA19-9")
dat.dplyr1

dat.base2 <- dat.base1[,c(2:5,7)]
dat.base2
dat.base2.1 <- dat.base1[,-c(1,6,8)]
dat.base2.1
dat.base2.2 <- dat.base1[,c("age","sex","TX","CA19.9","Stage")]
dat.base2.2
dat.dplyr2 <- dat.dplyr1 %>% select("age","sex","TX","CA19.9","Stage")
dat.dplyr2
dat.dplyr2.1 <- dat.dplyr1 %>% select(,c(2:5,7))
dat.dplyr2.1
dat.dplyr2.2 <- dat.dplyr1 %>% select(,-c(1,6,8))
dat.dplyr2.2
dat.dplyr2.3 <- dat.dplyr1 %>% select(-id,-CRP,-complication)
dat.dplyr2.3

dat.base3 <- dat.base2[dat.base2$age>=40,]
dat.base3
dat.base3.1 <- dat.base2[dat.base2$Stage==3,]
dat.base3.1
dat.base3.2 <- dat.base2[dat.base2$age>=40&dat.base2$Stage==3,]
dat.base3.2
dat.base3.3 <- dat.base2[dat.base2$age>=40 | dat.base2$Stage==3,]
dat.base3.3

dat.dplyr3 <- dat.dplyr2 %>% filter(age>=40)
dat.dplyr3
dat.dplyr3.1 <- dat.dplyr2 %>% filter(Stage==3)
dat.dplyr3.1
dat.dplyr3.2 <- dat.dplyr2 %>% filter(age>=40 & Stage==3)
dat.dplyr3.2
dat.dplyr3.3 <- dat.dplyr2 %>% filter(age>=40 | Stage ==3)
dat.dplyr3.3

typeof(dat1)
dat.base4 <- dat.base3
dat.base4$CA19.9[dat.base4$CA19.9=="<1.0"] <-"1"
dat.base4
dat.base4.1 <- dat.base3
dat.base4.1$CA19.9 <- replace(dat.base4$CA19.9, dat.base4.1$CA19.9=="<1.0",1)
dat.base4.1
dat.dplyr4 <- dat.dplyr3 %>% mutate(CA19.9=replace(CA19.9,CA19.9=="<1.0",1))
dat.dplyr4
