
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


# generating Plot 1

png("plot1.png",width =480, height=480)
hist(electdata$Global_active_power,col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
