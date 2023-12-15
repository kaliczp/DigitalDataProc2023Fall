plot.zoo(MonthlyTemp.xts)

plot.zoo(MonthlyPrec.xts)
axis.Date(1, at = as.Date(paste0(1981:2022,"-01-01")), labels = FALSE)
