#Create plot1 folder in working directory
if (!file.exists("plot1")) {
  dir.create("plot1")
}
#URL of folder of zipped files
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#Download, unzip, and store files in ./plot1 directory
download.file(url,destfile = "./plot1/household_power_consumption.zip")
list.files <- unzip("./plot1/household_power_consumption.zip", exdir = "plot1")

#######################################################################################

mydata<-household_power_consumption <- read.csv("./plot1/household_power_consumption.txt", sep=";")

mydata<-subset(mydata,Date=="1/2/2007" | Date=="2/2/2007")

#Transform vector to numeric

x<-as.numeric(as.character(mydata$Global_active_power))

#Create Plot

png(file="./plot1/plot1.png",height=480,width=480)

hist(x,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

dev.off()

print("plot1.png found in subdirectory plot1 of working directory")
