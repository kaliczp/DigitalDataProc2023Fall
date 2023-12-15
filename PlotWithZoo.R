plot.zoo(MonthlyTemp.xts)

plot.zoo(MonthlyPrec.xts)
axis.Date(1, at = as.Date(paste0("198",1:9,"-01-01")), labels = FALSE)
