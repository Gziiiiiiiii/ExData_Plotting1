# Exploratory Data Analysis Project 1
# Plot 3
######################################################

##load data
data <- read.table("household_power_consumption.txt",
                   header = T, sep= ";",na.strings = "?")

##Convert Date var to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

##Filter data from 2007-02-01 to 2007-02-02
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

##Convert Time var to Time class
data$datetime <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")

##Plot graph 3
data$datetime <- as.POSIXct(data$datetime)
attach(data)
plot (Sub_metering_1 ~ datetime, type = "l",
      xlab ="",
      ylab = "Energy sub metering")
lines(Sub_metering_2 ~ datetime, col="Red")
lines(Sub_metering_3 ~ datetime, col="Blue")
legend ("topright",lty = 1, col=c("black","red","blue"),
        c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(data)

