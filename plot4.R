#reading the data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, dec=".")

#subsetting the data
data_required <- data[data$Date %in%  c("1/2/2007","2/2/2007"),]

#converting the Global Active Power values to a numeric vector
Global_Active_Power <- as.numeric(data_required$Global_active_power)

#creating a vector with datetimes
Date_Time <- strptime(paste(data_required$Date, data_required$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#converting the Sub_Metering values to a numeric vectors
Sub_Metering_1 <- as.numeric(data_required$Sub_metering_1)
Sub_Metering_2 <- as.numeric(data_required$Sub_metering_2)
Sub_Metering_3 <- as.numeric(data_required$Sub_metering_3)

#converting the valotage values to a numeric vectors
Voltage <- as.numeric(data_required$Voltage)

#converting the valotage values to a numeric vectors
Global_Reactive_Power <- as.numeric(data_required$Global_reactive_power)


#creating the .png file in the working directory
png("plot4.png" , width = 480, height = 480)

#setting up a 2x2 grid for the graphs
par(mfcol = c(2, 2))

plot(Date_Time, Global_Active_Power, type="l", xlab="", ylab="Global Active Power", cex=0.25)

plot(Date_Time, Sub_Metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(Date_Time, Sub_Metering_2, type="l", col="red")
lines(Date_Time, Sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(Date_Time, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(Date_Time, Global_Reactive_Power, type="l", xlab="datetime", ylab="Global_reactive_power")

#saving the plot to the png file
dev.off()