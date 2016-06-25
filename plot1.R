


## PLOT 1 ###
## File from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

HH_file <- "~/R/household_power_consumption.txt"
HH_data <- read.table(HH_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Only Feb 1, 2 2007
HH_Dates <- c("1/2/2007","2/2/2007")
HH_sub <- HH_data[HH_data$Date %in% HH_Dates ,]
globalActivePower <- as.numeric(HH_sub$Global_active_power)

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
png("plot1.png", width=480, height=480)

