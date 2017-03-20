
file_name <- "household_power_consumption.txt"
col_classes <- c(NA, NA, rep("numeric", 5))

print("Reading data from household_power_consumption.txt")
print("This takes about 30 seconds. .  .")

tbl <- read.delim(file_name, sep = ";", colClasses = col_classes, na.strings = "?")
tbl$Date <- as.Date(tbl$Date, "%d/%m/%Y")
tbl$POSIX <- as.POSIXct(x=paste(tbl$Date, tbl$Time), format="%Y-%m-%d %H:%M:%S")
#strip dates
tbl <- subset(tbl, Date == "2007-02-01" | Date == "2007-02-02")


#make graph
png(filename = "./plot3.png", width=480, height=480, units="px")
plot(x = tbl$POSIX, y = tbl$Sub_metering_1, type = "s", xlab = NA, ylab = NA)
lines(x = tbl$POSIX, y = tbl$Sub_metering_2, type = "s", xlab = NA, ylab = NA, col = "Red")
lines(x = tbl$POSIX, y = tbl$Sub_metering_3, type = "s", xlab = NA, ylab = NA, col = "Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("Black", "Red", "Blue"), lty=1)
title(ylab = "Energy sub metering")

dev.off()
print("Output saved at plot3.png")