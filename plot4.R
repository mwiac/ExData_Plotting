
#Loading data from a txt file
#No direct download.file command as a zipped file was given

data<-read.table("household_power_consumption.txt",dec=".",sep=";",na.strings="?",header=T)

#Converting dates
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#Subsetting the two days that are to be analyzed & adding a "date-time" column
data1<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
data1$datetime <- as.POSIXct(paste(data1$Date, data1$Time))

#Setting display of charts
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

#Creating chart 1
plot(data1$datetime,data1$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",lwd=1,type="l")

#chart2
plot(data1$datetime,data1$Voltage,ylab="Voltage",xlab="datetime",lwd=1,type="l")

#chart3
plot(data1$datetime,data1$Sub_metering_1,ylab="Energy sub metering",xlab="",lwd=1,type="l")
lines(data1$datetime,data1$Sub_metering_2,col="red")
lines(data1$datetime,data1$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c("black", "red", "blue"))

#chart 4
plot(data1$datetime,data1$Global_reactive_power,ylab="Global_rective_power",xlab="datetime",lwd=1,type="l")


#Saving to png file
dev.copy(png,file="plot4.png")
dev.off()