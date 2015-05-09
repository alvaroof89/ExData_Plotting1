setwd("/home/alvaroof89/R/")

DT <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
DT$Date <- strptime(DT$Date, "%d/%m/%Y")
condition <- DT$Date == ("2007-02-01 CET") | DT$Date == ("2007-02-02 CET")
DT <- subset(DT, condition)

png("plot1.png", width = 480, height = 480)
with(DT,hist(Global_active_power, col = "red", breaks = 11, xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()