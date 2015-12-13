## Loading data
my_data <- read.table(file = "../household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                      colClasses = c(rep("character", times = 2), rep("numeric", times = 7)))

## Getting data from only two days
start_date <- "1/2/2007"
end_date <- "2/2/2007"
plot_data <- my_data[my_data$Date == start_date | my_data$Date == end_date, ]

## Opening graphic device
png(filename = "plot1.png")

## Creating the plot
hist(x = plot_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Closing graphic device
dev.off()
