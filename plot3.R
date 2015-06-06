# this script makes plot3 for Project 1
# of Explorateory Data Analysis (Coursera)

# set working directory
setwd("~/GitHub/ExData_Plotting1")

# read file
# file has header and uses ; as separators
# ? is used for missing values
dat <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# change first column to Date type 
# date in file is in d/m/Y format
dat$Date = as.Date(strptime(dat$Date, "%d/%m/%Y"))

#filter dat by dates
# make list of dates as Data type
date_list <- c("2007-02-01","2007-02-02")
date_list <- as.Date(date_list)

# apply filter
dat2 <- dat[which(dat$Date %in% date_list),]

#create combined date time column
datetime <-  strptime(paste(as.character(dat2$Date), dat2$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

# plot 3 - to display
plot(datetime, dat2$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(datetime, dat2$Sub_metering_2, type="l", col="red")
lines(datetime, dat2$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# make plot 3 to png file
# needed the following instead of dev.copy, because of legend issues
# as discussed in discussion thread
png("plot3.png", height=480, width=480)

# Set the margins
par(mar=c(3, 3, 2, 2))

# do plot
plot(datetime, dat2$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(datetime, dat2$Sub_metering_2, type="l", col="red")
lines(datetime, dat2$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()