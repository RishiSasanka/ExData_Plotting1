#Reading data and store the names setting columns names right
a<-read.table("household_power_consumption.txt",sep=";")
b<-a[1,]
a<-a[-1,]
b<-unlist(b)
names(a)<-b
#subsetting data
b<- a[a$Date %in% c("1/2/2007","2/2/2007") ,]
num<-as.numeric(as.character(b$"Global_active_power"))
#plotting data in png
datetime <- strptime(paste(b$Date, b$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
num<-as.numeric(as.character(b$"Global_active_power"))
SubMetering1<-as.numeric(as.character(b$"Sub_metering_1"))
SubMetering2<-as.numeric(as.character(b$"Sub_metering_2"))
SubMetering3<-as.numeric(as.character(b$"Sub_metering_3"))
png("plot3.png", width=480, height=480)
plot(datetime,SubMetering1,ylab="Energy Sub Metering",xlab="",type="n")
lines(datetime,SubMetering1)
lines(datetime,SubMetering2,col="red")
lines(datetime,SubMetering3,col="blue")
legend(x="topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
