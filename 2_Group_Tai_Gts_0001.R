###
# Date: 2020-09-30
# Description: 
#       (a) project Name: "\FJU_Stat_20200930\"
#       (b) 
#       (c) For FJU student
#       (d) 
#       (e) 
###

#--TWSE
TaiFileList <- subset(DataFileList, grepl("TAI", DataFileList[,1]))
rownames(TaiFileList) <- NULL
nrow(TaiFileList)

#--TPEX
GtsFileList <- subset(DataFileList, grepl("GTS", DataFileList[,1]))
rownames(GtsFileList) <- NULL
nrow(GtsFileList)



#--TWSE Volume Value
VolValueTWSE <- c()
PriceSeqTWSE <- c()
for(m in 1:nrow(TaiFileList)) {
  # m <- 1
  TempPath <- paste(DataPath, TaiFileList[m, 1], sep="")
  TempData <- read.csv(TempPath, header = TRUE)
  
  LastIdx <- nrow(TempData)
  TempVolValue <- TempData$Close[LastIdx] * TempData$Volume[LastIdx] * 1000 / 100000000
  TempPrice <-TempData$Close[LastIdx]
  
  VolValueTWSE <- c(VolValueTWSE, TempVolValue)
  PriceSeqTWSE <- c(PriceSeqTWSE, TempPrice)
}
summary(VolValueTWSE)
summary(PriceSeqTWSE)


#--TPEX Volume Value
VolValueTPEX <- c()
PriceSeqTPEX <- c()
for(m in 1:nrow(GtsFileList)) {
  # m <- 1
  TempPath <- paste(DataPath, GtsFileList[m, 1], sep="")
  TempData <- read.csv(TempPath, header = TRUE)
  
  LastIdx <- nrow(TempData)
  TempVolValue <- TempData$Close[LastIdx] * TempData$Volume[LastIdx] * 1000 / 100000000
  TempPrice <-TempData$Close[LastIdx]
  
  VolValueTPEX <- c(VolValueTPEX, TempVolValue)
  PriceSeqTPEX <- c(PriceSeqTPEX, TempPrice)
}
summary(VolValueTPEX)
summary(PriceSeqTPEX)




