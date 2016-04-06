# Coursera - Exploratory Data Analysis
# Course Assignment 1 - Make Reference Plots
# Author - Harsh Gupta
# April 6, 2016

install.packages("data.table")
library(data.table)
elec<-fread(input = "household_power_consumption.txt",sep = ";",header = T,na.strings = "?")
str(elec)

# Converting to Date format
elec$Date<-as.Date(elec$Date,format = "%d/%m/%Y")

# Subsetting the dates from 2007-02-01 to 2007-02-02
elec<-subset(elec,Date >= as.Date("2007-02-01")& Date<=as.Date("2007-02-02"))

# Combining Date-Time
elec$DateTime<-paste(elec$Date,elec$Time)

# Creating the plots

png(filename = "plot2.png",width = 480,height = 480)
plot(x = strptime(elec$DateTime,format = "%Y-%m-%d %H:%M:%S"),y = elec$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()
