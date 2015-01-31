#####################################
#The following program cleans and prepares the data for All Stock Prices.

infiles <- setwd("C:/Users/ESPIJ090.WDW/whalewisdom - data/")


#Importing all files.
AllStockPrices <- read.csv(paste(infiles,"/AllStockPrices.csv",sep=""))

#Correcting Variable Types
AllStockPrices$date <- as.Date(as.character(AllStockPrices$X.1))AllStockPrices <- AllStockPrices[-1]

#Melting and reshaping.

library(reshape)
AllStockPrices <- melt(AllStockPrices, id=c("date"))



write.csv(paste(infiles,"/AllStockPrices_clean.csv",sep=""))

