houseEnergy1<- read.table("household_power_consumption.txt", header=TRUE,sep=";",colClasses="character")

energy_sub1 <- houseEnergy1[which(houseEnergy1$Date=="1/2/2007"),]
energy_sub2 <- houseEnergy1[which(houseEnergy1$Date=="2/2/2007"),]
energy <- rbind(energy_sub1,energy_sub2)
energy$Global_active_power <- as.numeric(energy$Global_active_power)

par(bg="white")
hist(energy$Global_active_power, col = "red", border = NULL,main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

dev.copy(png,'plot1.png')
dev.off()
