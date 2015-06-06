# this script makes plot1 for Project 1
# of Explorateory Data Analysis (Coursera)

# set working directory
setwd("~/GitHub/ExData_Plotting1")

# read file
# file has header and uses ; as separators
# ? is used for missing values
dat <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# change first column to Date type and format second column as time 
# date in file is in d/m/Y format
dat$Date = as.Date(strptime(dat$Date, "%d/%m/%Y"))
dat$Time = strptime(dat$Time, "%hh:%mm:%ss")

#filter dat by dates
# make list of dates as Data type
date_list <- c("2007-02-01","2007-02-02")
date_list <- as.Date(date_list)

# apply filter
dat2 <- dat[which(dat$Date %in% date_list),]

# plot 1
hist(dat2$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# copy plot 1 to png file
dev.copy(png, "plot1.png")
dev.off()