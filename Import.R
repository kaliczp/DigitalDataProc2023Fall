## List of files in folder
dir()
## Import file and save into rawdata object
rawdata <- read.table("M_R_White Nile State.csv", sep = ","header = TRUE)
## Make a summary
summary(rawdata)
