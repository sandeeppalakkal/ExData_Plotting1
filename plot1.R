# Code written as part of assignments for Explratory Data Analysis offered by JHU in coursera.

# This code loads the electrical power consumption data downloaded from UC Irvine Machine Learning Repository and plots plot1 in question.

# Clear the workspace
rm(list=ls())

# Load the data for two days (01-Feb-2007 to 02-Feb-2007):
# First load only 5. Find out the column classes and the names
elecData <- read.table("household_power_consumption.txt",sep=";",header=TRUE,nrow=5,na.strings="?")
classes <- sapply(elecData,class)
elecColNames <- colnames(elecData)
# Load only the necessary rows. Header is excluded since the skip and nrow counts include the header row
elecData <- read.table("household_power_consumption.txt",sep=";",na.strings="?",skip=66637,nrow=69517-66637,col.names=elecColNames,colClasses=classes)

# Plot
png("plot1.png", width = 480, height = 480)
hist(elecData$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
dev.off()