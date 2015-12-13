## Loading data
my_data <- read.table(file = "../household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                      colClasses = c(rep("character", times = 2), rep("numeric", times = 7)))

## Getting data from only two days
start_date <- "1/2/2007"
end_date <- "2/2/2007"
plot_data <- my_data[my_data$Date == start_date | my_data$Date == end_date, ]
plot_data["Date_time"] <- paste(plot_data$Date, plot_data$Time)
plot_data$Date_time <- as.POSIXlt(plot_data$Date_time, format = "%d/%m/%Y %H:%M:%S")

## Opening graphics device
png(filename = "plot2.png", bg = "transparent")

## Creating the plot
plot(x = plot_data$Date_time, y = plot_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Closing graphics device
dev.off()
