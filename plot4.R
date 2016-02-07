F <- "./data/household_power_consumption.txt"
data <- read.table(F, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
D <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(D)
datetime <- strptime(paste(D$Date, D$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(D$Global_active_power)
GRP <- as.numeric(D$Global_reactive_power)
voltage <- as.numeric(D$Voltage)
s1 <- as.numeric(D$Sub_metering_1)
s2 <- as.numeric(D$Sub_metering_2)
s3 <- as.numeric(D$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, s1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, s2, type="l", col="red")
lines(datetime, s3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()