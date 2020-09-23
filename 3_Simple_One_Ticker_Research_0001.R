###
# Date: 2020-09-30
# Description: 
#       (a) project Name: "\FJU_Stat_20200930\"
#       (b) 
#       (c) For FJU student
#       (d) 
#       (e) Simple One Ticker Research
#       (f) Outperformance Ticker: 4934, 4976, 6233, 6165, 1513
###

# install.packages("purrr")
# library(purrr) # for "purrr::walk"

#--From Kaggle forum fabulous article-- BELOW
packages <-  c("reshape2", "magrittr", "RCurl", "data.table", "readxl", "tibble",
               "janitor", "lubridate", "fst", "dplyr", "readr", "httr", "RCurl",
               "XML", "rvest", "reshape2", "readxl", "psych", "plotly",
               "quantmod")

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

#--4934 Index = 1037
giniPath <- paste(DataPath, DataFileList[1037, 1], sep="")
StkData <- read.csv(giniPath, header = TRUE)

#--Check small sample 
head(StkData)

#--Plot candlestick (#%y for 2 digits of year, %Y for 4 digits of year)
timeVector = strptime(StkData$Date,"%Y%m%d",tz = Sys.timezone() ) 
TSdata <- xts(StkData[,c(4:8)], as.POSIXct(timeVector))

View(TSdata)
chartSeries(TSdata)

#--Small Period range
duration="2020-01-01::2020-12-31"
chartSeries(TSdata[duration])


#--ADD Indicator
addSMA(20,col="blue")
addMACD()
addBBands()
