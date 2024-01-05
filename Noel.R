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

## Exclude the probably wrong data
plot(coffee_area ~ farm_size , Sheema[Sheema$farm_size > Sheema$coffee_area, ])
coffe.lm <- lm(coffee_area ~ farm_size, Sheema[Sheema$farm_size > Sheema$coffee_area, ])
abline(coffe.lm)
## Without intercept
coffe.lm <- lm(coffee_area ~ farm_size -1 , Sheema[Sheema$farm_size > Sheema$coffee_area, ])
identify(Sheema[,c("farm_size", "coffee_area")])

## Select farms less than 25 ha
SheemaOK <- Sheema[Sheema$farm_size < 25,]
SheemaOK <- SheemaOK[SheemaOK$farm_size > SheemaOK$coffee_area,]
plot(coffee_area ~ farm_size , SheemaOK)
abline(0,1)
coffe.lm <- lm(coffee_area ~ farm_size -1 , SheemaOK)
abline(coffe.lm)

