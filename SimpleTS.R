YearlyPrec <- ts(data = rowSums(rawdata[,-1]), 1980, 2022)
plot(YearlyPrec, ylim = c(0, 450), yaxs = "i")
