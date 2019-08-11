##reading data
data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE,stringsAsFactors = FALSE,na.strings = "?")
data<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")

##making plot
png("plot1.png", width=480, height=480)
hist(as.numeric(data$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()