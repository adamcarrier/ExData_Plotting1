## plot4.R
## Coursera Exploratory Data Analysis - Course Project 1
## 
## Four base plots in a 2x2 grid for 
## Energy consumption measurements over a two-day period, 
## from 1 Feb 2007 to 2 Feb 2007
## 
## Using Data set called "Individual household electric power consumption Data Set,"
## taken from UC Irvine Machine Learning Repository, which is
## hosted here:
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## Set the filename --don't forget to setwd()!
filename <- "household_power_consumption.txt"

## Read data set
df <- read.csv(filename, sep=";", na.string="?")

## Subset df to include only the dates we want
dates <- c("1/2/2007","2/2/2007")
df <- subset(df, Date %in% dates )

## Combine "Date" and "Time" into a new column so it can be graphed along the x axis
df$DateTime <- strptime(paste(df$Date, df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

## Call PNG graphic device
png(file="plot4.png", width=480, height=480)

## Arrange 4 plots in 2x2 window
par(mfrow = c(2,2))

## Plot 1
plot(df$DateTime, df$Global_active_power, type="l", xlab="", ylab = "Global Active Power")

## Plot 2
plot(df$DateTime, df$Voltage, type="l", xlab="datetime", ylab = "Voltage")

## Plot 3
plot(df$DateTime, df$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, type="l", col="red")
lines(df$DateTime, df$Sub_metering_3, type="l", col="blue")
legend("topright", 
       col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1,
       bty = "n"
)

## Plot 4
plot(df$DateTime, df$Global_reactive_power, type="l", xlab="datetime", ylab = "Global_reactive_power")

dev.off() # default back to screen