# Exploratory Data Analysis Project 1
# Plot 1
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

##Plot graph 1
attach(data)
hist(Global_active_power,main="Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col = "Red")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(data)

