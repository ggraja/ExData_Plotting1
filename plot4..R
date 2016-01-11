
eda<-read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
head(eda)
View(eda)
dateeda<-eda[eda$Date %in% c("1/2/2007", "2/2/2007"),]
head(dateeda)
View(dateeda)


SetTime<-strptime(paste(dateeda$Date, dateeda$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
View(SetTime)

dateedasettime_merge<-cbind(dateeda,SetTime)
View(dateedasettime_merge)

electdata<-dateedasettime_merge
View(electdata)


#generating plot 4

png("plot4.png",width = 480,height=480)
labels<-c("sub_metering_1", "sub_metering_2", "sub_metering_3")
columnlines<-c("black", "red", "blue")
par(mfrow=c(2,2))
plot(electdata$SetTime, electdata$Global_active_power, type = "l", col="black", xlab=" ", ylab = "Global Active Power (kilowatts)")
plot(electdata$SetTime, electdata$Voltage, type = "l", col="black", xlab="datetime ", ylab = "Voltage")
plot(electdata$SetTime, electdata$Sub_metering_1, type = "l", col=columnlines[1], xlab=" ", ylab = "Energy sub metering")
lines(electdata$SetTime,electdata$Sub_metering_2, col=columnlines[2])
lines(electdata$SetTime,electdata$Sub_metering_3, col=columnlines[3])
legend("topright", bty="n", legend=labels, col=columnlines, lty="solid")
plot(electdata$SetTime, electdata$Global_reactive_power, type ="l", col="black", xlab="datetime ", ylab = "Global_reactive_power")
dev.off()



