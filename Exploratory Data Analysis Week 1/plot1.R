## This is for the first plot, week 1, for Exploratory Data Analysis

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

## 1

hist(as.numeric(as.character(hpcx$Global_active_power)),
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts")

dev.copy(png,'plot1.png')
dev.off()