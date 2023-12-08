## List of files in folder
dir()
## Import file and save into rawdata object
rawdata <- read.csv("M_R_White Nile State.csv")
## Make a summary
summary(rawdata)

## New data
rawdataT <- read.csv("M_T_White Nile State.csv")
summary(rawdataT)
