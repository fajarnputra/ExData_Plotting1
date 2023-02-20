# Load the data set into R environment
data1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
# filter the dataset to only keep 01/02/2007 and 02/02/2007
data1_filter <- data1[data1$Date == "1/2/2007" | data1$Date == "2/2/2007",]
# change the Date and Time format from character to date
data1_filter$DateTime <- paste(data1_filter$Date, data1_filter$Time, sep = " ")
data1_filter$DateTime <- strptime(data1_filter$DateTime, format="%d/%m/%Y %H:%M:%S")



# Generate and Save Histogram of Global Active Power
png(file="./OUTPUT_PLOT/plot2.png", width=480, height=480)
plot(y = data1_filter$Global_active_power, x = data1_filter$DateTime, type = "l",
     xlab = "", ylab = "GLobal Active Power (kilowatts)")
dev.off()
