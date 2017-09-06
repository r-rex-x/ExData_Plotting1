alldata <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)
mydata <- alldata[alldata$Date %in% c("1/2/2007", "2/2/2007"), ]

class(mydata$Global_active_power) <- "numeric"
png("plot1.png")
hist(mydata$Global_active_power, 
     col = "red",
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency",
     main = "Global Active Power")
dev.off()

