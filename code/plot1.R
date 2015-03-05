data <- read.table("household_power_consumption.txt",sep=";",header=T)
data[,1]  <- as.Date(data[,1], "%d/%m/%Y")
data1 <- data[which(data[,1]=="2007-02-01"),]
data2 <- data[which(data[,1]=="2007-02-02"),]
newdata <- rbind(data1,data2)
newdata$Global_active_power <- as.numeric(newdata$Global_active_power)
png(file="plot1.png", bg="transparent")
hist(newdata$Global_active_power/1000,plot=TRUE,xaxt="n",main=("Global Active Power"),xlab="Global Active Power(kilowatts)",col="red")
x<-seq(0,6,2)
axis(1,labels=x,at=0:3,las=1)
dev.off()
