power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = c("NA","?"),stringsAsFactors=FALSE)
dates <- as.Date(power$Date,"%d/%m/%Y")
power$Date <- dates
power1 <- subset(power,Date>="2007-02-01"&Date<="2007-02-02")
date_time <- within(power1,Date_time <- paste(Date,Time,sep = " "))
a <- strptime(date_time$Date_time, "%Y-%m-%d %H:%M:%S")
date_time$Date_time <- a

png("plot4.png",width = 480, height = 480)
par(mfcol=c(2,2))
par("mar"=c(4,4,2,2))

with(date_time, plot(Date_time,Global_active_power,typ='l',col="black"))

with(date_time, plot(Date_time,Sub_metering_1,typ='l',col="black",ylab = "Energy sub metering"))
lines(date_time$Date_time,date_time$Sub_metering_2,col="red")
lines(date_time$Date_time,date_time$Sub_metering_3,col="blue")
legend("topright",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),cex=0.75)

with(date_time,plot(Date_time,Voltage,typ='l'))

with(date_time,plot(Date_time,Global_reactive_power,typ='l'))
dev.off()