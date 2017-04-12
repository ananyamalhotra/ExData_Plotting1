data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",colClasses = "character")
mydata<-data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
par(mar=c(4,4,2,1))
require(chron)

par(mfrow=c(2,2))
# Plot 1
x<-chron(dates=mydata$Date,times=mydata$Time,format = c(dates="d/m/y",times="h:m:s"))
y<-as.numeric(paste(mydata$Global_active_power))
plot(x,y,xaxt='n',type = 'l',ylab = "Global Active Power (kilowatts)",xlab="")
axis(side=1,at=c(x[1],x[1440],x[2880]),labels = c("Thu","Fri","Sat"),tick = TRUE)

# Plot 2
y11<-as.numeric(paste(mydata$Voltage))
plot(x,y11,xaxt='n',type = 'l',ylab = "Voltage",xlab="datetime")
axis(side=1,at=c(x[1],x[1440],x[2880]),labels = c("Thu","Fri","Sat"),tick = TRUE)

# Plot 3
y1<-as.numeric(paste(mydata$Sub_metering_1))
y2<-as.numeric(paste(mydata$Sub_metering_2))
y3<-as.numeric(paste(mydata$Sub_metering_3))
plot(x,y1,xaxt='n',type = 'l',col="black",ylab = "Energy sub metering",xlab="")
lines(x,y2,col="red")
lines(x,y3,col="blue")
axis(side=1,at=c(x[1],x[1440],x[2880]),labels = c("Thu","Fri","Sat"),tick = TRUE)
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

# Plot 4
y22<-as.numeric(paste(mydata$Global_reactive_power))
plot(x,y22,xaxt='n',type = 'l',ylab = "Global_reactive_power",xlab="datetime")
axis(side=1,at=c(x[1],x[1440],x[2880]),labels = c("Thu","Fri","Sat"),tick = TRUE)
