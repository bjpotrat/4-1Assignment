#Read in the data from GitHub\ExData_Plotting1\household_power_consumption.txt
# for 2007-02-01 and 2007-02-02, separator is ";"
library(readr)
library(lubridate)
data <- read_delim("GitHub/ExData_Plotting1/household_power_consumption.txt", 
                   ";", escape_double = FALSE, 
                   col_types = cols(Date = col_character(), Time = col_character()), 
                   trim_ws = TRUE, na='?')
DateTime<-dmy_hms(paste(data$Date, data$Time), tz = "MST")
data<-cbind(DateTime,data)
subdata <- subset(data, DateTime > "2007-02-01" & DateTime < "2007-02-03")
#Make the four required plots in a grid save it to 480x480 png called plot4.png
png("GitHub/ExData_Plotting1/plot4.png", height = 480, width = 480)
par(mfrow=c(2,2))
plot(subdata$DateTime,subdata$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "l")
plot(subdata$DateTime,subdata$Voltage, xlab = "datetime", 
     ylab = "Voltage", type = "l")
plot(subdata$DateTime,subdata$Sub_metering_1, xlab = "", 
     ylab = "Energy Sub Metering", type = "l")
lines(subdata$DateTime,subdata$Sub_metering_2, col="red", type="l")
lines(subdata$DateTime,subdata$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty=1,
       col=c("black", "red", "blue"), box.lty=0, inset=.05)
plot(subdata$DateTime,subdata$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power", type = "l")
dev.off()
