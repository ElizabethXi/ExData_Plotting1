houseEnergy1<- read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses="character")

energy_sub1 <- houseEnergy1[which(houseEnergy1$Date=="1/2/2007"),]
energy_sub2 <- houseEnergy1[which(houseEnergy1$Date=="2/2/2007"),]
energy <- rbind(energy_sub1,energy_sub2)

##energy$Date <- as.Date(energy$Date)

energy$Global_active_power <- as.numeric(energy$Global_active_power)

par(bg="white")

plot(energy$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)",xaxt="n")
max = length(energy$Global_active_power)
axis(1, at=c(0,max/2.0,max), lab=c("Thu","Fri","Sat"))

dev.copy(png,"plot2.png")
dev.off()
