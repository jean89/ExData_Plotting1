library(lubridate)
library(lattice)
library(sqldf)
houseFile <- read.csv.sql("household_power_consumption.txt", sql = 'select * from file where Date ="1/2/2007" or Date = "2/2/2007"', sep= ";")
houseFile$date_time <- dmy_hms(paste(houseFile$Date,houseFile$Time ))
par(mfrow= c(2,2),bg = NA)
##panel 1 
plot(houseFile$date_time,houseFile$Global_active_power,type = "l", xlab = "",ylab = "Global active power")
##panel 2
plot(houseFile$date_time,houseFile$Voltage, xlab = "datetime",ylab = "Voltage",type = "l")
##panel 3 
plot(houseFile$date_time,houseFile$Sub_metering_1, xlab = "",ylab = "Energy sub metering", type = "n")
lines(houseFile$date_time,houseFile$Sub_metering_1,col = "black",lty=1)
lines(houseFile$date_time,houseFile$Sub_metering_2,col = "red",lty=1)
lines(houseFile$date_time,houseFile$Sub_metering_3,col = "blue",lty=1)
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty=1, cex = 0.7, bty = "n")
##panel 4
plot(houseFile$date_time,houseFile$Global_reactive_power, xlab = "datetime",ylab = "Global_reactive_power",type = "l")
dev.copy(png, file ="plot4.png",width = 480, height = 480)
dev.off()
