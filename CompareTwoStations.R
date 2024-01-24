## Make monthly data into one column
library(xts)
TempDate <- seq.Date(as.Date("1981-01-15"), as.Date("2021-12-15"), by = "month")
TempK.xts <- xts(as.vector(t(as.matrix(TdataK[,-c(1,13,14)]))), TempDate)
TempAD.xts <- xts(as.vector(t(as.matrix(TdataAD[,-c(1,13,14)]))), TempDate)
plot(coredata(TempK.xts),coredata(TempAD.xts))

## Correlation
TempKandAD.df <- data.frame(Kosti = coredata(TempK.xts),AlDouiem = coredata(TempAD.xts))
cor(TempKandAD.df[!is.na(TempKandAD.df$AlDouiem),])

## Linear Model
plot(AlDouiem ~ Kosti, TempKandAD.df)
TempKAD.lm <- lm(AlDouiem ~ Kosti, TempKandAD.df)
abline(TempKAD.lm)
