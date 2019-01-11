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
#Make a histogram plot of Global Active Power save it to 480x480 png called plot1.png
png("GitHub/ExData_Plotting1/plot1.png", height = 480, width = 480)
hist(subdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power", ylab="Frequency", col = "red")
dev.off()
