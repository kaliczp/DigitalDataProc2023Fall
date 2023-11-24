## Generate simple time-series from yearly sums
YearlyPrec <- ts(data = rowSums(rawdata[,-1]), 1980, 2022)
## Plot it
plot(YearlyPrec, ylim = c(0, 450), yaxs = "i")
## Access all montly data
MonthlyPrec <- ts(as.vector(t(as.matrix(rawdata[,-1]))), 1980, 2022, frequency = 12)
plot(MonthlyPrec)ű
## Modified plot
?par
plot(MonthlyPrec, ylim = c(0,210), xaxs = "i", lwd = 2, type = "h", yaxs = "i", ylab = "Monthly Precipitation [mm]")
