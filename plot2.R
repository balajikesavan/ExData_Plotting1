#reading the data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, dec=".")

#subsetting the data
data_required <- data[data$Date %in%  c("1/2/2007","2/2/2007"),]

#converting the Global Active Power values to a numeric vector
Global_Active_Power <- as.numeric(data_required$Global_active_power)

#creating a vector with datetimes
Date_Time <- strptime(paste(data_required$Date, data_required$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#creating the .png file in the working directory
png("plot2.png" , width = 480, height = 480)

#plotting the graph
plot(Date_Time, Global_Active_Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#saving the plot to the png file
dev.off()