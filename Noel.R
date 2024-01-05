install.packages("readxl")
library(readxl)
Sheema <- as.data.frame(read_excel("HH_Summary_Database_Sheema.xlsx"))
summary(Sheema)
plot(Sheema[,1:10])

## Categorical variable
Sheema$training <- factor(Sheema$training, levels = 0:1, labels = c("No", "Yes"))
