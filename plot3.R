

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


#generating plot 3

names(electdata)
png("plot3.png",width = 480,height=480)
labels<-c("sub_metering_1", "sub_metering_2", "sub_metering_3")
columnlines<-c("black", "red", "blue")
plot(electdata$SetTime, electdata$Sub_metering_1, type = "l", col=columnlines[1], xlab=" ", ylab = "Energy sub metering")
lines(electdata$SetTime,electdata$Sub_metering_2, col=columnlines[2])
lines(electdata$SetTime,electdata$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
dev.off()


