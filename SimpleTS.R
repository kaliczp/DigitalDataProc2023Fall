## Generate simple time-series from yearly sums
YearlyPrec <- ts(data = rowSums(rawdata[,-1]), 1980, 2022)
## Plot it
plot(YearlyPrec, ylim = c(0, 450), yaxs = "i")
## Access all montly data
as.numeric(t(as.matrix(rawdata[,-1])))
