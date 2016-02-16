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
png("plot3.png")
with(feb_df, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(feb_df, points(DateTime, Sub_metering_2, type="l", col="red"))
with(feb_df, points(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

