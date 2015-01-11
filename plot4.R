# Reading in the data
HPC <- read.table("G:/Coursera Courses/John Hopkins - Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Determining which rows correspond to which days
match(c("1/2/2007","2/2/2007","3/2/2007"),HPC$Date)

# Plot 4

png(file = "plot4.png", width = 480, height = 480)

FebData <- HPC[66637:69516,]

FebData$DateTime <- paste(FebData$Date, FebData$Time)
FebData$DateTime <- strptime(FebData$DateTime, format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))

# Top left 

plot(FebData$DateTime, as.numeric(FebData$Global_active_power), xlab = " ", ylab = "Global Active Power", type = "l")

# Top right

plot(FebData$DateTime, FebData$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

# Bottom left

plot(FebData$DateTime, FebData$Sub_metering_1, xlab = " ", ylab = "Energy sub metering", col ="black", type = "l", lwd = 1)
lines(FebData$DateTime, FebData$Sub_metering_2, col ="red", type = "l", lwd = 1)
lines(FebData$DateTime, FebData$Sub_metering_3, col ="blue", type = "l", lwd = 1)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), lwd = c(1,1), col = c("black", "red", "blue"), bty ="n")

# Bottom right

plot(FebData$DateTime, FebData$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()