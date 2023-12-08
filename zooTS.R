install.packages("xts")
## Load library
library(xts)
?xts
Sys.Date()
as.Date("1980-01-15")
TSDate <- seq.Date(as.Date("1980-01-15"), as.Date("2022-12-15"), by = "month")
MonthlyPrec.xts <- xts(as.vector(t(as.matrix(rawdata[,-1]))), TSDate)
plot(MonthlyPrec.xts)
MonthlyPrec.xts['2022']
plot(MonthlyPrec.xts['2022'], type = 'h')
plot(MonthlyPrec.xts['2020/2022'], type = 'h')
YearlyPrec <- apply.yearly(MonthlyPrec.xts, sum)
plot(YearlyPrec)

FiveYearsMean <- period.apply(YearlyPrec, endpoints(YearlyPrec, "years", 5), mean)
plot(FiveYearsMean)
FiveYearsMean <- period.apply(MonthlyPrec.xts, endpoints(MonthlyPrec.xts, "years", 5), mean)
plot(FiveYearsMean)

plot(MonthlyPrec)
lines(filter(MonthlyPrec,rep(1/23,23)),col=3)
lines(filter(MonthlyPrec,rep(1/59,59)),col=4, lwd =2)
