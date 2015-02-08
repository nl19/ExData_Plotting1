plot2 <- function() {
  
  data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
  data$Date = as.Date(data$Date,"%d/%m/%Y")
  
  DATE1 <- as.Date("2007-02-01")
  DATE2 <- as.Date("2007-02-02")
  data$Global_active_power = as.numeric(as.character(data$Global_active_power))
  GAP <- subset(data,Date >= DATE1 & Date <= DATE2, select=c(Global_active_power,Date,Time))
  x <- paste(GAP$Date,GAP$Time)
  x <- strptime(x,"%Y-%m-%d %H:%M:%S")
  
  png(file="plot2.png",width=480,height=480)
  plot(x,GAP$Global_active_power,type="l",xlab="",ylab="Global active power")
  dev.off()
  
  
  
}