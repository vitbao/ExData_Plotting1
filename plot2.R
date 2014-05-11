# Course Project 1 - Part 2

# Load data
data <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";")

# Extract data for dates 1/2/2007 and 2/2/2007
data_of_interest <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Convert column Date to Date class
dates <- as.Date(data_of_interest$Date, format = "%d/%m/%Y")

# Convert column Time to Time class
time <- as.character(data_of_interest$Time)

# Create a Date-time object using paste()
date_time <- paste(dates, time)

# Convert the Date-time object to character
date_time <- strptime(date_time, "%Y-%m-%d %H:%M:%S")

# Convert Global active power to character and then numeric (it was factor before)
Global_active_power <- as.numeric(as.character(data_of_interest$Global_active_power))

# Create a plot and send the plot to png file
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(date_time, Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()