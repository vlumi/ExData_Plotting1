data <- read.table("household_power_consumption.txt",
                   nrows = 69517, # Stop after 2/2/2007
                   header = TRUE,
                   sep = ";",
                   dec = ".",
                   na.strings = "?",
                   stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

par(mfrow = c(1, 1))
hist(data$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off
