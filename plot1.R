library(chron)


 #reading in data
url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = url, "power.zip")
unzip("power.zip",exdir = "power")
power<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")


# Date and Time vars are currently factor class
# changing time to times num class and Date into date class (y-m-d)
power$Time<- chron(times=power$Time)
power$Date<- as.Date(power$Date ,"%d/%m/%Y")


# only interested in 2007-02-01 and 2007-02-02
powered<- subset(power, power$Date=="2007-02-01"|power$Date=="2007-02-02")




#plot
#hist(powered$Global_active_power, col="red", main= "Global Active Power", xlab ="Global Active Power (kilowatts)" )

png(filename = "plot1.png",width = 480, height = 480)
 
hist(powered$Global_active_power, col="red", main= "Global Active Power", xlab ="Global Active Power (kilowatts)" )


dev.off()



 