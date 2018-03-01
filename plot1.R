#Reading txt file of the downloaded file. The code must be in the specific folder where the file is. 
data1 <- read.table("household_power_consumption.txt",skip=1,sep=";")
#Naming columns of the file
colnames(data1) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Subsetting the dates to 2-day period of Feb. 2007
specific_date <-  data1[data1$Date %in% c("1/2/2007","2/2/2007"),]

#Naming and initializing plot 
png('plot1.png')
#Plotting histogram
hist(as.numeric(as.character(specific_date$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()