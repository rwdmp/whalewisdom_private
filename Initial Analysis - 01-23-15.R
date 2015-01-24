################################
#Manual import program

#Importing the data
my_dir <- "C:/Users/ESPIJ090.WDW/whalewisdom/SQL DB"
setwd(my_dir)
stocks <- read.csv("stocks.csv", header = FALSE)

#Adding names since export didn't capture names, should fix this and delete this code later.

data_names <- c("stock_id","symbol","exchange", "name", "market_cap", "shares_outstanding", "institution_percentage", "price", "datetime", "range_low", "range_high", "fifty_two_week_low", "fifty_two_week_high","open","volume","average","dividend","yield","earnings_per_share","beta","price_to_earnings" )

names(stocks) <- data_names

#Quick data exploration
str(stocks)
summary(stocks)


################################
#Data Cleaning
stocks_no100plus <- subset(stocks, institution_percentage <= 100 )


#Should have only 1 stock symbol.
summary(stocks)

#I thought we said we would limit our analysis to nasdaq and nyse? Looks like the names are dirty as well.
table(stocks$exchange)

#Can stocks be in more than one exchange?
table(stocks$exchange,stocks$symbol)

#Why isn't all data pulled form the same date?

#Can we set up a a different set of tables for dividends, yield, earnings_per_share, beta, and price-to-earnings.

################################
#Sum of Market Capitalization for Entire Stock Market

institution_share <- function(data) {
        total_value <- sum(data$market_cap)
        
        #Calculating Institutional Ownership of Stocks
        data$institution_percentage <- data$institution_percentage/100
        institution_value <- sum(data$institution_percentage*data$market_cap)
        
        #Institutional Control
        print("Total Value is...")
        print(total_value)
        
        print("Total Institutional Value is...")
        print(institution_value)
        
        print("This means that institutions could own")
        print(institution_value/total_value)
        print("of the market")
        
}

institution_share(stocks)
institution_share(stocks_no100plus)

#Stock Price and Institution Percentage
cor(stocks$price, stocks$institution_percentage)

#Simple regression between price and financial metrics.
lm <- lm(price ~ beta + dividend + institution_percentage, data = stocks)
summary(lm)

#The following steps are to take the analysis to rattle to check for prediction accuracy.






