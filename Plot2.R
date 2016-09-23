## Plot 2

options(stringsAsFactors = FALSE)

energytab <- read.table("household_power_consumption.txt",sep=";",na.strings="?", header=TRUE)
#head(enerytab)

## remove invalid date values
usetab <- subset(energytab, !is.na(energytab$Date))

## Convert date to usable format
usedate <- strptime(energytab$Date,format="%d/%m/%Y")

## extract data for the required dates
usetab <- subset(energytab, usedate =="2007-02-01" | usedate=="2007-02-02")
usetab <- subset(usetab, !is.na(usetab$Time))

xdattime <- as.POSIXct(paste(usetab$Date,usetab$Time),format="%d/%m/%Y %H:%M:%S")
  
# plot data
png(filename="Plot2.png",height=480,width=480)
plot(Global_active_power~xdattime, data=usetab,ylab="Global Active Power (kilowatts)",type="n")
plot(Global_active_power~xdattime, data=usetab,ylab="Global Active Power (kilowatts)",type="l",xlab="")

dev.off()