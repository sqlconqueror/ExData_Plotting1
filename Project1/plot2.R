# Load Data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data_extract <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

data_extract$DateTime <- strptime(paste(data_extract$Date,data_extract$Time), "%d/%m/%Y %H:%M:%S")

# Image Device
png(filename="plot2.png", height=480, width=480, bg="transparent")

# Create Plot
plot(data_extract$DateTime,
     data_extract$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# 
dev.off()