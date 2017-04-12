data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",colClasses = "character")
mydata<-data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
par(mar=c(4,4,2,1))
require(chron)
x<-chron(dates=mydata$Date,times=mydata$Time,format = c(dates="d/m/y",times="h:m:s"))
y<-as.numeric(paste(mydata$Global_active_power))
plot(x,y,xaxt='n',type = 'l',ylab = "Global Active Power (kilowatts)",xlab="")
axis(side=1,at=c(x[1],x[1440],x[2880]),labels = c("Thu","Fri","Sat"),tick = TRUE)
