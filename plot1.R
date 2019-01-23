##Reading the Data
pc <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?" )
pcsub <- subset(pc,pc$Date=="1/2/2007" | pc$Date =="2/2/2007")
pcsub$Date <- as.Date(pcsub$Date, format="%d/%m/%Y")

##Plot 1
hist(pcsub$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()