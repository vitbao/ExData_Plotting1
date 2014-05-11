# Course Project 1 - Part 4

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
datetime <- strptime(date_time, "%Y-%m-%d %H:%M:%S")

# Convert Global active power to character and then numeric
Global_active_power <- as.numeric(as.character(data_of_interest$Global_active_power))

# Convert Voltage to numeric
Voltage <- as.numeric(as.character(data_of_interest$Voltage))

# Convert Sub_metering_1/2/3 to character and then numeric 
Sub_metering_1 <- as.numeric(as.character(data_of_interest$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(data_of_interest$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(data_of_interest$Sub_metering_3))

# Convert Global_reactive_power to numeric
Global_reactive_power <- as.numeric(as.character(data_of_interest$Global_reactive_power))


# Create a plot and send the plot to png file
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# Specify number of rows and columns for the multiplot
par(mfrow = c(2, 2))

plot(datetime, Global_active_power, xlab = "", 
     ylab = "Global Active Power", type = "l")

plot(datetime, Voltage, type = "l")

plot(datetime, Sub_metering_1, xlab = "", 
     ylab = "Energy sub metering", type = "l")
lines(datetime, Sub_metering_2, col = "red")
lines(datetime, Sub_metering_3, col = "blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(datetime, Global_reactive_power, type = "l")

dev.off()