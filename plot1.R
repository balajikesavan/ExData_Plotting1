#reading the data
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, dec=".")

#subsetting the data
data_required <- data[data$Date %in%  c("1/2/2007","2/2/2007"),]

#converting the Global Active Power values to a numeric vector
Global_Active_Power <- as.numeric(data_required$Global_active_power)

#creating the .png file in the working directory
png("plot1.png" , width = 480, height = 480)

#plotting the histogram
hist(Global_Active_Power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#saving the histogram to the png file
dev.off()