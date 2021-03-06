## Reads in data, filters for specified dates, and creates datetime variable. This part of the script is exactly the same for every plot.

library(lubridate)
hpc_raw <- read.delim("Other Files/household_power_consumption.txt", sep = ";", nrows = 2075300, comment.char = "", na.strings = "?")
hpc <- hpc_raw
hpc[[1]] <- dmy(hpc[[1]])
hpc_filtered <- hpc[hpc$Date == ymd("2007-02-01") | hpc$Date == ymd("2007-02-02"), ]
hpc_filtered 

## Generates plot3.png

windows()
{
      with(hpc_filtered, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = 's'))
      with(hpc_filtered, points(datetime, Sub_metering_2, col = "red", type = 's'))
      with(hpc_filtered, points(datetime, Sub_metering_3, col = "blue", type = 's'))
      legend("topright", legend = names(hpc_filtered[7:9]), col = c("black", "red", "blue"), bty = 'n', lwd = '1')
}
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()

