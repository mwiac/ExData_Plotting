
#Loading data from a txt file
#No direct download.file command as a zipped file was given

data<-read.table("household_power_consumption.txt",dec=".",sep=";",na.strings="?",header=T)

#Converting dates
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#Subsetting the two days that are to be analyzed
data1<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

#Creating chart
hist(data1$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")

#Saving to png file
dev.copy(png,file="plot1.png")
dev.off()