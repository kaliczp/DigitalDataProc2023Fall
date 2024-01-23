WNmax <- apply.yearly(MonthlyTemp.xts, max)
WNmin <- apply.yearly(MonthlyTemp.xts, min)
WNminmax.df <- data.frame(MinTemp = coredata(WNmin), MaxTemp = coredata(WNmax))
WNminmax.df$Year <- 1981:2021

plot(MaxTemp ~ MinTemp, WNminmax.df, type = "n")
text(WNminmax.df[, 1:2], labels = WNminmax.df$Year)

plot(xts(MonthlyTemp.xts['2020/2022']))
