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
#Make a time series plot of Global Active Power save it to 480x480 png called plot2.png
png("GitHub/ExData_Plotting1/plot2.png", height = 480, width = 480)
plot(subdata$DateTime,subdata$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
