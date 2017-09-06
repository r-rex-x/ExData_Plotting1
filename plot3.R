alldata <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)
mydata <- alldata[alldata$Date %in% c("1/2/2007", "2/2/2007"), ]

datetime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
class(mydata$Sub_metering_1) <- "numeric"
class(mydata$Sub_metering_2) <- "numeric"
class(mydata$Sub_metering_3) <- "numeric"
png("plot3.png")
plot(datetime, mydata$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(datetime, mydata$Sub_metering_2, col = "red")
lines(datetime, mydata$Sub_metering_3, col = "blue")
legend("topright", lty = 1,
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"))
dev.off()

