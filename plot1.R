data<-read.csv("household_power_consumption.txt",header = TRUE,sep = ";")
mydata<-data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
par(mar=c(4,4,2,1))
with(mydata,hist(as.numeric(paste(Global_active_power)),col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power"))