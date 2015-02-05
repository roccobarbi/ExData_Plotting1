household_Data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
household_Data[,"Date"] <- as.Date(household_Data[,"Date"], format = "%d/%m/%Y")
household_Data <- household_Data[which(household_Data$Date == as.Date("2007-02-01") | household_Data$Date == as.Date("2007-02-02")),]
household_Data$datetime  <- as.POSIXct(paste(household_Data$Date, household_Data$Time), format="%Y-%m-%d %H:%M:%S")
par("ps" = 13)
#store langugage settings
user_lang <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")
plot(household_Data$datetime, household_Data$Global_active_power, type = "n", ylab="Global Active Power (kilowatts)", xlab = "")
lines(household_Data$datetime, household_Data$Global_active_power, type = "l")
dev.off()
#restore language
Sys.setlocale("LC_TIME", user_lang)
