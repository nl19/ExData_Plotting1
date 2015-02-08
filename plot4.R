plot4 <- function() {
  
  data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
  data$Date = as.Date(data$Date,"%d/%m/%Y")
  
  DATE1 <- as.Date("2007-02-01")
  DATE2 <- as.Date("2007-02-02")
  
  data$Global_active_power = as.numeric(as.character(data$Global_active_power))
  data$Global_reactive_power = as.numeric(as.character(data$Global_reactive_power))
  data$Voltage = as.numeric(as.character(data$Voltage))
  data$Sub_metering_1 = as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 = as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3 = as.numeric(as.character(data$Sub_metering_3))
  
  ESM <- subset(data,Date >= DATE1 & Date <= DATE2, select=c(Sub_metering_1,Sub_metering_2,Sub_metering_3,Voltage,Global_active_power,Global_reactive_power,Date,Time))
  x <- paste(ESM$Date,ESM$Time)
  x <- strptime(x,"%Y-%m-%d %H:%M:%S")
  
  png(file="plot4.png",width=480,height=480)
  par(mfrow = c(2,2))
  plot(x,ESM$Global_active_power,type="l",xlab="",ylab="Global active power")
  plot(x,ESM$Voltage,type="l",xlab="datetime",ylab="Voltage")
  plot(x,ESM$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")
  points(x,ESM$Sub_metering_2,type="l",col="red")
  points(x,ESM$Sub_metering_3,type="l",col="blue")
  legend("topright", cex=0.75,lty=c(1,1,1),col=c("black","blue","red"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(x,ESM$Global_reactive_power,type="l",xlab="datetime",ylab="Global reactive power")
  dev.off()
  
}