#####################################
#The following program cleans and prepares the data for All Stock Prices.

infiles <- setwd("C:/Users/ESPIJ090.WDW/whalewisdom - data/")


#Importing all files.
AllStockPrices <- read.csv(paste(infiles,"/AllStockPrices.csv",sep=""))

#Deleting columns (stocks) that only have NA values.
AllStockPrices<-AllStockPrices[,colSums(is.na(AllStockPrices)) != nrow(AllStockPrices)]

#Creating a date variable.
AllStockPrices$date <- as.Date(as.character(AllStockPrices$X.1))
AllStockPrices <- AllStockPrices[-1]

#Melting and reshaping so data is tidy.
library(reshape)
AllStockPrices <- melt(AllStockPrices, id=c("date"))
names(AllStockPrices) <- c("date","ticker","stock_price")


#Exporting clean data set.
write.csv(AllStockPrices,paste(infiles,"/AllStockPrices_clean.csv",sep=""))

