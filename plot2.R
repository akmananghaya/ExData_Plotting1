##Reading the Data
pc <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?" )
pcsub <- subset(pc,pc$Date=="1/2/2007" | pc$Date =="2/2/2007")
pcsub$Date <- as.Date(pcsub$Date, format="%d/%m/%Y")

##Plot 2
day <- paste(as.Date(pcsub$Date), pcsub$Time)
pcsub$day <- as.POSIXct(day)
plot(pcsub$Global_active_power~pcsub$day, type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()