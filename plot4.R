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

# Plot 4
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Subplot1
plot(data$date_time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Subplot2
plot(data$date_time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Subplot3
plot(data$date_time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$date_time, data$Sub_metering_2, col = "red")
lines(data$date_time, data$Sub_metering_3, col = "blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), bty="n", cex=.4)

# Subplot4
plot(data$date_time, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()