# Coursera/JHU Data Science. Course 4, Week 1
# 11 Feb 2018

# Plot 3

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
unzip( download.file( url, file.path( getwd(), "zipfile.zip")) )

full_data <- fread("./household_power_consumption.txt")
part_Data <- full_data[ full_data$Date %in% c("1/2/2007", "2/2/2007"), ]

png( "plot3.png", width = 480, height = 480, units = "px")

x  <- strptime( paste( part_Data$Date, part_Data$Time ), format = "%d/%m/%Y %H:%M:%S" )  # POSIXlt form
y1 <- as.numeric( part_Data$Sub_metering_1 )
y2 <- as.numeric( part_Data$Sub_metering_2 )
y3 <- as.numeric( part_Data$Sub_metering_3 )

plot( x, y1, xlab = "", ylab = "Energy sub metering", type = "l" )
lines(x, y2, col = "red")
lines(x, y3, col = "blue")
legend( "topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()