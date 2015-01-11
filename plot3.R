# Reading in the data
HPC <- read.table("G:/Coursera Courses/John Hopkins - Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Determining which rows correspond to which days
match(c("1/2/2007","2/2/2007","3/2/2007"),HPC$Date)

# Plot 3

png(file = "plot3.png", width = 480, height = 480)

FebData <- HPC[66637:69516,]

FebData$DateTime <- paste(FebData$Date, FebData$Time)
FebData$DateTime <- strptime(FebData$DateTime, format = "%d/%m/%Y %H:%M:%S")

plot(FebData$DateTime, FebData$Sub_metering_1, xlab = " ", ylab = "Energy sub metering", col ="black", type = "l", lwd = 1)
lines(FebData$DateTime, FebData$Sub_metering_2, col ="red", type = "l", lwd = 1)
lines(FebData$DateTime, FebData$Sub_metering_3, col ="blue", type = "l", lwd = 1)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), lwd = c(1,1), col = c("black", "red", "blue"))

dev.off()