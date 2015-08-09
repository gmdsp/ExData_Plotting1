#load data
header<-read.table("household_power_Consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=1)
powerData<-read.table("household_power_Consumption.txt",header=TRUE,sep=";",na.strings="?",skip=66636,nrows=2880)
# variable name assignment
names(powerData)<-names(header)

par(mfrow=c(1,1))
par(mar=c(4,4,3,3))

# plot histogram
hist(powerData$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main=paste("Global Active Power"))

#copy plot to a .png file
dev.copy(png,"plot1.png")
dev.off()
