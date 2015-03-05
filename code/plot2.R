data <- read.table("household_power_consumption.txt",sep=";",header=T)
data[,1]  <- as.Date(data[,1], "%d/%m/%Y")
data1 <- data[which(data[,1]=="2007-02-01"),]
data2 <- data[which(data[,1]=="2007-02-02"),]
newdata <- rbind(data1,data2)
weekday <- paste(newdata$Date,newdata$Time)
weekday <- as.POSIXct(weekday) 
newdata$Global_active_power <- as.numeric(newdata$Global_active_power)
png(file="plot2.png", bg="transparent")
plot(weekday,newdata$Global_active_power/1000,yaxt="n",ylab="Global Active Power(kilowatts)",xlab="",type="l")
y<-seq(0,6,2)
axis(2,labels=y,at=0:3,las=3)
dev.off()
