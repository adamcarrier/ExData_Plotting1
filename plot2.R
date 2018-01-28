## plot2.R
## Coursera Exploratory Data Analysis - Course Project 1
## 
## Line graph base plotting for:
## All "Global Active Power (kilowatts)" consumption measurements, by date, plotted against
## the measurement, over a two-day period, from 1 Feb 2007 to 2 Feb 2007
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

## Call PNG graphic device
png(file="plot2.png", width=480, height=480)

## Plot the line graph

# Combine "Date" and "Time" into a new column so it can be graphed along the x axis
df$DateTime <- strptime(paste(df$Date, df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

plot(df$DateTime, df$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)")

dev.off() # default back to screen