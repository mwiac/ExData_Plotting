
#Loading data from a txt file
#No direct download.file command as a zipped file was given

data<-read.table("household_power_consumption.txt",dec=".",sep=";",na.strings="?",header=T)

#Converting dates
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#Subsetting the two days that are to be analyzed & adding a "date-time" column
data1<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
data1$datetime <- as.POSIXct(paste(data1$Date, data1$Time))

#Creating chart
plot(data1$datetime,data1$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",lwd=1,type="l")

#Saving to png file
dev.copy(png,file="plot2.png")
dev.off()