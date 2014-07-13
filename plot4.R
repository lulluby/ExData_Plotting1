ds <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", 
               nrows = 2880, skip = 66636, colClasses = c("character", "character", 
                                                          "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
               col.names = c("Date", "Time", "GlobalActivePower", "GlobalReactivePower", 
                             "Voltage", "GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3"))

ds$Date <- strptime(paste(ds$Date, ds$Time), format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

with(ds, plot(Date, GlobalActivePower, type="l", xlab="", ylab="Global Active Power"))

with(ds, plot(Date, Voltage, type="l", xlab="datetime", ylab="Voltage"))

with(ds, {
    plot(Date, SubMetering1, type="l", xlab="", ylab="Energy sub metering")
    lines(Date, SubMetering2, type="l", col="red")
    lines(Date, SubMetering3, type="l", col="blue")
})

legend("topright", col=c("black", "blue", "red"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), xjust = 1, yjust = 1)

with(ds, plot(Date, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.copy(png, file="plot4.png", width = 480, height = 480, units = "px")

dev.off()
