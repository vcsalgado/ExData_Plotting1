##Script Name: plot2.R
##
##Description:
##This Script is builded to solve the request of 
##Exploratory Data Analysis project 1 by creating a graph as pictured in 
##Plot 2 picture
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
dev.off()
par(mfrow = c(1,1))

##Create new column for date - time
hpc$date_time <- paste(hpc$Date,hpc$Time, sep = " ")
hpc$date_time <- as.POSIXct(hpc$date_time,format="%d/%m/%Y %H:%M:%S")


##Plot data
plot(hpc$date_time,as.numeric(hpc$Global_active_power),type="l",xlab="",
     ylab="Global Active Power (kilowatts)")

##Save to file
dev.copy(png, file = "plot2.png") ## Copy to a PNG file
dev.off() ## Close the PNG device





