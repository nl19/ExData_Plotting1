plot3 <- function() {
  
  data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
  data$Date = as.Date(data$Date,"%d/%m/%Y")
  
  DATE1 <- as.Date("2007-02-01")
  DATE2 <- as.Date("2007-02-02")
  data$Sub_metering_1 = as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 = as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3 = as.numeric(as.character(data$Sub_metering_3))
  ESM <- subset(data,Date >= DATE1 & Date <= DATE2, select=c(Sub_metering_1,Sub_metering_2,Sub_metering_3,Date,Time))
  x <- paste(ESM$Date,ESM$Time)
  x <- strptime(x,"%Y-%m-%d %H:%M:%S")
  
  png(file="plot3.png",width=480,height=480)
  plot(x,ESM$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
  points(x,ESM$Sub_metering_2,type="l",col="red")
  points(x,ESM$Sub_metering_3,type="l",col="blue")
  legend("topright", lty=c(1,1,1), col=c("black","blue","red"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
  
  
  
  
}