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
