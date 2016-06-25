
## PLOT 4 ##
## File from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

HH_file <- "~/R/household_power_consumption.txt"
HH_data <- read.table(HH_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Only Feb 1, 2 2007
HH_Dates <- c("1/2/2007","2/2/2007")
HH_sub <- HH_data[HH_data$Date %in% HH_Dates ,]
globalActivePower <- as.numeric(HH_sub$Global_active_power)

## use strptime to combine date and time into single value.
datetime <- strptime(paste(HH_sub$Date, HH_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subMetering_1 <- as.numeric(HH_sub$Sub_metering_1)
subMetering_2 <- as.numeric(HH_sub$Sub_metering_2)
subMetering_3 <- as.numeric(HH_sub$Sub_metering_3)

globalActivePower <- as.numeric(HH_sub$Global_active_power)
globalActivePower <- as.numeric(HH_sub$Global_active_power)
globalReactivePower <- as.numeric(HH_sub$Global_reactive_power)
voltage <- as.numeric(HH_sub$Voltage)



png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering_2, type="l", col="red")
lines(datetime, subMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
