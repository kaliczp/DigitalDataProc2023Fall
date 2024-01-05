library(readxl)
## After removing header
SheemaTSTemp <- as.data.frame(read_excel("Sheema_Study_Area.xlsx"))
SheemaTSPrec <- as.data.frame(read_excel("Sheema_Study_Area.xlsx",2))
SheemaTSDate <- seq.Date(as.Date("1990-01-15"), as.Date("2021-12-15"), by = "month")

library(xts)
SheemaTS <- xts(cbind(SheemaTSTemp[,3:4], PREC = SheemaTSPrec[,3]), SheemaTSDate)

plot(SheemaTS[,1:2])
plot(SheemaTS[,3], type = "h")
