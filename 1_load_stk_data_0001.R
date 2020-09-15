###
# Date: 2020-09-30
# Description: 
#       (a) project Name: "\FJU_Stat_20200930\"
#       (b) 
#       (c) For FJU student
#       (d) 
#       (e) 
###

# install.packages("purrr")
# library(purrr) # for "purrr::walk"

#--From Kaggle forum fabulous article-- BELOW
packages <-  c("reshape2", "magrittr", "RCurl", "data.table", "readxl", "tibble",
               "janitor", "lubridate", "fst", "dplyr", "readr", "httr", "RCurl",
               "XML", "rvest", "reshape2", "readxl", "psych")

my.install <- function(pkg, ...){
  if (!(pkg %in% installed.packages()[,1])) {
    install.packages(pkg)
  }
  return (library(pkg, ...))
}

purrr::walk(packages, my.install, character.only = TRUE, warn.conflicts = FALSE)
#--From Kaggle forum fabulous article-- ABOVE


DataPath <- "E:/FJU_Stat_20200930/StockData_gini/"

#--Get data list name
DataFileList <- as.data.frame(list.files(path = DataPath
                                        ,full.names = FALSE, recursive = FALSE))

#--2330 Index = 311
giniPath <- paste(DataPath, DataFileList[311, 1], sep="")
StkData <- read.csv(giniPath, header = TRUE)

#--Check small sample 
head(StkData)

#--Plot Price Trend
plot(StkData$Close, main="2330 Price", xlab="Timeseries", ylab="Price")

#--Plot log return and Descriptive Statistics
LogRtn <- diff(log(StkData$Close), lag=1)

plot(LogRtn, main="2330 Log Return",
     xlab="Timeseries", ylab="log return")

hist(LogRtn, main="2330 Log Return distribution",
     breaks=100, xlab="Log Return")

summary(LogRtn)
describe(LogRtn)

