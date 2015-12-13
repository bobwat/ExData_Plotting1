#Create plot3 folder in working directory
if (!file.exists("plot3")) {
  dir.create("plot3")
}
#URL of folder of zipped files
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#Download, unzip, and store files in ./plot3 directory
download.file(url,destfile = "./plot3/household_power_consumption.zip")
list.files <- unzip("./plot3/household_power_consumption.zip", exdir = "plot3")

#######################################################################################

mydata <- read.csv("./plot3/household_power_consumption.txt", sep=";")

mydata<-subset(mydata,Date=="1/2/2007" | Date=="2/2/2007")
##############################################################################################

#Put Date and Time in Proper format

z<-paste(mydata$Date,mydata$Time,sep=" ")

datetime<-strptime(z,format="%d/%m/%Y %H:%M:%S")

#Transform vectors to numeric

Sub_metering_1<-as.numeric(as.character(mydata$Sub_metering_1))

Sub_metering_2<-as.numeric(as.character(mydata$Sub_metering_2))

Sub_metering_3<-as.numeric(as.character(mydata$Sub_metering_3))

#Create Plot

png(file="./plot3/plot3.png", height=480, width=480)

plot(datetime,Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering")

points(datetime,Sub_metering_2,type="l",col="red")

points(datetime,Sub_metering_3,type="l",col="blue")

legend("topright",lty=c(1,1),col=c("black","red","blue") ,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

print("plot3.png found in subdirectory plot3 of working directory")
