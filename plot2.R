 ##read the data from the file
data <- read.csv("household_power_consumption.txt",header = TRUE, sep=";",na.string="?")

##subset the data with dates 2007-02-01 and 2007-02-02
datasubset <- data[data$Date  == "1/2/2007"  | data$Date  == "2/2/2007", ]
summary(datasubset)

## concatenating the date and time then convert into dd/mm/yyyy hh:mm:ss
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)
 
##generating plot2
plot(datetime , datasubset$Global_active_power,type="l", ylab="Global Actie Power(killowatts)", xlab="") 
dev.off()

 
