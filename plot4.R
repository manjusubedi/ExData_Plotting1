###############
## Plot4
###############

setwd("C:/Users/Kapil/Downloads/CourseraExploratoryData")## setting working directory
# read required data from my working directory
EPCdata<-read.table("household_power_consumption.txt",header = T, sep=";",na.strings = "?", as.is = T)
## subsetting interested rows from given data to use in the assignment, called is "useData"
useData<-subset(EPCdata,EPCdata$Date=="1/2/2007"|EPCdata$Date=="2/2/2007")
# changing the class of the Date variable from the data 
useData$Date <- as.Date(useData$Date, format="%d/%m/%Y")
# create the new variable called "datetime", class as.POSIXlt by binding Date and Time variable from the data
datetime<-as.POSIXlt(paste(useData$Date,useData$Time,sep = " "))
# making new data frame "useData" by binding "datetime" varibale
useData<-cbind(datetime,useData)
png("plot4.png",width = 480,height = 480)
par(mfcol=c(2,2))
par(mar=c(4,4,2,2))
plot(useData$datetime,useData$Global_active_power,type="l",xlab = " ",ylab = "Global Active Power")
plot(useData$datetime, useData$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = " ")
points(useData$datetime, useData$Sub_metering_1,type = "l")
points(useData$datetime, useData$Sub_metering_2,col="red",type = "l")
points(useData$datetime, useData$Sub_metering_3,col="blue",type = "l")
legend("topright",c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty = "solid", bty = "n")
plot(useData$datetime, useData$Voltage,type="l",xlab="datetime ",ylab="Voltage")
plot(useData$datetime,useData$Global_reactive_power, type="l",ylab = "Global_reactive_power",xlab = " datetime ")
dev.off()
