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

png("plot2.png", width=480, height=480)
with(powerconsumption, plot(DateTime, Global_active_power, type="l", 
                            xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
