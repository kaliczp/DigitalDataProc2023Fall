library(readxl)
OsmanRaw <- as.data.frame(read_excel("ABUBKR DATA.xlsx", sheet = "Sheet4", n_max = 384))
