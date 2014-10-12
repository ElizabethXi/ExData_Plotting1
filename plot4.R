houseEnergy1<- read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses="character")

energy_sub1 <- houseEnergy1[which(houseEnergy1$Date=="1/2/2007"),]
energy_sub2 <- houseEnergy1[which(houseEnergy1$Date=="2/2/2007"),]
energy <- rbind(energy_sub1,energy_sub2)

##energy$Date <- as.Date(energy$Date)

energy$Global_active_power <- as.numeric(energy$Global_active_power)

energy$Sub_metering_1 <- as.numeric(energy$Sub_metering_1)
energy$Sub_metering_2 <- as.numeric(energy$Sub_metering_2)
energy$Sub_metering_3 <- as.numeric(energy$Sub_metering_3)

energy$Voltage <- as.numeric(energy$Voltage)

energy$Global_reactive_power <- as.numeric(energy$Global_reactive_power)


par(bg="white")
par(mfcol=c(2,2))

plot(energy$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power",xaxt="n")
max = length(energy$Global_active_power)
axis(1, at=c(0,max/2.0,max), lab=c("Thu","Fri","Sat"))

plot(energy$Sub_metering_1,type = "l",xlab="",ylab = "Energy sub metering",xaxt="n",ylim=range(energy$Sub_metering_1))
par(new=TRUE)
plot(energy$Sub_metering_2,type = "l",col="red",xlab="",ylab="",axes=FALSE,ylim=range(energy$Sub_metering_1))
par(new=TRUE)
plot(energy$Sub_metering_3,type = "l",col="blue",xlab="",ylab="",axes=FALSE,ylim=range(energy$Sub_metering_1))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=2,bty="n")
max = length(energy$Global_active_power)
axis(1, at=c(0,max/2.0,max), lab=c("Thu","Fri","Sat"))
par(new=FALSE)

plot(energy$Voltage,type = "l",xlab = "datetime",ylab = "Voltage",xaxt="n")
max = length(energy$Global_active_power)
axis(1, at=c(0,max/2.0,max), lab=c("Thu","Fri","Sat"))

plot(energy$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power",xaxt="n")
max = length(energy$Global_active_power)
axis(1, at=c(0,max/2.0,max), lab=c("Thu","Fri","Sat"))


dev.copy(png,"plot4.png")
dev.off()
