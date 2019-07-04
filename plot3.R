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
plot(data$datetime, data$Sub_metering_max, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_1, col = "black")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1),
       y.intersp = 1
)
dev.copy(png, "plot3.png")
dev.off
