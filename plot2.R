# Parse the input file and load into data
data <- read.csv("./data/household_power_consumption.txt", nrows=2075259, header=T, sep=';', na.strings="?", 
                      check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset only the data of interest
dataSubset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

# Convert the dates
datetime <- paste(as.Date(dataSubset$Date), dataSubset$Time)
dataSubset$Datetime <- as.POSIXct(datetime)

# Plot 2
plot(dataSubset$Global_active_power~dataSubset$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()