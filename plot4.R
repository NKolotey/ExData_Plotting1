## Loading dataset
data <- read.csv('./Data/household_power_consumption.txt', sep = ';', na.strings = '?')
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subsetting the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 4
png("plot4.png", height = 480, width = 480)
par(mfrow = c(2,2))

# 1
plot(data$Global_active_power ~ data$Datetime, type = "l",
     xlab = "", ylab = "Global Active Power")

# 2
plot(data$Datetime, data$Voltage, type="l",
     xlab = "datetime", ylab = "Voltage")

# 3
plot(data$Datetime, data$Sub_metering_1, type = "l", col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, box.lwd = 0)

# 4
plot(data$Datetime, data$Global_reactive_power, type="n",
     xlab = "datetime", ylab = "Global_reactive_power")
lines(data$Datetime, data$Global_reactive_power)

dev.off()