# Load Data
data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data_extract <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

data_extract$DateTime <- strptime(paste(data_extract$Date,data_extract$Time), "%d/%m/%Y %H:%M:%S")

# Image Device
png(filename="plot1.png", height=480, width=480, bg="transparent")

# Create Plot
hist(data_extract$Global_active_power,
        main="Global Active Power",
        xlab="Global Active Power (kilowatts)",
        ylab="Frequency",
        col="red")

# 
dev.off()