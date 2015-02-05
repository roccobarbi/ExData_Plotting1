household_Data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
household_Data[,"Date"] <- as.Date(household_Data[,"Date"], format = "%d/%m/%Y")
household_Data <- household_Data[household_Data[,"Date"] == as.Date("2007-02-01") | household_Data[,"Date"] == as.Date("2007-02-02"),]
household_Data$datetime  <- as.POSIXct(paste(household_Data$Date, household_Data$Time), format="%Y-%m-%d %H:%M:%S")
hist(as.numeric(household_Data$Global_active_power), main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="red", ylim = c(0,1200))
