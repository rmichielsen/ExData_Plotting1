
# read txt file into table
power_consumption <- read.table("household_power_consumption.txt", header=TRUE,sep=";", na.strings="?",colClasses=c(rep("character",2),rep("numeric",7))

# Convert dates and times
power_consumption$Time <- strptime(paste(power_consumption$Date,power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")

# subset data
power_consumption.subset <- power_consumption[power_consumption$Date >= as.Date("2007-02-01") & power_consumption$Date<=as.Date("2007-02-02"),]

# Set locale to engish to get English day labels
Sys.setlocale("LC_TIME", locale="English")

## Start a PNG device with width 480x480 and plot the linechart
png("plot2.png", width=480, height=480)
plot(power_consumption.subset$Time, power_consumption.subset$Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

# Reset locale to default
Sys.setlocale("LC_TIME", locale="") 