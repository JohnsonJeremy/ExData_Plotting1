Plot4=function(x=0){
     require(lubridate)  ##Load lubridate if necessary
     
     ## Load data
     hcons<-read.csv("data.txt", sep=";")
     hcons$Date<-dmy(hcons$Date)
     hcons$Time<-hms(hcons$Time)
     max_date<-ymd("2007-02-02")
     min_date<-ymd("2007-02-01")
     hcons<-subset(hcons, hcons$Date %in% min_date:max_date)
     hcons$datimes<-hcons$Date+hcons$Time
     hcons$Global_active_power<-as.numeric(as.character(hcons$Global_active_power))
     hcons$Sub_metering_3<-as.numeric(as.character(hcons$Sub_metering_3))
     hcons$Sub_metering_2<-as.numeric(as.character(hcons$Sub_metering_2))
     hcons$Sub_metering_1<-as.numeric(as.character(hcons$Sub_metering_1))
     hcons$Global_reactive_power<-as.numeric(as.character(hcons$Global_reactive_power))
     hcons$Voltage<-as.numeric(as.character(hcons$Voltage))
     
     ## Set output device to png if something other than 1 is passed to function
     if(x!=0) png(filename="plot4.png")
     
     ## Create plots
     par(mfrow=c(2,2))
     
     plot(hcons$datime, hcons$Global_active_power,  type="l", xlab="", 
          ylab="Global Active Power (kilowatts)")
     
     plot(hcons$datime, hcons$Voltage,  type="l", 
          ylab="Voltage", xlab="datetime")
     
     plot(hcons$datime, hcons$Sub_metering_1, type="n", xlab="", 
          ylab="Energy sub metering")
     points(hcons$datime, hcons$Sub_metering_1, type="l", col="black")
     points(hcons$datime, hcons$Sub_metering_2, type="l", col="red")
     points(hcons$datime, hcons$Sub_metering_3, type="l", col="blue")
     legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), 
            lty=c(1,1,1), col=c("black","red","blue"))
     
     plot(hcons$datime, hcons$Global_reactive_power,  type="l", 
          ylab="Global_reactive_power", xlab="datetime")
     
     ## Close device if PNG was created
     if(x!=0) dev.off()
}