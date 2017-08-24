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
png("plot2.png", width=480, height=480)
plot(datetime,num,ylab="Global Active Power (Kilowatts)",xlab="",type="n")
lines(datetime,num)
dev.off()
