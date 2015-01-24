#The following program downloads data from the U.S. Federal Reserve Bank
library(quantmod)

fed_tickers <- read.csv("C:/Users/ESPIJ090.WDW/whalewisdom/Fed_tickers.csv")
tickers <-as.character(fed_tickers[,1])

getSymbols(tickers,src="FRED")