###########################
#The following program cleans data the Fed macroeconomic data.

infiles <- setwd("C:/Users/ESPIJ090.WDW/whalewisdom - data/")

#Importing all files.
daily_fed <- read.csv(paste(infiles,"/DailyFed.csv",sep=""))

#Deleting columns (stocks) that only have NA values.
daily_fed<-daily_fed[,colSums(is.na(daily_fed)) != nrow(daily_fed)]

#Creating a date variable.
daily_fed$date <- as.Date(as.character(daily_fed$X))
daily_fed <- daily_fed[-1]

#Keeping only complete cases.
daily_fed <- na.omit(daily_fed)

#Creating lags of these variables.
library(DataCombine)
Fed_tickers <- read.csv(paste(infiles,"/Fed_tickers.csv",sep=""))
tickers <- Fed_tickers$tickers
daily_fed <- slide(daily_fed, Var = tickers[1], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[2], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[3], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[4], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[5], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[6], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[7], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[8], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[9], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[10], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[11], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[12], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[13], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[14], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[15], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[16], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[17], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[18], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[19], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[20], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[21], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[22], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[23], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[24], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[25], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[26], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[27], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[28], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[29], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[30], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[31], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[32], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[33], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[34], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[35], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[36], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[37], slideBy = -1)
daily_fed <- slide(daily_fed, Var = tickers[38], slideBy = -1)


daily_fed <- daily_fed[-c(1:36)]


#Exporting clean data set.
write.csv(daily_fed,paste(infiles,"/DailyFed_clean.csv",sep=""))


