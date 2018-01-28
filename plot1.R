## plot1.R
## Coursera Exploratory Data Analysis - Course Project 1
## 
## Histogram base plotting for:
## "Global Active Power (kilowatts)" consumption plotted against 
## "Frequency" (i.e., number of measurements at each measured consumption rate)
## over a two-day period, from 1 Feb 2007 to 2 Feb 2007
## 
## Using Data set called "Individual household electric power consumption Data Set,"
## taken from UC Irvine Machine Learning Repository, which is
## hosted here:
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## Get required packages
require("data.table") # for fread

## Set the filename --don't forget to setwd()!
filename <- "household_power_consumption.txt"

## Read data set --skip all the leading rows up to the date we're starting from.
## This should save time and memory.
df <- fread(filename,
            sep=";",
            header=TRUE,
            na.strings = "?", # interpret ? as NA
            skip="1/2/2007", # ignore all rows up to this date
            colClasses = c("Date",      # "Date"
                           "character", # "Time"
                           "numeric",   # "Global_active_power"
                           "numeric",   # "Global_reactive_power"
                           "numeric",   # "Voltage"
                           "numeric",   # "Global_intensity"
                           "numeric",   # "Sub_metering_1"
                           "numeric",   # "Sub_metering_2"
                           "numeric")   # "Sub_metering_3"
            )

## Add the column names back in, sine the skip argument in fread dropped them
colnames(df) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Subset df to include only the dates we want
dates <- c("1/2/2007","2/2/2007")
df <- subset(df, Date %in% dates )

## Call PNG graphic device
png(file="plot1.png", width=480, height=480)

## Plot the histogram
hist(df$Global_active_power, 
     col="red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency"
     )
axis(2, seq(0,1200,200)) # set y axis tick marks

dev.off() # default back to screen