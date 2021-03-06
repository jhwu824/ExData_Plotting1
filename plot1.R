## Reads in data, filters for specified dates, and creates datetime variable. This part of the script is exactly the same for every plot.

library(lubridate)
hpc_raw <- read.delim("Other Files/household_power_consumption.txt", sep = ";", nrows = 2075300, comment.char = "", na.strings = "?")
hpc <- hpc_raw
hpc[[1]] <- dmy(hpc[[1]])
hpc_filtered <- hpc[hpc$Date == ymd("2007-02-01") | hpc$Date == ymd("2007-02-02"), ]
hpc_filtered <- cbind(hpc_filtered, datetime = as.POSIXct(paste(hpc_filtered$Date, hpc_filtered$Time), format="%Y-%m-%d %H:%M:%S"))

## Generates plot1.png

windows()
hist(hpc_filtered$Global_active_power, col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()