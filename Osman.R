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
which(is.na(as.numeric(OsmanRaw$H_AS_SH)))
OsmanRaw[50, "H_AS_SH"] <- 1.6
OsmanRaw$H_AS_SH <- as.numeric(OsmanRaw$H_AS_SH)
### Diameter vs. heights
names(OsmanRaw)[16:23]
names(OsmanRaw)[32:39]

DH <- data.frame(Diameter = as.vector(as.matrix(OsmanRaw[,16:23])),
                 Height = as.vector(as.matrix(OsmanRaw[,32:39])),
                 TreeSpec = rep(gsub("_T", "", gsub("_SH", "", gsub("D_", "", names(OsmanRaw)[16:23]))), each = nrow(OsmanRaw)),
                 RowNumber = rep(1:nrow(OsmanRaw), time = 8)
                 )
## Skip 0,0 pairs
DHonly <- DH[!(DH$Diameter == 0 & DH$Height == 0), ]

plot(Diameter ~ Height, DHonly)

## Check erroneous pairs
DHonly[DHonly$Diameter > 40,]
DHonly[DHonly$Diameter == 0,]
DHonly[DHonly$Height == 0,]

DHok <- DHonly[!(DHonly$Height == 0 | DHonly$Diameter == 0),]

plot(Diameter ~ Height, DHok)

## Check thre regression line
DH.lm <- lm(Diameter ~ Height, DHok)
abline(DH.lm)
summary(DH.lm)

plot(Height ~ Diameter, DHok)
DH.lm <- lm(Height ~ Diameter, DHok)
abline(DH.lm)

DH.lm <- lm(Height ~ Diameter, DHok[DHok$Height < 5 & DHok$Diameter < 20,])
abline(DH.lm, col = "red")


## Convert DOM variables to factor
