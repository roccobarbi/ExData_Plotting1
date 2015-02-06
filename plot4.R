household_Data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
household_Data[,"Date"] <- as.Date(household_Data[,"Date"], format = "%d/%m/%Y")
household_Data <- household_Data[which(household_Data$Date == as.Date("2007-02-01") | household_Data$Date == as.Date("2007-02-02")),]
household_Data$datetime  <- as.POSIXct(paste(household_Data$Date, household_Data$Time), format="%Y-%m-%d %H:%M:%S")
#store langugage settings
user_lang <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")
png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")
par("ps" = 13, mfrow = c(2,2))
# First Plot
plot(household_Data$datetime, household_Data$Global_active_power, type = "n", xlab="", ylab="Global Active Power")
lines(household_Data$datetime, household_Data$Global_active_power, type = "l")
# Second Plot
plot(household_Data$datetime, household_Data$Voltage, type = "n", ylab="Voltage", xlab = "datetime")
lines(household_Data$datetime, household_Data$Voltage, type = "l")
# Third Plot
plot(household_Data$datetime, household_Data$Sub_metering_1, type = "n", ylab="Energy sub metering", xlab = "")
lines(household_Data$datetime, household_Data$Sub_metering_1, type = "l")
lines(household_Data$datetime, household_Data$Sub_metering_2, type = "l", col = "red")
lines(household_Data$datetime, household_Data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
# Fourth Plot
plot(household_Data$datetime, household_Data$Global_reactive_power, type = "n", xlab="datetime", ylab="Global_reactive_power")
lines(household_Data$datetime, household_Data$Global_reactive_power, type = "l")
dev.off()
#restore language
Sys.setlocale("LC_TIME", user_lang)