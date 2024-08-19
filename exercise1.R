#1. 

#(1) 
dia00 <- read.csv("diamond.csv")
dia01 <- as.data.frame(dia00)
dia01
str(dia01)

#(2)
library(dplyr)
dia02 <- dia01 %>% mutate(Carat=replace(Carat,Carat=="9","0.9"))
dia02

#(3)
table(dia02$Cut)

#(4)
dia03 <- dia02 %>% filter(Carat>=0.6) %>% mutate(Price = replace(Price, Price =="결측",NA)) %>%
  mutate(Price=as.double(Price))
dia04 <- mean(dia03$Price, na.rm = T)  
dia04

#(5)
write.csv(dia04, file = "dia04.csv")
