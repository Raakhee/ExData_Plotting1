## Plot 1 

energytab <- read.table("household_power_consumption.txt",sep=";",na.strings="?", header=TRUE)
#head(enerytab)


# remove invalid date values
usetab <- subset(energytab, !is.na(energytab$Date))


## Convert date to usable format
usedate <- strptime(energytab$Date,format="%d/%m/%Y")

## extract data for the required dates
usetab <- subset(energytab, usedate=="2007-02-01" | usedate=="2007-02-02")

# plot data
png(filename="Plot1.png")
par(xaxt="n", ann=FALSE)
hist(usetab$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red", xlim=c(0,6),ylim=c(0,1200))
par(xaxt="s")
axis(side=1, at=c(0,2,4,6), labels=c(0,2,4,6))
dev.off()