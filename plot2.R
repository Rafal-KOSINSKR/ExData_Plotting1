## This script constructs plot 2

#Read the data
library(data.table)
all_dt <- fread("household_power_consumption.txt", na.strings=c("NA", "?"))
feb_dt <- all_dt[all_dt$Date %in% c("1/2/2007", "2/2/2007"),]
rm(all_dt)

#Format the data
feb_df <- as.data.frame(feb_dt)
rm(feb_dt)
feb_df$DateTime <- strptime(paste(feb_df$Date, feb_df$Time), "%d/%m/%Y %H:%M:%S")

#Produce graphics
Sys.setlocale(locale = "USA")
png("plot2.png")
plot(feb_df$DateTime, feb_df$Global_active_power, type="l", xlab="", ylab="Global Active Power [kilowatts]")
dev.off()

