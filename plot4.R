
##read the data from the file
data <- read.csv("household_power_consumption.txt",header = TRUE, sep=";",na.string="?")

##subset the data with dates 2007-02-01 and 2007-02-02
datasubset <- data[data$Date  == "1/2/2007"  | data$Date  == "2/2/2007", ]

## concatenating the date and time then convert into dd/mm/yyyy hh:mm:ss
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png(filename = "plot4.png", width = 480, height = 480)
##create the matrix nrows x ncols plots 
par(mfrow = c(2, 2)) 
##First plot
plot(datetime,datasubset$Global_active_power, type="l", xlab="", ylab="Global Active Power")

##second plot
plot(datetime,datasubset$Voltage,type="l", xlab = "datetime", ylab = "Volatage")

##third plot
plot(datetime,datasubset$Sub_metering_1,type = "l", xlab ="", ylab="Energy Submetering" )
lines(datetime, datasubset$Sub_metering_2, type="l", col="red")
lines(datetime,datasubset$Sub_metering_3, type = "l", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2.5, col=c("black","red","blue"))

##fourth plot
plot(datetime, datasubset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power" )

dev.off()
