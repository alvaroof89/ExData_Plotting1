setwd("/home/alvaroof89/R/")

DT <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
DT$Date <- strptime(DT$Date, "%d/%m/%Y")
condition <- DT$Date == ("2007-02-01 CET") | DT$Date == ("2007-02-02 CET")
DT <- subset(DT, condition)
timestamp=format(as.POSIXct(paste(DT$Date, DT$Time)), "%d/%m/%Y %H:%M:%S")
timestamp <- as.POSIXct(timestamp, format = "%d/%m/%Y %H:%M:%S")
DT <- cbind(DT, timestamp)

png("plot2.png", width = 480, height = 480)
with(DT,plot(timestamp,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab=""))
dev.off()

