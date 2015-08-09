#load data
header<-read.table("household_power_Consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=1)
powerData<-read.table("household_power_Consumption.txt",header=TRUE,sep=";",na.strings="?",skip=66636,nrows=2880)
# variable name assignment
names(powerData)<-names(header)

# convert date and time
datetime<-paste(powerData$Date,powerData$Time, sep=" " )
t<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")

# set number of plots and margines
par(mfrow=c(2,2))
par(mar=c(4,4,3,3))

# plot 1
plot(t,powerData$Global_active_power,type ="l",ylab="Global Active Power (kilowatts)",xlab="")
#plot 2
plot(t,powerData$Voltage,type="l",ylab="Voltage",xlab="datetime")

# plot 3
plot(t,powerData$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(t,powerData$Sub_metering_2,col="red")
lines(t,powerData$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lwd=2)
#plot 4
plot(t,powerData$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

#copy plot to a .png file
dev.copy(png,"plot4.png")
dev.off()