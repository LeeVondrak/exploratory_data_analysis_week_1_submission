#read in data with proper separator and NA string
power_consumption <- read.csv(file = "household_power_consumption.txt", header = T, sep = ";", na.strings = "?",
                              stringsAsFactors = F, nrows = 2075259)

#conversion of Data and Time columns to the proper column class with their specific formats
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
power_consumption$Time <- strptime(power_consumption$Time, format = "%H:%M:%S")

#subsetting specific Dates
power_consumption <- power_consumption[power_consumption$Date >= "2007-02-01" & power_consumption$Date <= "2007-02-02",]

#opening a PNG device
png(filename = "plot1.png", width = 480, height = 480)

#creating histrogram for plot 1
hist(power_consumption$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col = "Red")

#closing the graphics device
dev.off()
