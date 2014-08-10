## Loading dataset
data <- read.csv('./Data/household_power_consumption.txt', sep = ';', na.strings = '?')
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subsetting the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power ~ datetime, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()