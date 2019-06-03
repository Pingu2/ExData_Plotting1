#plot 2


#reading in data
url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = url, "power.zip")
unzip("power.zip",exdir = "power")
power<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")


# Date and Time vars are currently factor class
# merging date and time to create a single var
DT<- paste(as.character(power$Date)  ," ", as.character(power$Time) )
power$DateTime<- strptime(DT, format = "%d/%m/%Y %H:%M:%S")
power$Time<- chron(times=power$Time)
power$Date<- as.Date(power$Date ,"%d/%m/%Y")



# only interested in 2007-02-01 and 2007-02-02
powered<- subset(power, power$Date=="2007-02-01"|power$Date=="2007-02-02")


#plot

png(filename = "plot2.png",width = 480, height = 480)
with(powered, plot(DateTime, Global_active_power, type="l", ylab ="Global Active Power (kilowatts)" ,xlab=""))
dev.off()

