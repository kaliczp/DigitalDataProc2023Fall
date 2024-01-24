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

## Estimate missing data
AlDouiemOK <- TempKandAD.df$AlDouiem
AlDouiemOK[is.na(AlDouiemOK)] <- predict(TempKAD.lm, TempKandAD.df[is.na(TempKandAD.df$AlDouiem),])
TempADfull.xts <- xts(AlDouiemOK, TempDate)
plot(TempADfull.xts)

pdf("PredictedTemp.pdf", width = 28)
plot.zoo(TempADfull.xts, lwd = 3, col = "lightgray", xaxs = "i",
         ylab = expression("Temperature ["*~degree*C*"]"))
grid(nx = NA, ny = NULL)
lines(as.zoo(TempAD.xts))
lines(as.zoo(TempK.xts), col = 2)
legend("bottomright", legend = c("Kosti", "Al Douiem", "Predicted A. D."), col = c(2, 1, "lightgray"), lwd = c(1, 1, 2))
dev.off()
