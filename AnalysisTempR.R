### Correlate data sets
## Make a data.frame
PT.df <- data.frame(P = coredata(MonthlyPrec.xts['1981/2021']),
                    T = coredata(MonthlyTemp.xts)
                    )
## Plot your data
plot(PT.df)
## Same as above with formula
plot(T ~ P,data = PT.df)
## Same as above with dollar variable selection
plot(PT.df$P, PT.df$T)
## With indexing
plot(PT.df[, 1], PT.df[, 2])
## with name index
plot(PT.df[, "P"], PT.df[, "T"])
## Change aexes
plot(P ~ T,data = PT.df)
plot(PT.df$T, PT.df$P)
plot(PT.df[, 2], PT.df[, 1])
plot(PT.df[, "T"], PT.df[, "P"])

## Correlation
cor(PT.df)
cor(PT.df, use = "complete.obs")
cor(PT.df["P"], PT.df["T"], use = "complete.obs")
cor(PT.df$P, PT.df$T, use = "complete.obs")
## Select rows where temperature available
cor(PT.df[!is.na(PT.df$T),])
cor(PT.df[!is.na(PT.df$T), "P"], PT.df[!is.na(PT.df$T),"T"])
