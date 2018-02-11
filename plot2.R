# Coursera/JHU Data Science. Course 4, Week 1
# 11 Feb 2018

# Plot 2

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
unzip( download.file( url, file.path( getwd(), "zipfile.zip")) )

full_data <- fread("./household_power_consumption.txt")
part_Data <- full_data[ full_data$Date %in% c("1/2/2007", "2/2/2007"), ]

png( "plot2.png", width = 480, height = 480, units = "px")

x <- strptime( paste( part_Data$Date, part_Data$Time ), format = "%d/%m/%Y %H:%M:%S" )  # POSIXlt form
y <- as.numeric( part_Data$Global_active_power )
plot( x, y, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l" )

dev.off()