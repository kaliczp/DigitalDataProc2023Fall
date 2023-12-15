plot.zoo(MonthlyTemp.xts)

plot.zoo(MonthlyPrec.xts)
axis.Date(1, at = as.Date(paste0(c(1983,1986),"-01-01")), labels = FALSE)
