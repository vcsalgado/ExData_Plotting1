##Script Name: plot1.R
##
##Description:
##This Script is builded to solve the request of 
##Exploratory Data Analysis project 1 by creating a graph as pictured in 
##Plot 1 picture (Histogram)
##
##This Script was tested in Windows 10 and must be run in the same folder 
##where the file household_power_consumption.txt is.
##Load requeried libraries
library(data.table)
library(datasets)
##Load data
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

##Subset data, only dates IN(2007-02-01, 2007-02-02)
hpc <- subset(hpc, hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007")

##Reset out device
par(mfrow = c(1,1))

##Plot data
hist(as.numeric(hpc$Global_active_power),col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab = "Frequency")

##Save to file
dev.copy(png, file = "plot1.png") ## Copy to a PNG file
dev.off() ## Close the PNG device

