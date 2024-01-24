## List of files in folder
dir()
## Import file and save into rawdata object
##kosti station (Rainfall and temperature)

setwd ("F:/PhD Courses/Digital Data collection and processing/Dataset/Climatic Data/C.D. White Nile")
list.files()
RdataK <- read.csv("Rainfall (Kosti).csv")
TdataK <- read.csv("Temperature(kosti).csv")
RdataAD <- read.csv("Rainfall (Al Douiem).csv")
TdataAD <- read.csv("Temperature (Al Douiem).csv")
## Rainfall analysis

library(tidyverse)
library(corrplot)
str(Rdata)
summary(Rdata)
library(ggplot2)
library(ggpubr)

library(ggplot2)




# Assuming your data is in a data frame named Rdata
ggplot(Rdata, aes(x = Precipitation)) +
  geom_histogram(binwidth = 10, fill = "red", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Precipitation", x = "Year", y = "Precipitation") +
  theme_minimal()

library(ggplot2)

# Assuming your data is in a data frame named Rdata with columns 'Year' and 'Precipitation'
library(ggplot2)

# Assuming your data is in a data frame named Rdata with columns 'Year' and 'Precipitation'
ggplot(Rdata, aes(x = Year, y = Precipitation)) +
  geom_line(color = "blue") +
  labs(title = "Time Series of Rainfall", x = "Year", y = "Rainfall") +
  theme_minimal()
scale_x_continuous(limits = c(1981, 2021), breaks = scales::breaks_width(3))+
  coord_cartesian (ylim = c(0, 450))

library(ggplot2)

library(ggplot2)

# Assuming your data is in a data frame named Tdata with columns 'Year' and 'Temperature'
ggplot(Tdata, aes(x = Year, y = Tdata$MAX)) +
  geom_line(color = "red") +
  labs(title = "Annual time series of temperature", x = "Year", y = "Max_Temperature (C)") +
  scale_x_continuous(limits = c(1981, 2021), breaks = scales::breaks_width(3)) +
 geom_smooth(method = "lm", se = FALSE) +
  theme_minimal()

maxmin.df = Tdata[,c('Year','MIN')]
names(maxmin.df) = c('Year','MAX')
maxmin.df$Value = 'Min'
tmax = Tdata[,c('Year','MAX')]
tmax$Value = 'Max'
maxmin.df = rbind(maxmin.df, tmax)
names(maxmin.df) = c('Year','Temperature', 'Value')

ggplot(maxmin.df, aes(x = Year, y = Temperature, color = Value)) +
 geom_line()


ggplot(Rdata$Precipitation) + geom_histogram()
ggplot(Rdata, aes(x = Year, y = Precipitation)) +geom_boxplot()+
  geom_point(color = "red", size = 1.5)  +scale_x_continuous(limits = c(1981, 2021), breaks = scales::breaks_width(3))+
   geom_smooth(method = "lm", se = FALSE, )+
  labs(title = "Annual Rainfall Variability 1981 - 2021", x = "Year", y = "Rainfall (mm)")

ggplot(Tdata, aes(x = Year, y = Temperature)) +
  geom_line() +
  labs(title = "Temperature Over Time", x = "Year", y = "Temperature (C)")


ggplot(Rdata, aes (Year, precipitation ))+geom_smooth()
ggplot(Rdata, aes (Year, precipitation))+geom_point()+geom_line()+
  geom_smooth(method = "lm", se = FALSE)+
  stat_cor(method = "pearson",lable.x =2004, lable.y = 150)+
  labs(x = "Year", y = "precipitation (mm)")+
  ylim(0, 450) +
  scale_x_continuous(expand = c(0, 0), oob = scales::squish)+
  
 scale_x_continuous(limits = c(1980, 2022), breaks = scales::breaks_width(3))
  


## Temperature Analysis


 
  


### correlation:

Rdata.Tdata <- data.frame(P = Rdata[["precipitation"]],
                    T = Tdata[['Temperature']])


plot(Rdata.Tdata)


## Eldoiem Station (Rainfall and temperature)

##plot time series climatic Data

