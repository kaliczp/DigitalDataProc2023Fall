## List of files in folder
dir()
##kosti station (Rainfall and temperature)

setwd ("F:/PhD Courses/Digital Data collection and processing/Dataset/Climatic Data/C.D. White Nile")
list.files()

RdataK <- read.csv("Rainfall (kosti).csv")
TdataK <- read.csv("Temperature(kosti).csv")
RdataAD <- read.csv("Rainfall (Al Douiem).csv")
TdataAD <- read.csv("Temperature (Al Douiem).csv")
## plot time serise climate data

library(ggplot2)
library(reshape2)
library(readxl)
library(ggpubr)
library(tidyverse)


ggplot(Tdata, aes(Year,  Tdata$MAX)) + geom_line()+
scale_x_continuous(limits = c(1981, 2021), breaks = scales::breaks_width(3))+
labs( title = "Temperature Time Series 1981 - 2021", x = "Year", y = "MIN_temperature (C)")+

ggplot(Tdata, aes (Year, Tdata$MAX))+geom_line()
geom_smooth(method = "lm", se = FALSE)
ggplot(Tdata, aes (Year, MAX))+geom_point()+geom_line()+geom_smooth(method = "lm", se = FALSE)+


ggplot(Tdata, aes(Year, MAX)) +
  geom_point() +
  geom_line() +
  geom_smooth(method = "lm", se = FALSE) +

  labs( title = "Annual Temperature Time Series ", x = "Year", y = "temperature (C)") + 
 
   scale_x_continuous(limits = c(1981, 2021), breaks = scales::breaks_width(3))

scale_x_continuous(limits = c(1981, 2022))

Tdata<- temperature_ts <- ts(cbind(Tdata$MAX, Tdata$MIN), start = c(1981, 2021), frequency = 12)
plot(temperature_ts, main = "Temperature Time Series", ylab = "Temperature (units)", col = "red")

scale_x_continuous(limits = c(1981, 2021))
## Eldoiem Station (Rainfall and temperature)




Kosti_TSTEMP<- as.data.frame(read.csv("Temperature(kosti).csv"))
Kosti_TSPREC <- as.data.frame(read.csv("Rainfall (kosti).csv"))
White.NileTSDate <- seq.Date(as.Date("1981, 2021"), by = "year")





## tempearture Time serise
n_rows <- min(nrow(Kosti_TSTEMP[, 14:15]), nrow(Kosti_TSPREC[, 14]))

White.NileTS <- xts(cbind(Kosti_TSTEMP[1:n_rows, 14:15], PREC = Kosti_TSPREC[1:n_rows, 14]), White.NileTSDate[1:n_rows])

plot(White.NileTS[,1:2])
plot(White.NileTS[,3], type = "h")
### tested
Kosti_TSTEMP <- as.data.frame(read.csv("Temperature(kosti).csv"))
Kosti_TSPREC <- as.data.frame(read.csv("Rainfall (kosti).csv"))
White.NileTSDate <- seq.Date(as.Date("1981-01-01"), as.Date("2021-01-01"), by = "year")

# Temperature Time series
n_rows <- min(nrow(Kosti_TSTEMP[, 14:15]), nrow(Kosti_TSPREC[, 14]))

White.NileTS <- xts(cbind(Kosti_TSTEMP[1:n_rows, 14:15], PREC = Kosti_TSPREC[1:n_rows, 14]), White.NileTSDate[1:n_rows])
library(ggplot)
# Plotting
ggplot(White.NileTS[, 1:2], main = "Temperature Time Series", xlab = "Date", ylab = "Temperature")
ggplot(White.NileTS[, 3], type = "geom_line", main = "Precipitation Time Series", xlab = "Date", ylab = "Precipitation")

##corellation between Min and Max Temp
# Assuming 'data' is your dataset with columns 'Date', 'Min_Temperature', and 'Max_Temperature'
correlation_result <- cor(Tdata$MIN, Tdata$MAX)

# Print the correlation coefficient
print(correlation_result)
ggplot(correlation_result)

library(ggplot2)

# Assuming 'Tdata' is your data frame with columns 'MIN' and 'MAX'
ggplot(Tdata, aes(x = MIN, y = MAX, z = Year))+
  geom_point() + geom_line() + stat_cor(method = "pearson")+
  labs(title = "Scatter Plot of Min and Max Temperatures", x = "Min Temperature", y = "Max Temperature")

