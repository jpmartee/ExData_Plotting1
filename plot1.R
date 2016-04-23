library(lubridate)

## Read the data into a dataframe
df <- read.table('household_power_consumption.txt', 
                 header = TRUE, 
                 sep = ';', 
                 na.strings = '?')

## Look at first two days of Feb 2007
DF <- subset(df, Date == '1/2/2007' | Date == '2/2/2007')
## Convert Date and Time to respective classes
DF <- transform(DF, Date = dmy(Date), 
                Time = strptime(Time, format = '%H:%M:%S'))

# Open the file
png("plot1.png")

# Create Histogram
hist(DF$Global_active_power, col = 'red', 
     xlab = 'Global Active Power (kilowatts)', 
     main = 'Global Active Power')

# Close the file
dev.off()

