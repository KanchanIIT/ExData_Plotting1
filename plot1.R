F <- "./data/household_power_consumption.txt"
data <- read.table(F, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(Data)
GAP <- as.numeric(Data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()