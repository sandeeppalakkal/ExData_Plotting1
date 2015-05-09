# Code written as part of assignments for Explratory Data Analysis offered by JHU in coursera.

# This code loads the electrical power consumption data downloaded from UC Irvine Machine Learning Repository and plots plot4 in question.

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
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
# Subplot 1
plot(x=strptime(paste(elecData$Date,elecData$Time,sep=" "),format="%d/%m/%Y %H:%M:%S"),y=elecData$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
# subplot 2
plot(x=strptime(paste(elecData$Date,elecData$Time,sep=" "),format="%d/%m/%Y %H:%M:%S"),elecData$Voltage,type="l",ylab="Voltage",xlab="datetime")
# subplot 3
plot(x=strptime(paste(elecData$Date,elecData$Time,sep=" "),format="%d/%m/%Y %H:%M:%S"),elecData$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=strptime(paste(elecData$Date,elecData$Time,sep=" "),format="%d/%m/%Y %H:%M:%S"),elecData$Sub_metering_2,col="red")
lines(x=strptime(paste(elecData$Date,elecData$Time,sep=" "),format="%d/%m/%Y %H:%M:%S"),elecData$Sub_metering_3,col="blue")
legend("topright",legend = colnames(elecData[7:9]),col=c("black","red","blue"),lty=rep(1,3),bty="n")
# Subplot 4
plot(x=strptime(paste(elecData$Date,elecData$Time,sep=" "),format="%d/%m/%Y %H:%M:%S"),elecData$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="s")
dev.off()