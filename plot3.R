setwd("/home/alvaroof89/R/")

DT <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
DT$Date <- strptime(DT$Date, "%d/%m/%Y")
condition <- DT$Date == ("2007-02-01 CET") | DT$Date == ("2007-02-02 CET")
DT <- subset(DT, condition)
timestamp=format(as.POSIXct(paste(DT$Date, DT$Time)), "%d/%m/%Y %H:%M:%S")
timestamp <- as.POSIXct(timestamp, format = "%d/%m/%Y %H:%M:%S")
DT <- cbind(DT, timestamp)

png("plot3.png", width = 480, height = 480)
with(DT,plot(timestamp,Sub_metering_1, ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3)), type = "l", ylab = "Enery sub metering", xlab="", col = "black"))
par(new=TRUE)
with(DT,plot(timestamp,Sub_metering_2, ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3)), type = "l", ylab = "Enery sub metering", xlab="", col = "red", axes = FALSE))
par(new=TRUE)
with(DT,plot(timestamp,Sub_metering_3, ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3)), type = "l", ylab = "Enery sub metering", xlab="", col = "blue", axes = FALSE))
legend( x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, lty=c(1))
dev.off()
