## This is for the fourth plot, week 1, for Exploratory Data Analysis

setwd("C:/Users/aamar/Desktop")
library(dplyr)
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  colClasses = c("character","character", 
                                 rep("numeric",7), 
                                 na.strings = "?"))
hpcx <- filter(hpc, Date == "2/2/2007" | Date == "1/2/2007")
hpcx$Date <- as.Date(hpcx$Date, format = "%d/%m/%Y")
hpcx$DateTime <- as.POSIXct(paste(hpcx$Date, hpcx$Time))
Sys.setlocale("LC_TIME", "English")

## 4

par(par, mfcol = c(2, 2))
plot(x = hpcx$DateTime,
     y = as.numeric(as.character(hpcx$Global_active_power)),
     type = "line",
     ylab = "Global Active Power",
     xlab = "")
plot(x = hpcx$DateTime,
     y = as.numeric(as.character(hpcx$Sub_metering_1)),
     "n",
     xlab = "",
     ylab = "Energy sub metering")
points(hpcx$DateTime, as.numeric(as.character(hpcx$Sub_metering_1)), 
       type = "line", col = "black")
points(hpcx$DateTime, as.numeric(as.character(hpcx$Sub_metering_2)), 
       type = "line", col = "red")
points(hpcx$DateTime, as.numeric(as.character(hpcx$Sub_metering_3)), 
       type = "line", col = "blue")
legend <- c(paste(as.character(colnames(hpcx[7]))),
            paste(as.character(colnames(hpcx[8]))),
            paste(as.character(colnames(hpcx[9]))))
legend("topright", 
       legend = legend,
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1))
plot(x = hpcx$DateTime,
     y = as.numeric(as.character(hpcx$Voltage)),
     type = "line",
     xlab = "datetime",
     ylab = "Voltage")
plot(x = hpcx$DateTime,
     y = as.numeric(as.character(hpcx$Global_reactive_power)),
     xlab = "datetime",
     type = "line",
     ylab = paste(colnames(hpcx)[4]))

dev.copy(png,'plot4.png')
dev.off()
