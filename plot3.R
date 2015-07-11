###############
## Plot3
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
## Send a copy to the plot3.png output file
png("plot3.png",width = 480,height = 480)
# setting the margins
par(mar=c(5,4,2,2))
## making plot
plot(useData$datetime, useData$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = " ")
points(useData$datetime, useData$Sub_metering_1,type = "l")
points(useData$datetime, useData$Sub_metering_2,col="red",type = "l")
points(useData$datetime, useData$Sub_metering_3,col="blue",type = "l")
legend("topright",c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, lwd=2)
dev.off()
