F <- "./data/household_power_consumption.txt"
data <- read.table(F, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
D <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(D)
datetime <- strptime(paste(D$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(D$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GAP , type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()