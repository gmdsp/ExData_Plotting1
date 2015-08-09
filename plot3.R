#load data
header<-read.table("household_power_Consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=1)
powerData<-read.table("household_power_Consumption.txt",header=TRUE,sep=";",na.strings="?",skip=66636,nrows=2880)
# variable name assignment
names(powerData)<-names(header)


datetime<-paste(powerData$Date,powerData$Time, sep=" " )
t<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))
par(mar=c(4,4,3,3))

plot(t,powerData$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(t,powerData$Sub_metering_2,col="red")
lines(t,powerData$Sub_metering_3,col="blue")

# add a legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lwd=2)

#copy plot to a .png file
dev.copy(png,"plot3.png")
dev.off()