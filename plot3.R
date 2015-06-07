plot3<-function(){
	
	dataFile<-"./data/household_power_consumption.txt"

	data<-read.table(dataFile,fill = TRUE , header = TRUE, sep=';' , stringsAsFactors=FALSE, na.strings="?")

	useData<-data %>% filter(Date %in% c("1/2/2007","2/2/2007"))
	
	subMet1 <- as.numeric(useData$Sub_metering_1)
	subMet2 <- as.numeric(useData$Sub_metering_2)
	subMet3 <- as.numeric(useData$Sub_metering_3)

	datetime<- strptime(paste(useData$Date,useData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
	gAP <- as.numeric(useData$Global_active_power)
	
	png("plot3.png", width=480, height=480)
	plot(datetime,subMet1,xlab="",ylab="Energy Submetering",type="l",col="blue")
	lines(datetime,subMet2,type="l",col="red")
	lines(datetime,subMet3,type="l",col="green")
	legend("topright", col=c("blue","red","green"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)
	dev.off()


}
