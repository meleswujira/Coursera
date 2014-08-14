columns<-c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric", "numeric", "numeric")
new_hpc = read.table("household_power_consumption.txt", sep=";", header = TRUE,colClasses = columns, na.strings = "?")
#head(new_hpc)
new_hpc$Date_Time = strptime(paste(new_hpc$Date, new_hpc$Time),format="%d/%m/%Y %H:%M:%S")
new_hpc <- subset(new_hpc,as.Date(Date_Time) >= as.Date("2007-02-01") & as.Date(Date_Time) <= as.Date("2007-02-02"))

png("plot1.png", height=480, width=480)
hist(new_hpc$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off() 

