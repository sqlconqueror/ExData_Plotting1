# Load Data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data_extract <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

data_extract$DateTime <- strptime(paste(data_extract$Date,data_extract$Time), "%d/%m/%Y %H:%M:%S")


# Image Device
png(filename="plot4.png", height=480, width=480, bg="transparent")

par(mfrow=c(2,2))

# Create Plot
plot(data_extract$DateTime,
     data_extract$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

plot(data_extract$DateTime,
     data_extract$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")

plot(data_extract$DateTime,
     data_extract$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

lines(data_extract$DateTime, data_extract$Sub_metering_2, col="red")
lines(data_extract$DateTime, data_extract$Sub_metering_3, col="blue")

legend("topright", lty = 1, col = c("black", "red", "blue")
       ,box.col = "transparent"
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

plot(data_extract$DateTime,
     data_extract$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime")

# 
dev.off()