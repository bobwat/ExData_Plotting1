#Create plot4 folder in working directory
if (!file.exists("plot4")) {
  dir.create("plot4")
}
#URL of folder of zipped files
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#Download, unzip, and store files in ./plot4 directory
download.file(url,destfile = "./plot4/household_power_consumption.zip")
list.files <- unzip("./plot4/household_power_consumption.zip", exdir = "plot4")


####################################################################################################################
mydata <- read.csv("./plot4/household_power_consumption.txt", sep=";")

mydata<-subset(mydata,Date=="1/2/2007" | Date=="2/2/2007")

#Put Date and Time in proper format

z<-paste(mydata$Date,mydata$Time,sep=" ")

datetime<-strptime(z,format="%d/%m/%Y %H:%M:%S")

#Transform Vectors to numeric

Voltage<-as.numeric(as.character(mydata$Voltage))

Global_active_power<-as.numeric(as.character(mydata$Global_active_power))

Sub_metering_1<-as.numeric(as.character(mydata$Sub_metering_1))

Sub_metering_2<-as.numeric(as.character(mydata$Sub_metering_2))

Sub_metering_3<-as.numeric(as.character(mydata$Sub_metering_3))

Global_reactive_power<-as.numeric(as.character(mydata$Global_reactive_power))

# Create Plot

png(file="./plot4/plot4.png",height=480,width=480)

par(mfrow=c(2,2))

#first plot
plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#second plot
plot(datetime,Voltage,type="l")
#third plot
plot(datetime,Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering")
points(datetime,Sub_metering_2,type="l",col="red")
points(datetime,Sub_metering_3,type="l",col="blue")
legend("topright",lty=c(1,1),col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",trace=TRUE,cex = 1,text.font=2,y.intersp=0.5)
#fourth plot
plot(datetime,Global_reactive_power,type="l")

dev.off()

print("plot4.png found in subdirectory plot4 of working directory")