library(ggplot2)

# Assuming your data frame is named Rdata.Tdata with columns 'Min_Temperature' and 'Max_Temperature'
correlation_coefficient <- cor(Rdata.Tdata$Min_Temperature, Rdata.Tdata$Max_Temperature)

# Create a scatter plot
plot(Rdata.Tdata$Min_Temperature, Rdata.Tdata$Max_Temperature, 
     main = paste("Scatter Plot of Min and Max Temperatures\nCorrelation:", round(correlation_coefficient, 2)),
     xlab = "Min Temperature", ylab = "Max Temperature")

# Assuming 'Tdata' is your data frame with columns 'MIN', 'MAX', and 'Year'
ggplot(Tdata, aes(x = MIN, y = MAX, color = as.factor(Year))) +
  geom_point() +stat_cor(method = "pearson")+
  labs(title = "Scatter Plot of Min and Max Temperatures", x = "Min Temperature", y = "Max Temperature") 
  
   ##
  library(ggplot2)

# Assuming 'Tdata' is your data frame with columns 'MIN', 'MAX', and 'Year'
correlation_result <- cor(Tdata$MIN, Tdata$MAX)

# Create scatter plot
ggplot(Tdata, aes(x = MIN, y = MAX, color = as.factor(Year))) +
  geom_point() +
  labs(title = "Scatter Plot of Min and Max Temperature", x = "Min Temperature", y = "Max Temperature") +
  scale_color_discrete(name = "Year") +  # Optional: Customize legend title
  # Add correlation value
  annotate("text", x = min(Tdata$MIN), y = max(Tdata$MAX), 
           label = paste("Cor =", round(correlation_result, 3)),
           hjust = 1, vjust = 1, size = 4, color = "black")
#####correlations
library(xts)

library(zoo)

##correletion:
merged_data <- merge(rainfall_data, temperature_data, by = "Year")
correlation_coefficient <- cor(merged_data$Precipitation, merged_data$MAX)
ggplot(correlation_coefficient)
ggplot(merged_data, aes(x = merged_data$MAX, y = merged_data$Precipitation)) +
  geom_point() +
  labs(title = "Scatter Plot: Max Temp vs. Precipitation", x = "Max Temp", y = "Precipitation") +
  geom_smooth(method = "lm", se = FALSE) +
  geom_text(aes(label = paste("Correlation:", round(cor(Max_Temp, data$Precipitation), 2))),
            x = max(temperature_data$MAX), y = max(rainfall_data$Precipitation), 
            hjust = 1, vjust = 1, color = "red") +
  labs(title = "Scatter Plot: Max_Temp vs. Another_Variable", 
       x = "Max_Temp", y = "Another_Variable")
# Assuming merged_data is your actual merged data frame
correlation_coefficient <- cor(merged_data$MAX, merged_data$Precipitation)

# Assuming your_data is your actual data frame
ggplot(data = merge, aes(x = MAX, y = Precipitation)) +
  geom_point() +
  geom_text(aes(label = paste("Correlation:", round(cor(MAX, Precipitation), 2))),
            x = max(temperature_data$MAX), y = max(rainfall_data$Precipitation), 
            hjust = 1, vjust = 1, color = "red") +
  labs(title = "Scatter Plot: MAX vs. Precipitation", 
       x = "MAX", y = "Precipitation")



# Assuming your_data is your actual data frame
ggplot(merged_data, aes(x = Max_Temp, y = rainfall_data)) +
  geom_point()


# Assuming temperature_data and rainfall_data are vectors
your_data <- data.frame(temperature = temperature_data, rainfall = rainfall_data)
lm(temperature ~ rainfall, data = your_data)
# Assuming temperature_data and rainfall_data are vectors
your_data <- data.frame(temperature = temperature_data, rainfall = rainfall_data)

# Fit linear regression model
model <- lm(temperature_data$MIN ~ rainfall_data$Precipitation)

# Print model summary
summary(model)
plot(model)
lm(temperature_data$MAX ~ rainfall_data)
ggplot(temperature_data, aes(Year, MAX, temperature_data = MAX )) +
  geom_point() +
  scale_x_continuous(limits = c(1981, 2021), breaks = scales::breaks_width(3)) +
  
  labs(title = "Your Plot Title", x = "Year", y = "MAX Temperature")


