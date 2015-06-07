plot4<-function(){
		
	library(dplyr, quietly=TRUE, warn.conflicts=FALSE)
	library(tidyr, warn.conflicts=FALSE)
		
	dataFile<-"./data/household_power_consumption.txt"

	data<-read.table(dataFile,fill = TRUE , header = TRUE, sep=';' , stringsAsFactors=FALSE, na.strings="?")

	useData<-data %>% filter(Date %in% c("1/2/2007","2/2/2007"))
	
	subMet1 <- as.numeric(useData$Sub_metering_1)
	subMet2 <- as.numeric(useData$Sub_metering_2)
	subMet3 <- as.numeric(useData$Sub_metering_3)

	datetime<- strptime(paste(useData$Date,useData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
	gAP <- as.numeric(useData$Global_active_power)
	gRP <- as.numeric(useData$Global_reactive_power)
	volt <-as.numeric(useData$Voltage)
	
	png("plot4.png", width=480, height=480)
	par(mfrow=c(2,2))
	
	# Plot 1
	plot(datetime,gAP,xlab="",ylab="Global Active Power",type="l",col="blue")
	
	# Plot 2
	plot(datetime,volt,xlab="",ylab="Voltage",type="l",col="blue")
	# I removed the xlab="datetime" because it's inconsistent with Plot 1 and 3
	# plot(datetime,volt,xlab="datetime",ylab="Voltage",type="l",col="blue")
	
	#Plot 3
	plot(datetime,subMet1,xlab="",ylab="Energy Submetering",type="l",col="blue")
	lines(datetime,subMet2,type="l",col="red")
	lines(datetime,subMet3,type="l",col="green")
	legend("topright", col=c("blue","red","green"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)
	
	#Plot 4
	plot(datetime,gRP,xlab="",ylab="Global Reactive Power",type="l",col="blue")
	# I removed the xlab="datetime" because it's inconsistent with Plot 1 and 3
	#plot(datetime,gRP,xlab="datetime",ylab="Global Reactive Power",type="l",col="blue")
	
	
	dev.off()


}
