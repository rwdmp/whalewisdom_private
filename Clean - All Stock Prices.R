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

#Keep only Dow 30 Stocks.

stocks_clean <- AllStockPrices[ which(AllStockPrices$ticker=='MMM' | AllStockPrices$ticker=='AXP'|AllStockPrices$ticker=='T' |AllStockPrices$ticker=='BA'|AllStockPrices$ticker=='CAT'|AllStockPrices$ticker=='CVX'|AllStockPrices$ticker=='CSCO'|AllStockPrices$ticker=='KO'|AllStockPrices$ticker=='DIS'|AllStockPrices$ticker=='DD'|AllStockPrices$ticker=='XOM'|AllStockPrices$ticker=='GE'|AllStockPrices$ticker=='GS'|AllStockPrices$ticker=='HD'|AllStockPrices$ticker=='IBM'|AllStockPrices$ticker=='INTC'|AllStockPrices$ticker=='JNJ'|AllStockPrices$ticker=='JPM'|AllStockPrices$ticker=='MCD'|AllStockPrices$ticker=='MRK'|AllStockPrices$ticker=='MSFT'|AllStockPrices$ticker=='NIKE'|AllStockPrices$ticker=='PFE'|AllStockPrices$ticker=='PG'|AllStockPrices$ticker=='TRV'|AllStockPrices$ticker=='UTX'|AllStockPrices$ticker=='UNH'|AllStockPrices$ticker=='VZ'|AllStockPrices$ticker=='WMT'), ]

stocks_clean <- na.omit(stocks_clean)


#Create lags of stock price.
library(DataCombine)
stocks_clean <- slide(stocks_clean, Var = "stock_price", GroupVar = "ticker",slideBy = -1)
library(DataCombine)
stocks_clean <- slide(stocks_clean, Var = "stock_price", GroupVar = "ticker",slideBy = -2)
library(DataCombine)
stocks_clean <- slide(stocks_clean, Var = "stock_price", GroupVar = "ticker",slideBy = -3)
library(DataCombine)
stocks_clean <- slide(stocks_clean, Var = "stock_price", GroupVar = "ticker",slideBy = -4)
library(DataCombine)
stocks_clean <- slide(stocks_clean, Var = "stock_price", GroupVar = "ticker",slideBy = -5)
library(DataCombine)
stocks_clean <- slide(stocks_clean, Var = "stock_price", GroupVar = "ticker",slideBy = -6)
library(DataCombine)
stocks_clean <- slide(stocks_clean, Var = "stock_price", GroupVar = "ticker",slideBy = -7)
library(DataCombine)
stocks_clean <- slide(stocks_clean, Var = "stock_price", GroupVar = "ticker",slideBy = -8)
library(DataCombine)
stocks_clean <- slide(stocks_clean, Var = "stock_price", GroupVar = "ticker",slideBy = -9)
library(DataCombine)
stocks_clean <- slide(stocks_clean, Var = "stock_price", GroupVar = "ticker",slideBy = -10)


#Exporting clean data set.
write.csv(stocks_clean,paste(infiles,"/AllStockPrices_clean.csv",sep=""))

