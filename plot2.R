ds <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", 
               nrows = 2880, skip = 66636, colClasses = c("character", "character", 
                                                          "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
               col.names = c("Date", "Time", "GlobalActivePower", "GlobalReactivePower", 
                             "Voltage", "GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3"))

ds$Date <- strptime(paste(ds$Date, ds$Time), format="%d/%m/%Y %H:%M:%S")

with(ds, plot(Date, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.copy(png, file="plot2.png", width = 480, height = 480, units = "px")
dev.off()


