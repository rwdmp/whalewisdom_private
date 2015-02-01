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


#Exporting clean data set.
write.csv(daily_fed,paste(infiles,"/DailyFed_clean.csv",sep=""))


