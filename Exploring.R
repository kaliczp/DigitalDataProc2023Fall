## Yearly sums without Years
rowSums(rawdata[,-1])

### Indexing
## First row and firs column
rawdata[1,1]
## All Years
rawYears <- rawdata[,1]
## All data in first row
rawdata[1,]
### Vector indexing
## Only one element
rawYears[1]
## Range with :, seq() function and manual vector creaation
rawYears[1:10]
rawYears[seq(1,10,1)]
rawYears[c(1,2,3,4,5,6,7,8,9,10)]
## Exclude the first element
rawYears[-1]

## Plot
plot(rawdata)
## Default types
plot(rowSums(rawdata[,-1]), type ="p")
plot(rowSums(rawdata[,-1]), type ="l")
plot(rowSums(rawdata[,-1]), type ="h")

## Modify plot
max(rowSums(rawdata[,-1]));min(rowSums(rawdata[,-1]))
plot(rowSums(rawdata[,-1]), type ="h", ylim= c(0,435))
plot(rawYears, rowSums(rawdata[,-1]), type ="h", ylim= c(0,435))

## Make an advanced plot
plot(x = rawYears, y = rowSums(rawdata[,-1]),
     type ="h", xaxs = "i", yaxs = "i",
     xlab = "Years", ylab = "Precipitation [mm]",
     ylim= c(0,435))
