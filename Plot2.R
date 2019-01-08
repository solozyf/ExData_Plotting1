

rm(list=ls())
txt<-read.table("household_power_consumption.txt",header = TRUE, sep = ";",dec=".")
txt$Date<-as.Date(txt$Date,"%d/%m/%Y")

newdt<-subset(txt,Date>="2007-02-01"& Date<="2007-02-02")
newdt$dateTime<-as.POSIXct(paste(newdt$Date,newdt$Time),format="%Y-%m-%d %H:%M:%S")
newdt$Global_active_power<-as.numeric(newdt$Global_active_power)

png("plot2.png",width=480,height=480,units='px')
plot(newdt$dateTime,newdt$Global_active_power/500,type='l',ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
