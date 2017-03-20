
file_name <- "household_power_consumption.txt"
col_classes <- c(NA, NA, rep("numeric", 5))

print("Reading data from household_power_consumption.txt")
print("This takes about 30 seconds. .  .")

tbl <- read.delim(file_name, sep = ";", colClasses = col_classes, na.strings = "?")
tbl$Date <- as.Date(tbl$Date, "%d/%m/%Y")

#strip dates
tbl <- subset(tbl, Date == "2007-02-01" | Date == "2007-02-02")

#make graph
png(filename = "./plot1.png", width=480, height=480, units="px")
hist(tbl$Global_active_power, col="Red", ylim = c(0, 1200), main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
print("Output saved at plot1.png")