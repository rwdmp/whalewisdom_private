#####################################
#The following program merges data sources into a flat table.

infiles <- setwd("C:/Users/ESPIJ090.WDW/whalewisdom - data/")


#Importing all files.
stocks_clean <- read.csv(paste(infiles,"/AllStockPrices_clean.csv",sep=""))
fed_clean <- read.csv(paste(infiles,"/DailyFed_clean.csv",sep=""))




#Exporting merged file
merged <- merge(stocks_clean, fed_clean,by.date = "date",by.date="date",all= TRUE)

#Sorting
merged <- merged[order(merged$ticker, merged$date),]


#Exporting merged data.
write.csv(merged,paste(infiles,"/merged.csv",sep=""))



