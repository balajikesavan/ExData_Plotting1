#reading the data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, dec=".")

#subsetting the data
data_required <- data[data$Date %in%  c("1/2/2007","2/2/2007"),]

#creating a vector with datetimes
Date_Time <- strptime(paste(data_required$Date, data_required$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#converting the Sub_Metering values to a numeric vectors
Sub_Metering_1 <- as.numeric(data_required$Sub_metering_1)
Sub_Metering_2 <- as.numeric(data_required$Sub_metering_2)
Sub_Metering_3 <- as.numeric(data_required$Sub_metering_3)

#creating the .png file in the working directory
png("plot3.png" , width = 480, height = 480)

#plotting the graph
plot(Date_Time, Sub_Metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(Date_Time, Sub_Metering_2, type="l", col="red")
lines(Date_Time, Sub_Metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

#saving the plot to the png file
dev.off()