##reading data
data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE,stringsAsFactors = FALSE,na.strings = "?")
data<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

##making plot
DT <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(data$Global_active_power)

png("plot2.png", width=480, height=480)
plot(DT, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()