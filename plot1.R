 
getwd()
##read the data from the file
data <- read.csv("household_power_consumption.txt",header = TRUE, sep=";",na.string="?")
summary(data)

##subset the data with dates 2007-02-01 and 2007-02-02
datasubset <- data[data$Date  == "1/2/2007"  | data$Date  == "2/2/2007", ]

##generating the plot
hist(datasubset$Global_active_power,col="red", main="Global Active Power" , xlab="Global Actie Power(killowatts)")

# copy myplot to PNG file
dev.copy(png, filename="plot1.png", width = 480, height = 480)

dev.off()