# Convert data to time series
data<- rainfall_ts <- ts(rainfall_data$precipitation, start = c(1981, 1), frequency = 12)
data<- temperature_ts <- ts(cbind(temperature_data$MAX, temperature_data$MIN), start = c(1981, 15), frequency = 12)
###
correlation <- cor(rainfall_data$Precipitation, temperature_data$MAX)
print(correlation)
# Assuming your_data is a data frame with columns "rainfall" and "temperature"
plot(rainfall_data$Precipitation, temperature_data$MAX, main = "Scatter Plot: Rainfall vs. Temperature", 
     xlab = "Rainfall", ylab = "Temperature", col = "blue", pch = 16)
text(x = max(rainfall_data$Precipitation), y = max(temperature_data$MAX), 
     labels = sprintf("Correlation: %.2f", correlation), pos = 4, col = "red")



# Plot Time Series Data
par(mar = c(2, 2, 2, 2))   # Set up a 2x1 grid for plotting


# Assuming temperature_ts_xts is your xts time series object


# Plot MIN temperatures in blue
plot(temperature_ts_xts$MIN, col = "blue", main = "Temperature Time Series", ylab = "Temperature")

# Add MAX temperatures in red
lines(temperature_ts_xts$MAX, col = "red")

# If you have a separate data frame, you can add its MAX values like this:
# lines(temperature_data$MAX, col = "red")


# Plot rainfall time series
plot(rainfall_ts, main = "Rainfall Time Series", ylab = "Rainfall (units)", col = "blue")

# Plot temperature time series
plot(temperature_ts, main = "Temperature Time Series", ylab = "Temperature (units)", col = "blue")

library(xts)

library(zoo)

# Your ggplot code here

library(ggplot2)



# Set x-axis limits and breaks
scale_x_continuous(limits = c(1981, 2021), breaks = seq(1981, 2021, by = 3))


plot(temperature_ts_xts$MIN, main = "Temperature Time Series", ylab = "Temperature", col = "blue")
lines(temperature_ts_xts$MIN, col = "blue", temperature_data, xts$MAX, col = "red")

# Customize the y-axis label
legend("topright", legend = c("MIN", "MAX"), col = c("blue", "red"), lty = 1)

# Calculate and Plot Variability
# You can use the sd() function to calculate the standard deviation for variability
rainfall_variability <- sd(rainfall_ts)
temperature_variability <- sd(temperature_ts)

# Print variability values
cat("Rainfall Variability:", rainfall_variability, "\n")
cat("Temperature Variability:", temperature_variability, "\n")

# Calculate and Plot Correlation
correlation_coefficient <- cor(rainfall_ts, temperature_ts)

# Print correlation coefficient
cat("Correlation Coefficient:", correlation_coefficient, "\n")

# Plot Scatter Plot for Correlation
plot(rainfall_ts, temperature_ts, main = "Scatter Plot: Rainfall vs. Temperature",
     xlab = "Rainfall", ylab = "Temperature", col = "green")

# Fit a Linear Model (optional)
# ... (previous code)

# Fit a Linear Model
linear_model <- lm(temperature_ts ~ rainfall_ts)

# Display the linear model summary
summary(linear_model)

# Plot Scatter Plot for Correlation with Regression Line
plot(rainfall_ts, temperature_ts, main = "Scatter Plot: Rainfall vs. Temperature",
     xlab = "Rainfall", ylab = "Temperature", col = "green")

# Add Regression Line to Scatter Plot
abline(linear_model, col = "orange")

# ... (subsequent code)


# Assuming you have a data frame named 'data' with columns 'rainfall' and 'temperature'
library(ggplot2)

ggplot(rainfall_data, aes(x = rainfall, y = temperature)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  geom_text(aes(label = sprintf("Correlation: %.2f", cor(rainfall, temperature))),
            x = max(data$rainfall), y = max(data$temperature), hjust = 1, vjust = 1, color = "red") +
  labs(title = "Scatter Plot: Rainfall vs. Temperature", x = "Rainfall", y = "Temperature")


# Display the plots

# Customize the y-axis label
legend("topright", legend = c("MIN", "MAX"), col = c("blue", "red"), lty = 1)




