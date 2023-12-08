### Correlate data sets
## Make a data.frame
PT.df <- data.frame(P = coredata(MonthlyPrec.xts['1981/2021']),
                    T = coredata(MonthlyTemp.xts)
                    )
## Plot your data
plot(PT.df)
## Same as above with formula
plot(T ~ P,data = PT.df)
## Change aexes
plot(P ~ T,data = PT.df)
## Select rows where temperature available
