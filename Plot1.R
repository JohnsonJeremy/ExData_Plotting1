Plot1=function(x=0){
     require(lubridate)  ## Load lubridate if necessary
     ## Load the data
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
     if(x!=0) png(filename="plot1.png")
     
     ## Create plot
     hist(hcons$Global_active_power, col="red", main="Global Active Power",
          xlab="Global Active Power (killowats)", ylab="Frequency")
     
     ## Close device if PNG was created
     if(x!=0) dev.off()
}