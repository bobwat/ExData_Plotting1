#Create plot2 folder in working directory
if (!file.exists("plot2")) {
  dir.create("plot2")
}
#URL of folder of zipped files
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#Download, unzip, and store files in ./plot2 directory
download.file(url,destfile = "./plot2/household_power_consumption.zip")
list.files <- unzip("./plot2/household_power_consumption.zip", exdir = "plot2")

###################################################################################################################################################
mydata <- read.csv("./plot2/household_power_consumption.txt", sep=";")

mydata<-subset(mydata,Date=="1/2/2007" | Date=="2/2/2007")

#Put Date and Time in proper format

z<-paste(mydata$Date,mydata$Time,sep=" ")

datetime<-strptime(z,format="%d/%m/%Y %H:%M:%S")

#Transform vector to numeric

Global_active_power<-as.numeric(as.character(mydata$Global_active_power))

#Create Plot

png(file="./plot2/plot2.png",height=480,width=480)

plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()

print("plot2.png found in subdirectory plot2 of working directory")
