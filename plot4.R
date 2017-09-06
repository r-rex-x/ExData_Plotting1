alldata <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)
mydata <- alldata[alldata$Date %in% c("1/2/2007", "2/2/2007"), ]

datetime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
class(mydata$Global_active_power) <- "numeric"
class(mydata$Sub_metering_1) <- "numeric"
class(mydata$Sub_metering_2) <- "numeric"
class(mydata$Sub_metering_3) <- "numeric"
class(mydata$Voltage) <- "numeric"
class(mydata$Global_reactive_power) <- "numeric"

png("plot4.png")
par(mfcol = c(2,2))

plot(datetime, mydata$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(datetime, mydata$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(datetime, mydata$Sub_metering_2, col = "red")
lines(datetime, mydata$Sub_metering_3, col = "blue")
legend("topright", lty = 1, box.lwd = 0, bty = "n",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"))

plot(datetime, mydata$Voltage, type = "l", ylab = "Voltage")

plot(datetime, mydata$Global_reactive_power, type = "l", ylab = "Global_reactive_power")

dev.off()

