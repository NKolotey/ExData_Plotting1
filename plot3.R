## Loading dataset
data <- read.csv('./Data/household_power_consumption.txt', sep = ';', na.strings = '?')
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subsetting the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 3

png("plot3.png", height = 480, width = 480)

plot(data$Datetime, data$Sub_metering_1, type = "l", col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

dev.off()