setwd("C:\\Users\\Igor\\Desktop\\Ciencia de Dados\\Coursera R\\Exploratory Data Analysis")

##Reading data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##Subseting by date
dataSub <- subset(data, (Date == "2/2/2007" | Date == "1/2/2007"))
##Converting as numeric
dataSub$Global_active_power <- as.numeric(dataSub$Global_active_power)
dataSub$Sub_metering_1      <- as.numeric(dataSub$Sub_metering_1)
dataSub$Sub_metering_2      <- as.numeric(dataSub$Sub_metering_2)
dataSub$Sub_metering_3      <- as.numeric(dataSub$Sub_metering_3)
##Converting as Date/Time
datetime <- strptime(paste(dataSub$Date, dataSub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
##Generating graph 
png("plot3.png", width=480, height=480)
plot(datetime, dataSub$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, dataSub$Sub_metering_2, type="l", col="red")
lines(datetime, dataSub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
