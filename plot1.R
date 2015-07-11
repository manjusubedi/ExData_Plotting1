###############
## Plot 1
###############

setwd("C:/Users/Kapil/Downloads/CourseraExploratoryData")## setting working directory
# read dataset on Electric power consumption from my working directory
EPCdata<-read.table("household_power_consumption.txt",header = T, sep=";",na.strings = "?", as.is = T)
## subsetting interested rows from given data to use in the assignment, called is "useData"
useData<-subset(EPCdata,EPCdata$Date=="1/2/2007"|EPCdata$Date=="2/2/2007")
# converting the Date variable from the data 
useData$Date <- as.Date(useData$Date, format="%d/%m/%Y")
# create the new variable called "datetime", class as.POSIXlt by binding Date and Time variable from the data
datetime<-as.POSIXlt(paste(useData$Date,useData$Time,sep = " "))
# making new data frame "useData" by binding "datetime" varibale
useData<-cbind(datetime,useData)
## lotting the histrogram 
png("plot1.png", width=480, height=480)
hist(useData$Global_active_power,col="red", breaks=12, main = "Global Active Power",xlab = "Globel Active Power (kilowatts)",ylab = "Frequency")
dev.off()
