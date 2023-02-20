# Load the data set into R environment
data1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
# filter the dataset to only keep 01/02/2007 and 02/02/2007
data1_filter <- data1[data1$Date == "1/2/2007" | data1$Date == "2/2/2007",]
# change the Date and Time format from character to date
data1_filter$DateTime <- paste(data1_filter$Date, data1_filter$Time, sep = " ")
data1_filter$DateTime <- strptime(data1_filter$DateTime, format="%d/%m/%Y %H:%M:%S")



# Generate and Save Histogram of Global Active Power
png(file="./OUTPUT_PLOT/plot4.png", width=480, height=480)

par(mfrow = c(2,2))
plot(y = data1_filter$Global_active_power, x = data1_filter$DateTime, type = "l",
     xlab = "", ylab = "Global Active Power")

plot(y = data1_filter$Voltage, x = data1_filter$DateTime, type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(y = data1_filter$Sub_metering_1, x = data1_filter$DateTime, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(y = data1_filter$Sub_metering_2, x = data1_filter$DateTime, type = "l", col = "red")
lines(y = data1_filter$Sub_metering_3, x = data1_filter$DateTime, type = "l", col = "blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),
       lty=c(1,1,1), ncol=1)

plot(y = data1_filter$Global_reactive_power, x = data1_filter$DateTime, type = "l",
     xlab = "datetime", ylab = "Global Reactive Power")

dev.off()
