###################
#Imports detailed company information

library(quantmod)

#Specifying symbol to get data for.
ticker <- c("DIS")

#Retrieving data.
getFinancials(Symbol=ticker, src="google")
DIS <- viewFinancials(DIS.f, type=c('BS','IS','CF'), period=c('Q'))

#Transforming data into a more useful form.
DIS_t <- t(DIS)
DIS_t2 <- cbind(DIS_t,ticker)

