plot1 <- function() {
  
  data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
  data$Date = as.Date(data$Date,"%d/%m/%Y")
  
  DATE1 <- as.Date("2007-02-01")
  DATE2 <- as.Date("2007-02-02")
  data$Global_active_power = as.numeric(as.character(data$Global_active_power))
  GAP <- subset(data,Date >= DATE1 & Date <= DATE2, select=Global_active_power)
  
  png(file="plot1.png",width=480,height=480)
  hist(GAP$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()

  
}