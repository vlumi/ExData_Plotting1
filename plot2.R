data <- read.table("household_power_consumption.txt",
                   nrows = 69517, # Stop after 2/2/2007
                   header = TRUE,
                   sep = ";",
                   dec = ".",
                   na.strings = "?",
                   stringsAsFactors = FALSE)
data$datetime <- as.POSIXlt(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
data$Sub_metering_max <- pmax(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3)

par(mfrow = c(1, 1))
plot(data$datetime, data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$datetime, data$Global_active_power)
dev.copy(png, "plot2.png")
dev.off
