alldata <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)
mydata <- alldata[alldata$Date %in% c("1/2/2007", "2/2/2007"), ]

datetime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
class(mydata$Global_active_power) <- "numeric"
png("plot2.png")
plot(datetime, mydata$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

