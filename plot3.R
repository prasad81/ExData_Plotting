##read the data from the file
data <- read.csv("household_power_consumption.txt",header = TRUE, sep=";",na.string="?")
summary(data)

##subset the data with dates 2007-02-01 and 2007-02-02
datasubset <- data[data$Date  == "1/2/2007"  | data$Date  == "2/2/2007", ]

## concatenating the date and time then convert into dd/mm/yyyy hh:mm:ss
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)

##generating plot3
plot(datetime , datasubset$Sub_metering_1,type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, datasubset$Sub_metering_2,type="l", col="red")
lines(datetime, datasubset$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2.5, col=c("black","red","blue"))

dev.off()
