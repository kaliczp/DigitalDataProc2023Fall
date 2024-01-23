WNmax <- apply.yearly(MonthlyTemp.xts, max)
WNmin <- apply.yearly(MonthlyTemp.xts, min)
WNminmax.df <- data.frame(MinTemp = coredata(WNmin), MaxTemp = coredata(WNmax))
WNminmax.df$Year <- 1981:2021

plot(MaxTemp ~ MinTemp, WNminmax.df, type = "n")
text(WNminmax.df[, 1:2], labels = WNminmax.df$Year)


par(new = FALSE)
PlotYears <- '2020/2021'
plot.zoo(xts(MonthlyPrec.xts[PlotYears]), yaxt = "n", ylab = "")
axis(4)
par(new = TRUE)
plot.zoo(xts(MonthlyTemp.xts[PlotYears]), col = "red")

par(new = FALSE)
PlotYears <- '2020/2021'
plot.zoo(xts(MonthlyPrec.xts[PlotYears]), yaxt = "n", ylab = "")
axis(4)
par(new = TRUE)
plot.zoo(xts(MonthlyTemp.xts[PlotYears]), col = "red")

WNprec <- apply.yearly(MonthlyPrec.xts, sum)

WNyearlyshift.df <- data.frame(SumPrec = coredata(WNprec['1980/2020']), MinTemp = coredata(WNmin['1981/2021']), MaxTemp = coredata(WNmax['1981/2021']))
WNyearlyshift.df$Year <- 1980:2020

plot(MaxTemp ~ MinTemp, WNyearlyshift.df, type = "n")
text(WNyearlyshift.df[, 2:3], labels = WNyearlyshift.df$Year)

plot(MaxTemp ~ SumPrec, WNyearlyshift.df, type = "n")
text(WNyearlyshift.df[, c(1,3)], labels = WNyearlyshift.df$Year)

plot(MinTemp ~ SumPrec, WNyearlyshift.df, type = "n")
text(WNyearlyshift.df[, c(1,2)], labels = WNyearlyshift.df$Year)
