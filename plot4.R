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

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
# 1
with(powerconsumption, plot(DateTime, Global_active_power, type="l", 
                            xlab="", ylab="Global Active Power"))

# 2
with(powerconsumption, plot(DateTime, Voltage, type="l", xlab="datetime"))

# 3
with(powerconsumption, {
    plot(DateTime, Sub_metering_1, type="l", xlab="", 
         ylab="Energy sub metering")
    lines(DateTime, Sub_metering_2, col="red")
    lines(DateTime, Sub_metering_3, col="blue")
})
legend("topright", bty="n", legend=names(powerconsumption)[7:9], 
       col=c("black", "red", "blue"), lwd=1)

#4
with(powerconsumption, plot(DateTime, Global_reactive_power, type="l", 
                            xlab="datetime"))
dev.off()
