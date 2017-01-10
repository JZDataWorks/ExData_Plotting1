
household_power_consumption <- read.table("~/JHU Cert/Data Exploration/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

household_power_consumption$Date<-as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

household_power_consumption <- household_power_consumption[which(household_power_consumption$Date > "2007-01-31" & household_power_consumption$Date < "2007-02-03"),]

combinetime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

dev.copy(png, 'plot4.R.png', width=480, height=480)
par(mfrow=c(2,2))

plot(combinetime, household_power_consumption$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(combinetime, household_power_consumption$Voltage, type = "l", xlab="datetime", ylab="Voltage")
plot(combinetime, as.numeric(household_power_consumption$Sub_metering_1), type="l", xlab="", ylab="Energy Sub Metering")
lines(combinetime, as.numeric(household_power_consumption$Sub_metering_2),  col="red")
lines(combinetime, as.numeric(household_power_consumption$Sub_metering_3), col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(combinetime, household_power_consumption$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
