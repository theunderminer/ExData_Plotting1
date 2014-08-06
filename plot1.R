# Download and unzip the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip", method="curl")
unzip("household_power_consumption.zip")

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

# Plot the histogram
png("plot1.png", width=480, height=480)
hist(powerconsumption$Global_active_power, main="Global Active Power", 
     col="red", xlab="Global Active Power (kilowatts)")
dev.off()
