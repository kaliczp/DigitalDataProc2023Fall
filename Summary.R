## List of files in folder
dir()
## Import file and save into rawdata object
##kosti station (Rainfall and temperature)

setwd ("F:/PhD Courses/Digital Data collection and processing/Dataset/Climatic Data/C.D. White Nile")
list.files()

# Load required libraries
install.packages("hydroTSM")
library(ggplot2)

library(stats)

# Read the CSV files
rainfall_data <- read.csv("Rainfall (Kosti).csv")
temperature_data <- read.csv("Temperature(kosti).csv")
rainfall_data <- read.csv("Rainfall (Al Douiem).csv")
temperature_data1 <- read.csv("Temperature (Al Douiem).csv")
## summary statistics of time serise (rainfall and temperature)
############### ***************Temperature
summary (temperature_data1)

class(temperature_data1)
iqr_result <- IQR(as.numeric(unlist(temperature_data1$MAX)), na.rm = TRUE)

print(iqr_result)

IQR(as.numeric(temperature_data1$MAX), na.rm = TRUE)
IQR(as.numeric(unlist(temperature_data1$MAX)))

## other statistical Measurement, calculated after remove the missing value (na.omit)

class(temperature_data1)
sd(as.numeric(temperature_data1$MAX), na.rm = TRUE)

## 
numeric_data <- as.numeric(temperature_data1$MAX)

cv <- (sd(numeric_data) / mean(numeric_data)) * 100


print(cv)

# calculate the coefficient of variation after avoid missing value
numeric_data <- as.numeric(temperature_data1$MAX)


missing_values <- sum(is.na(numeric_data))

if (missing_values > 0) {

  numeric_data <- na.omit(numeric_data)
  cv <- (sd(numeric_data) / mean(numeric_data)) * 100
  print(cv)
} else {
  cv <- (sd(numeric_data) / mean(numeric_data)) * 100
  print(cv)
}


# calculate skewness after avoid missing value
numeric_data <- as.numeric(temperature_data1$MAX)


missing_values <- sum(is.na(numeric_data))

if (missing_values > 0) {
  
  numeric_data <- na.omit(numeric_data)
  skew <- skewness(numeric_data)
  print(skew)
} else {

  skew <- skewness(numeric_data)
  print(skew)
}



# calculate kurtosis after avoid missing value
numeric_data <- as.numeric(temperature_data1$MAX)

missing_values <- sum(is.na(numeric_data))

if (missing_values > 0) {
 
  numeric_data <- na.omit(numeric_data)
  kurt <- kurtosis(numeric_data)
  print(kurt)
} else {
  
  kurt <- kurtosis(numeric_data)
  print(kurt)
}





###############*************** Rainfall

summary (rainfall_data)
class(rainfall_data)
IQR(as.numeric(rainfall_data$Precipitation), na.rm = TRUE)




class(rainfall_data)
sd(as.numeric(rainfall_data$Precipitation), na.rm = TRUE)

numeric_data <- as.numeric(rainfall_data$Precipitation)
cv <- (sd(numeric_data) / mean(numeric_data)) * 100
print(cv)

numeric_data <- as.numeric(rainfall_data$Precipitation)
library(e1071)
skew <- skewness(numeric_data)
print(skew)

numeric_data <- as.numeric(rainfall_data$Precipitation)
kurt <- kurtosis(numeric_data)
print(kurt)
################################



