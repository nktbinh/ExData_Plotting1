# Preliminary Setting

packages <- c("readr", "lubridate", "dplyr")
sapply(packages, require, character.only=TRUE, quietly=TRUE)
setwd("~/Desktop/Coursera_Assignments/ExData_Plotting1")

# Read and process data

fulldata <- read_delim("household_power_consumption.txt",
                       delim = ";", col_names = TRUE, na = "?")

data <- fulldata %>% 
  filter(dmy(Date) == dmy(01022007)| dmy(Date) == dmy(02022007)) %>%
  mutate(date_time = dmy_hms(paste(Date,Time)))

# Plot 1

png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power, main = "Global Active Power", col = "red",
     xlab = "Global Active Power (kilowatts)")

dev.off()