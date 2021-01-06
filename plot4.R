##Script Name: plot4.R
##
##Description:
##This Script is builded to solve the request of 
##Exploratory Data Analysis project 1 by creating a graph as pictured in 
##Plot 4 picture
##
##This Script was tested in Windows 10 and must be run in the same folder 
##where the file household_power_consumption.txt is.
##Load requeried libraries
library(data.table)
library(datasets)
##Load data
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na=0)

##Subset data, only dates IN(2007-02-01, 2007-02-02)
hpc <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")


##Create new column for date - time
hpc$date_time <- paste(hpc$Date,hpc$Time, sep = " ")
hpc$date_time <- as.POSIXct(hpc$date_time, format = "%d/%m/%Y %H:%M:%S")

##Set out device
par(mfrow = c(2,2))

##Grph Global Active Power
plot(hpc$date_time,as.numeric(hpc$Global_active_power), type = "n",
     xlab = "", ylab = "Global Active Power")
with(hpc,lines(date_time,as.numeric(Global_active_power)))

##Grph Voltage
plot(hpc$date_time,as.numeric(hpc$Voltage), type = "n",
     xlab = "datetime", ylab = "Voltage")
with(hpc,lines(date_time,as.numeric(Voltage)))

##Graph Energy sub metering
plot(hpc$date_time,hpc$Sub_metering_1,type = "n",xlab = "",
     ylab = "Energy sub metering")
with(hpc,lines(date_time,as.numeric(Sub_metering_1)))
with(hpc,lines(date_time,as.numeric(Sub_metering_2), col = "red"))
with(hpc,lines(date_time,as.numeric(Sub_metering_3), col = "blue"))
legend("topright", lty = 1, col = c("black","red","blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex = 0.5)

##Graph Global Reactive Power
plot(hpc$date_time,as.numeric(hpc$Global_reactive_power), type = "n",
     xlab = "datetime", ylab = "Global_peactive_power")
with(hpc,lines(date_time,as.numeric(Global_reactive_power)))

##Save to file
dev.copy(png, file = "plot4.png") ## Copy to a PNG file
dev.off() ## Close the PNG device