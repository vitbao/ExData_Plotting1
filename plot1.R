# Course Project 1 - Part 1

# Load data
data <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";")

# Extract data for dates 1/2/2007 and 2/2/2007
data_of_interest <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Convert Global active power to character and then numeric (it was factor before)
Global_active_power <- as.numeric(as.character(data_of_interest$Global_active_power))

# Create histogram of Global active power and sent the plot to png file
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col = "red", border = "black", main = "Global Active Power")
dev.off()