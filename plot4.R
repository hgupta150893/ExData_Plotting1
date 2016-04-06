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
# Starting the graphic device
png(filename = "plot4.png",width = 480,height = 480)

# Creating multigraph formatting
par(mfcol=c(2,2))

# 1st Plot
plot(x = strptime(elec$DateTime,format = "%Y-%m-%d %H:%M:%S"),y = elec$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")

# Second Plot
plot(x = strptime(elec$DateTime,format = "%Y-%m-%d %H:%M:%S"),y = elec$Sub_metering_1,type="l",xlab="",ylab = "Energy Sub Metering")
# Adding on top the second graph
lines(strptime(elec$DateTime, "%Y-%m-%d %H:%M:%S"), elec$Sub_metering_2, type = "l", col = "red" )
# Adding on top the third graph
lines(strptime(elec$DateTime, "%Y-%m-%d %H:%M:%S"), elec$Sub_metering_3, type = "l", col = "blue" )
# Adding legend
legend("topright",lty = 1,col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Third Plot

plot(x = strptime(elec$DateTime,format = "%Y-%m-%d %H:%M:%S"),y = elec$Voltage,type = "l",xlab="datetime",ylab = "Voltage")

# Fourth Plot

plot(x=strptime(elec$DateTime,format = "%Y-%m-%d %H:%M:%S"),y = elec$Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power")

# Closing the graphic device
dev.off()
