#####################################
#The following program merges data sources into a flat table.

infiles <- setwd("C:/Users/ESPIJ090.WDW/whalewisdom - data/")


#Importing all files.
AllStockPrices <- read.csv(paste(infiles,"/AllStockPrices.csv",sep=""))
