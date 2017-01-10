household_power_consumption <- read.table("~/JHU Cert/Data Exploration/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

household_power_consumption$Date<-as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

household_power_consumption <- household_power_consumption[which(household_power_consumption$Date > "2007-01-31" & household_power_consumption$Date < "2007-02-03"),]


dev.copy(png,'plot1.R.png',
         width = 480, height = 480)
hist(household_power_consumption$Global_active_power,  , main="Global Active Power", 
     xlab="Global Active Power (kilowats)", ylab = "Frequency", col="red")
dev.off()
