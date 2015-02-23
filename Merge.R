#####################################
#The following program merges data sources into a flat table.

infiles <- setwd("C:/Users/ESPIJ090.WDW/whalewisdom - data/")


#Importing all files and filtering observations and columns.
stocks_clean <- read.csv(paste(infiles,"/AllStockPrices_clean.csv",sep=""))
drops <- c("X")
stocks_clean<-stocks_clean[,!(names(stocks_clean) %in% drops)]



fed_clean <- read.csv(paste(infiles,"/DailyFed_clean.csv",sep=""))
drops <- c("X")
fed_clean<-fed_clean[,!(names(fed_clean) %in% drops)]

#Exporting merged file
merged <- merge(x=stocks_clean, y=fed_clean,by.date = "date",by.date="date",all.x= TRUE)



#removing missing variables and sorting
merged <- na.omit(merged)
merged <- merged[order(merged$ticker, merged$date),]

#Exporting dataset for analysis in Rattle.
write.csv(merged,"merged.csv")
library(rattle)
rattle()











