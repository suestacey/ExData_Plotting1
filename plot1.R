plot1<-function(){
		
	library(dplyr, quietly=TRUE, warn.conflicts=FALSE)
	library(tidyr, warn.conflicts=FALSE)
	
	dataFile<-"./data/household_power_consumption.txt"

	data<-read.table(dataFile,fill = TRUE , header = TRUE, sep=';' , stringsAsFactors=FALSE, na.strings="?")

	useData<-data %>% filter(Date %in% c("1/2/2007","2/2/2007"))

	gAP <- as.numeric(useData$Global_active_power)
	
	png("plot1.png", width=480, height=480)
	hist(gAP,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
	dev.off()


}
