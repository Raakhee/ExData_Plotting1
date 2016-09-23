## Plot 4

# remove factors
options(stringsAsFactors = FALSE)

# read file
energytab <- read.table("household_power_consumption.txt",sep=";",na.strings="?", header=TRUE)
#head(enerytab)

## remove invalid date values
usetab <- subset(energytab, !is.na(energytab$Date))

## Convert date to usable format
usedate <- strptime(energytab$Date,format="%d/%m/%Y")

## extract data for the required dates
usetab <- subset(energytab, usedate =="2007-02-01" | usedate=="2007-02-02")
# remove invalid time 
usetab <- subset(usetab, !is.na(usetab$Time))

# Combine date and time values
xdattime <- as.POSIXct(paste(usetab$Date,usetab$Time),format="%d/%m/%Y %H:%M:%S")
  
# plot data in file
png(filename="Plot4.png",height=480,width=480)
par(mfrow=c(2,2))

plot(Global_active_power~xdattime, data=usetab,ylab="Global Active Power",type="l",xlab="")


plot(Voltage~xdattime, data=usetab,ylab="Voltage",type="l",xlab="datetime")

##plot(Sub_metering_1~xdattime, data=usetab,ylab="Energy sub metering",type="n")
plot(Sub_metering_1~xdattime, data=usetab,ylab="Energy sub metering",type="l",xlab="")
lines(Sub_metering_2~xdattime, data=usetab,col="red")
lines(Sub_metering_3~xdattime, data=usetab,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(2,2,2),col=c("black","red","blue"))


plot(Global_reactive_power~xdattime, data=usetab,ylab="Global_reactive_power",type="l",xlab="datetime")

# turn off plotting device
dev.off()