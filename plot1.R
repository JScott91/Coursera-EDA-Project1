# Reading in the data
HPC <- read.table("G:/Coursera Courses/John Hopkins - Exploratory Data Analysis/Course Project 1/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Determining which rows correspond to which days
match(c("1/2/2007","2/2/2007","3/2/2007"),HPC$Date)

# Plot 1

png(file = "plot1.png", width = 480, height = 480)

FebData <- HPC[66637:69516,]
hist(as.numeric(FebData$Global_active_power), breaks = 12, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()