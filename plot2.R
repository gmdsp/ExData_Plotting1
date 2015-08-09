#load data
header<-read.table("household_power_Consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=1)
powerData<-read.table("household_power_Consumption.txt",header=TRUE,sep=";",na.strings="?",skip=66636,nrows=2880)
# variable name assignment
names(powerData)<-names(header)


datetime<-paste(powerData$Date,powerData$Time, sep=" " )
t<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")


par(mfrow=c(1,1))
par(mar=c(4,4,3,3))

plot(t,powerData$Global_active_power,type ="l",ylab="Global Active Power (kilowatts)",xlab="")

#copy plot to a .png file
dev.copy(png,"plot2.png")
dev.off()