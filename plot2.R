# this script makes plot2 for Project 1
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

# plot 2
plot(datetime, dat2$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

# copy plot 2 to png file
dev.copy(png, "plot2.png")
dev.off()