##Reading the Data
pc <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?" )
pcsub <- subset(pc,pc$Date=="1/2/2007" | pc$Date =="2/2/2007")
pcsub$Date <- as.Date(pcsub$Date, format="%d/%m/%Y")

##Plot 4
day <- paste(as.Date(pcsub$Date), pcsub$Time)
pcsub$day <- as.POSIXct(day)

par(mfrow=c(2,2))
#first plot
plot(pcsub$Global_active_power~pcsub$day, type="l",ylab="Global Active Power",xlab="")
#second plot
plot(pcsub$Voltage~pcsub$day, type="l",ylab="Voltage",xlab="datetime")
#third plot
plot(pcsub$day,type="l",pcsub$Sub_metering_1, ylab="Energy sub metering",xlab="")
lines(pcsub$day, pcsub$Sub_metering_2,col="red")
lines(pcsub$day, pcsub$Sub_metering_3,col="blue")
legend("topright",lty=1, lwd=1,col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#fourth plot
plot(pcsub$Global_reactive_power~pcsub$day, type="l",ylab="Global_reactive_power",xlab="datetime")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
