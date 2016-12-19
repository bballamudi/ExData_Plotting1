power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = c("NA","?"),stringsAsFactors=FALSE)
dates <- as.Date(power$Date,"%d/%m/%Y")
power$Date <- dates
power1 <- subset(power,Date>="2007-02-01"&Date<="2007-02-02")
date_time <- within(power1,Date_time <- paste(Date,Time,sep = " "))
a <- strptime(date_time$Date_time, "%Y-%m-%d %H:%M:%S")
date_time$Date_time <- a

png("plot2.png",width = 480, height = 480)
with(date_time, plot(Date_time,Global_active_power,typ='l',col="black"))
dev.off()
