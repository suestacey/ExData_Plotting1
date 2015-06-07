plot2<-function(){
		
	library(dplyr, quietly=TRUE, warn.conflicts=FALSE)
	library(tidyr, warn.conflicts=FALSE)
		
	dataFile<-"./data/household_power_consumption.txt"

	data<-read.table(dataFile,fill = TRUE , header = TRUE, sep=';' , stringsAsFactors=FALSE, na.strings="?")

	useData<-data %>% filter(Date %in% c("1/2/2007","2/2/2007"))

	datetime<- strptime(paste(useData$Date,useData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
	gAP <- as.numeric(useData$Global_active_power)
	
	png("plot2.png", width=480, height=480)
	plot(datetime,gAP,xlab="",ylab="Global Active Power (kilowatts)",type="l",col="blue")
	dev.off()


}
