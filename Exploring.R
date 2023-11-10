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
plot(rowSums(rawdata[,-1]))
