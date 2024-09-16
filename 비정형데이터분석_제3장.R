getwd()
fdir <- "D:\\방송대\\비정형데이터분석"
setwd(fdir)
#install.packages("httr")
library(httr)
webpage=GET('https://press.knou.ac.kr/goods/textBookList.do?condLscValue=001&condMscValue=003&condSscValue=007&condScyr=4')
#install.packages("XML")
library(XML)
web=htmlParse(webpage)
xpathSApply(web,'//*[@id="listForm"]/div/div[3]/div[4]/div[3]/table/tbody/tr[4]/td[2]/div/h5/a',xmlValue)
xpathSApply(web,'//*[@id="listForm"]/div/div[3]/div[4]/div[3]/table/tbody/tr[3]/td[2]/div/h5/a',xmlValue)
xpathSApply(web,'//*[@id="listForm"]/div/div[3]/div[4]/div[3]/table/tbody/tr[2]/td[2]/div/h5/a',xmlValue)

ls = rep("",5)
for(i in 1:5){
  sub = paste0('//*[@id="listForm"]/div/div[3]/div[4]/div[3]/table/tbody/tr[',i,']/td[2]/div/h5/a')
  ls[i] = xpathSApply(web,sub,xmlValue)
  ls[i] = gsub("\n","",ls[i])
  ls[i] = gsub("\r","",ls[i])
  ls[i] = gsub("\t","",ls[i])
}
ls

#install.packages('rvest')
library(rvest)
library(dplyr)

exurl <-"https://ko.wikipedia.org/wiki/%EB%B9%84%EC%A0%95%ED%98%95_%EB%8D%B0%EC%9D%B4%ED%84%B0"
html_ex <- read_html(exurl,encoding = "UTF-8")
html_ex %>% html_nodes(".mw-content-ltr.mw-parser-output p") %>%html_text()

exurl00 <-"https://ko.wikipedia.org/wiki/%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD%EC%9D%98_%EA%B2%BD%EC%A0%9C"
html_ex2 <- read_html(exurl00, encoding = "UTF-8")
html_ex2 %>% html_nodes(".wikitable") %>% html_table()
