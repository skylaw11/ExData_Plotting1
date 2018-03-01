#Reading txt file of the downloaded file. The code must be in the specific folder where the file is. 
data1 <- read.table("household_power_consumption.txt",skip=1,sep=";",stringsAsFactors=FALSE, dec=".")
#Naming columns of the file
colnames(data1) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Subsetting the dates to 2-day period of Feb. 2007
specific_date <-  data1[data1$Date %in% c("1/2/2007","2/2/2007"),]

#Converting character representations to specific date format representing calendar dates and time
NewTime <- strptime(paste(specific_date$Date,specific_date$Time, sep =" " ), "%d/%m/%Y %H:%M:%S")

#Naming and initializing plot 
png('plot4.png')
#Setting 2x2 Matrix plot
par(mfrow = c(2,2))
#Plotting 4 Different data types in one graph
plot(NewTime, specific_date$Global_active_power, type="l", ylab="Global Active Power",  xlab="") #First plot
plot(NewTime, specific_date$Voltage, type="l", ylab = "Voltage", xlab = "datetime") #Second plot

plot(NewTime,specific_date$Sub_metering_1,type="l",col="black", ylab="Energy Submetering", xlab="") #Third Plot with subplots
lines(NewTime,specific_date$Sub_metering_2,col="red")
lines(NewTime,specific_date$Sub_metering_3,col="blue")

plot(NewTime, specific_date$Global_reactive_power, type="l",ylab = "Global_reactive_power", xlab = "datetime") #Fourth plot

dev.off()