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
png(filename = "plot4.png", width = 480, height = 480)

#setting parameters for filling the 4 plots on 1 device and the margins to make the graphs a little taller
par(mfrow = c(2,2), mar= c(5.1, 4.1, 3, 2.1))
with(power_consumption,{
        #creating times series graph for plot 1
        plot(Global_active_power~DateTime,type = "l", ylab = "Global Active Power", xlab = "")
        
        #creating times series graph for plot 2
        plot(Voltage~DateTime,type = "l", ylab = "Voltage", xlab = "datetime")
        
        #creating times series graph for plot 3
        plot(Sub_metering_1~DateTime,type = "l", ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2~DateTime, col = "red")
        lines(Sub_metering_3~DateTime, col = "blue")
        legend(x = "topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, cex = .8, bty = "n")
        
        #creating times series graph for plot 4
        plot(Global_reactive_power~DateTime,type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})

#closing the graphics device
dev.off()
