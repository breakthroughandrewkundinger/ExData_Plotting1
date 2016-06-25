

## PLOT 2 ###
## File from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

HH_file <- "~/R/household_power_consumption.txt"
HH_data <- read.table(HH_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Only Feb 1, 2 2007
HH_Dates <- c("1/2/2007","2/2/2007")
HH_sub <- HH_data[HH_data$Date %in% HH_Dates ,]
globalActivePower <- as.numeric(HH_sub$Global_active_power)

## use strptime to combinate date and time into single value.
datetime <- strptime(paste(HH_sub$Date, HH_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(HH_sub$Global_active_power)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
png("plot2.png", width=480, height=480)
dev.off()