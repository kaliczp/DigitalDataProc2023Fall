## Yearly mean temp
rowMeans(rawdataT[,-1])

## Plot yearly mean temps
plot(x = rawdataT[,1], y = rowMeans(rawdataT[,-1]),
     type ="l", xaxs = "i", yaxs = "i",
     xlab = "Years", ylab = "Precipitation [mm]")
