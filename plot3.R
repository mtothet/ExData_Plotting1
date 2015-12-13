## Loading data
my_data <- read.table(file = "../household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                      colClasses = c(rep("character", times = 2), rep("numeric", times = 7)))

## Getting data from only two days
start_date <- "1/2/2007"
end_date <- "2/2/2007"
plot_data <- my_data[my_data$Date == start_date | my_data$Date == end_date, ]
plot_data["Date_time"] <- paste(plot_data$Date, plot_data$Time)
plot_data$Date_time <- as.POSIXlt(plot_data$Date_time, format = "%d/%m/%Y %H:%M:%S")

## Opening graphic device
png(filename = "plot3.png", bg = "transparent")

## Creating the plot
plot(x = plot_data$Date_time, y = plot_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = plot_data$Date_time, y = plot_data$Sub_metering_2, col = "red")
lines(x = plot_data$Date_time, y = plot_data$Sub_metering_3, col = "blue")
legend(x = "topright", legend = colnames(plot_data)[7:9], col = c("black", "red", "blue"), lty = 1)

## Closing graphic device
dev.off()
