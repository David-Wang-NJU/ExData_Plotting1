##reading data
data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE,stringsAsFactors = FALSE,na.strings = "?")
data<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

##making plot
DT <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP<-as.numeric(data$Global_active_power)
GRP<-as.numeric(data$Global_reactive_power)
Voltage<-as.numeric(data$Voltage)
sub1<-as.numeric(data$Sub_metering_1)
sub2<-as.numeric(data$Sub_metering_2)
sub3<-as.numeric(data$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(DT, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(DT, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(DT, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(DT, sub2, type="l", col="red")
lines(DT, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(DT, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
