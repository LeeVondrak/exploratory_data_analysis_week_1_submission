#read in data with proper separator and NA string
power_consumption <- read.csv(file = "household_power_consumption.txt", header = T, sep = ";", na.strings = "?",
                              stringsAsFactors = F, nrows = 2075259)

#conversion of Data and Time columns to the proper column class with their specific formats
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")

#subsetting specific Dates
power_consumption <- power_consumption[power_consumption$Date >= "2007-02-01" & power_consumption$Date <= "2007-02-02",]

#Creating the DateTime variable
power_consumption$DateTime <- as.POSIXct(paste(as.Date(power_consumption$Date), power_consumption$Time))

#opening a PNG device
png(filename = "plot3.png", width = 480, height = 480)

#creating times series graph for plot 3
plot(x = power_consumption$DateTime, y = power_consumption$Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab = "")
lines(x = power_consumption$DateTime, y = power_consumption$Sub_metering_2, col = "red")
lines(x = power_consumption$DateTime, y = power_consumption$Sub_metering_3, col = "blue")
legend(x = "topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

#closing the graphics device
dev.off()
