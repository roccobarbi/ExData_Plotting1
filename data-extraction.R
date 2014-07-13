household_Data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
household_Data[,"Date"] <- as.Date(household_Data[,"Date"], format = "%d/%m/%Y")
household_Data <- household_Data[household_Data[,"Date"] == as.Date("2007-02-01") | household_Data[,"Date"] == as.Date("2007-02-02"),]
household_Data[,"DateTime"]  <- as.POSIXct(paste(household_Data[,"Date"], household_Data[,"Time"]), format="%Y-%m-%d %H:%M:%S")
