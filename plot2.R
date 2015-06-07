# John Hopkins Data Science MOOC
# Exploratory Data Analysis - Course Project 1 07/06/2015
# Plot 2

# Read dataset "household_power_consumption.txt" into dataframe 'allData'.
allData <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", as.is = TRUE)
str(allData)
# Convert Date variable from 'character' class to 'Date' class 
allData$Date <- as.Date(allData$Date, "%d/%m/%Y")

# Create a data subset 'myData' for the dates of interest: 2007-02-01 and 2007-02-02. 
myData <- subset(allData, Date >= "2007-02-01" & Date <= "2007-02-02")
# Check result: expected no of records is 2 [days] * 24 [hours] * 60 [minutes] = 2880.
# Returned file size is as expected. 

# Convert Time variable from 'character' class to 'POSIXlt' class 
myData$Time <- strptime(myData$Time, "%H:%M:%S")
# This defaults the date elements to today's date, so correct the dates to 
# 2007-02-01 (first 1440 records) and 2007-02-02 (second 1440 records). 
# Load package lubridate
install.packages("lubridate")
library(lubridate)
myData$Time[1:1440] <- update(myData$Time, year=2007, month=2, day = 1)
myData$Time[1441:2880] <- update(myData$Time, year=2007, month=2, day = 2)

# Construct plot 'plot2.png'
plot(myData$Time, myData$Global_active_power, type="l", main="", xlab="", ylab = "Global Active Power (kilowatts)")
# and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()

# [End of document] 