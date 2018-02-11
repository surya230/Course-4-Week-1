
# Coursera/JHU Data Science. Course 4, Week 1
# 11 Feb 2018

# Plot 4

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
unzip( download.file( url, file.path( getwd(), "zipfile.zip")) )

full_data <- fread("./household_power_consumption.txt")
part_Data <- full_data[ full_data$Date %in% c("1/2/2007", "2/2/2007"), ]

png( "plot4.png", width = 480, height = 480, units = "px")

par( mfrow = c(2,2))
x  <- strptime( paste( part_Data$Date, part_Data$Time ), format = "%d/%m/%Y %H:%M:%S" )  # POSIXlt form

# Upper left

y  <- as.numeric( part_Data$Global_active_power )
plot( x, y, xlab = "", ylab = "Global Active Power", type = "l" )

# Upper right

y  <- as.numeric( part_Data$Voltage )
plot( x, y, xlab = "datetime", ylab = "Voltage", type = "l" )

# Bottom left

y1 <- as.numeric( part_Data$Sub_metering_1 )
y2 <- as.numeric( part_Data$Sub_metering_2 )
y3 <- as.numeric( part_Data$Sub_metering_3 )

plot( x, y1, xlab = "", ylab = "Energy sub metering", type = "l" )
lines(x, y2, col = "red")
lines(x, y3, col = "blue")
legend( "topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Bottom right

y  <- as.numeric( part_Data$Global_reactive_power )
plot( x, y, xlab = "datetime", ylab = "Global_reactive_power", type = "l" )

dev.off()