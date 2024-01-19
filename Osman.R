library(readxl)
OsmanRaw <- as.data.frame(read_excel("ABUBKR DATA.xlsx", sheet = "Sheet4", n_max = 384))
## Filter erroneous data
which(is.na(as.numeric(OsmanRaw$CD_AR_SH)))
OsmanRaw[76, "CD_AR_SH"] <- "3.9"
OsmanRaw$CD_AR_SH <- as.numeric(OsmanRaw$CD_AR_SH)
