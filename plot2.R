setwd("C:\\Users\\Igor\\Desktop\\Ciencia de Dados\\Coursera R\\Exploratory Data Analysis")

##Reading data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##Subseting by date
dataSub <- subset(data, (Date == "2/2/2007" | Date == "1/2/2007"))
##Converting as numeric
dataSub$Global_active_power <- as.numeric(dataSub$Global_active_power)
##Converting as Date/Time
datetime <- strptime(paste(dataSub$Date, dataSub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
##Generating graph 
png("plot2.png", width=480, height=480)
plot(datetime, dataSub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
