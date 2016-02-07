F <- "./data/household_power_consumption.txt"
data <- read.table(F, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
D <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(D)
datetime <- strptime(paste(D$Date, D$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(D$Global_active_power)
s1 <- as.numeric(D$Sub_metering_1)
s2 <- as.numeric(D$Sub_metering_2)
s3 <- as.numeric(D$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, s1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, s2, type="l", col="red")
lines(datetime, s3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()