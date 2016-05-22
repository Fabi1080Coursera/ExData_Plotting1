household_power_data <- read.csv("../household_power_consumption.txt", sep = ";", na.strings = "?")

#Load library dplyr and install first if not present
if(!require("dplyr")){
  install.packages("dplyr")
}
library(dplyr)

#Load library lubridate and install first if not present
if(!require("lubridate")){
  install.packages("lubridate")
}
library(lubridate)

# Convert Date and Time Strings to POSIXct
household_power_data <- household_power_data %>%
  mutate(Date = parse_date_time(paste(Date, Time, sep = " "), "%d/%m/%Y %h:%m:%s"))

# Select rows between 2007-02-01 and 2007-02-02
household_power_data <- household_power_data %>% 
  filter(Date >= parse_date_time("2007-02-01", "%Y-%m-%d") & Date < parse_date_time("2007-02-03", "%Y-%m-%d"))

# Generate Plot
png(filename = "Plot1.png")
hist(household_power_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
