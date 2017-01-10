household_power_consumption <- read.table("~/JHU Cert/Data Exploration/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

household_power_consumption$Date<-as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

household_power_consumption <- household_power_consumption[which(household_power_consumption$Date > "2007-01-31" & household_power_consumption$Date < "2007-02-03"),]

combinetime <- strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

dev.copy(png, 'plot2.R.png', width=480, height=480)
plot(combinetime, household_power_consumption$Global_active_power, type="l", xlab="", ylab="Global Active Power (Kilowatts)")
dev.off()
