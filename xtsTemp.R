## Load library
library(xts)
TempDate <- seq.Date(as.Date("1981-01-15"), as.Date("2021-12-15"), by = "month")
MonthlyTemp.xts <- xts(as.vector(t(as.matrix(rawdataT[,-1]))), TempDate)
MonthlyTemp.xts

## See it visually
plot(MonthlyTemp.xts)
plot(MonthlyTemp.xts['1990']) ## Look at the hot year

