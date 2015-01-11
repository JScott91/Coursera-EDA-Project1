# Reading in the data
HPC <- read.table("G:/Coursera Courses/John Hopkins - Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Determining which rows correspond to which days
match(c("1/2/2007","2/2/2007","3/2/2007"),HPC$Date)

# Plot 2

png(file = "plot2.png", width = 480, height = 480)

FebData <- HPC[66637:69516,]

FebData$DateTime <- paste(FebData$Date, FebData$Time)
FebData$DateTime <- strptime(FebData$DateTime, format = "%d/%m/%Y %H:%M:%S")

plot(FebData$DateTime, as.numeric(FebData$Global_active_power), xlab = " ", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()
