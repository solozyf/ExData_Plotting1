rm(list=ls())
txt<-read.table("household_power_consumption.txt",header = TRUE, sep = ";",dec=".")
txt$Date<-as.Date(txt$Date,"%d/%m/%Y")

newdt<-subset(txt,Date>="2007-02-01"& Date<="2007-02-02")
newdt$dateTime<-as.POSIXct(paste(newdt$Date,newdt$Time),format="%Y-%m-%d %H:%M:%S")
newdt$Global_active_power<-as.numeric(newdt$Global_active_power)


png("plot4.png",width=480,height=480,units='px')
par(mfrow=c(2,2),mar=c(4,4,2,1))
plot(newdt$dateTime,newdt$Global_active_power/500,type='l',ylab="Global Active Power",xlab="")
plot(newdt$dateTime,as.numeric(newdt$Voltage)/4.5,type='l',ylab="Voltage",xlab='datetime')
plot(newdt$dateTime,newdt$Sub_metering_1,type='l',ylab="Energy sub metering",xlab="")
lines(newdt$dateTime,newdt$Sub_metering_2,col="red")
lines(newdt$dateTime,newdt$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(1,1))
plot(newdt$dateTime,as.numeric(newdt$Global_reactive_power)/400,type='l',xlab='datetime',ylab='Global_reactive_power')
dev.off()
