library(readxl)
OsmanRaw <- as.data.frame(read_excel("ABUBKR DATA.xlsx", sheet = "Sheet4", n_max = 384))
## Filter erroneous data
which(is.na(as.numeric(OsmanRaw$CD_AR_SH)))
OsmanRaw[76, "CD_AR_SH"] <- "3.9"
OsmanRaw$CD_AR_SH <- as.numeric(OsmanRaw$CD_AR_SH)
which(is.na(as.numeric(OsmanRaw$D_AT_T)))
OsmanRaw[c(73, 350), "D_AT_T"]
OsmanRaw[73, "DOM"] <- OsmanRaw[73, "D_AT_T"]
OsmanRaw[73, "D_AT_T"] <- 0
OsmanRaw[350, "D_AT_T"] <- 0
OsmanRaw$D_AT_T <- as.numeric(OsmanRaw$D_AT_T)
