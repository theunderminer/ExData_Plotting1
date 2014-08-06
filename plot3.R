# Read data
powerconsumption <- read.csv("household_power_consumption.txt", sep=";", 
                             na.strings="?", colClasses=
                                 c("character", "character", "numeric", 
                                   "numeric", "numeric", "numeric", 
                                   "numeric", "numeric", "numeric"))
# Create DateTime column
powerconsumption$DateTime <- strptime(paste(powerconsumption$Date, 
                                            powerconsumption$Time), 
                                      "%d/%m/%Y %T")
# Filter only 1/2/2007 and 2/2/2007
powerconsumption <- powerconsumption[powerconsumption$Date == "1/2/2007" | 
                                     powerconsumption$Date == "2/2/2007",]

png("plot3.png", width=480, height=480)
with(powerconsumption, {
    plot(DateTime, Sub_metering_1, type="l", xlab="", 
         ylab="Energy sub metering")
    lines(DateTime, Sub_metering_2, col="red")
    lines(DateTime, Sub_metering_3, col="blue")
})
legend("topright", legend=names(powerconsumption)[7:9], 
       col=c("black", "red", "blue"), lwd=1)
dev.off()
