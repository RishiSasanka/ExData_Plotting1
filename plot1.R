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
png("plot1.png", width=480, height=480)
hist(num,main="Global Active Power", col="red", xlab="Global Active Power (Kilowatts)")
dev.off()