install.packages("readxl")
library(readxl)
Sheema <- as.data.frame(read_excel("HH_Summary_Database_Sheema.xlsx"))
summary(Sheema)
plot(Sheema[,1:10])

## Categorical variable
Sheema$training <- factor(Sheema$training, levels = 0:1, labels = c("No", "Yes"))

## Correlation
cor(Sheema$experience,Sheema$age)
cor(Sheema$farm_size,Sheema$forest_area)
plot(Sheema$farm_size,Sheema$forest_area)
Sheema$farm_size > Sheema$forest_area
plot(Sheema$farm_size,Sheema$coffee_area)
abline(0, 1)
Sheema$farm_size > Sheema$coffee_area
Sheema[Sheema$farm_size < Sheema$coffee_area, c("farm_size", "coffee_area")]
