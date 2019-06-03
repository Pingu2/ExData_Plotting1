#plot 3


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

png(filename = "plot3.png",width = 480, height = 480)

with(powered, plot(DateTime, Sub_metering_1, type="l", ylab ="Energy sub metering" ,xlab=""))
points(powered$DateTime, powered$Sub_metering_2, type="l", col="red")
points(powered$DateTime, powered$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1), lwd=c(2.5,2.5), col=c("black","red", "blue") ,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7)

dev.off()

 

