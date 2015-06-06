# this script makes plot4 for Project 1
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
dat2 < c(dat2, datetime)

# plot - to display 2x2
par(mfrow = c(2,2))
# plot 1
plot(datetime, dat2$Global_active_power, type="l", cex.lab=0.7, cex.axis=0.7,
     xlab="", ylab="Global Active Power")


# plot 2
plot(datetime, dat2$Voltage, type="l", cex.lab=0.7, cex.axis=0.7,
    ylab="Voltage")



# plot 3
plot(datetime, dat2$Sub_metering_1, type="l", cex.lab=0.7, cex.axis=0.7,
     xlab="", ylab="Energy sub metering")
lines(datetime, dat2$Sub_metering_2, type="l", col="red")
lines(datetime, dat2$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), cex=0.5, bty="n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# plot 4
plot(datetime, dat2$Global_reactive_power, type="l", cex.lab=0.7, cex.axis=0.7,
     ylab = "Global_reactive_power")



# copy plot to png file
dev.copy(png, "plot4.png", width=480, height=480)

dev.off()