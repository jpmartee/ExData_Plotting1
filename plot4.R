library(lubridate)

## Read the data into a dataframe
df <- read.table('household_power_consumption.txt', 
                 header = TRUE, 
                 sep = ';', 
                 na.strings = '?')

## Look at first two days of Feb 2007
DF <- subset(df, Date == '1/2/2007' | Date == '2/2/2007')
## Convert Date and Time to respective classes and
## create datetime column
DF <- transform(DF, Date = dmy(Date), 
                Time = hms(Time),
                datetime = dmy_hms(paste(Date, Time)))

# Open the file
png("plot4.png")

# Set up 2x2 plots
par(mfcol = c(2, 2))

# Create plot 1
with(DF, 
     plot(datetime, Global_active_power, type = 'l',
          xlab = '',
          ylab = 'Global Active Power'))

# Create plot 2
with(DF, 
     plot(datetime, Sub_metering_1, type = 'l',
          xlab = '',
          ylab = 'Energy sub metering'))

with(DF, 
     lines(datetime, Sub_metering_2, col = 'red', type = 'l'))

with(DF, 
     lines(datetime, Sub_metering_3, col = 'blue', type = 'l'))

legend( 'topright', 
        legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
        col = c('black','red','blue'),
        lty = 1)

# Create plot 3
with(DF, 
     plot(datetime, Voltage, type = 'l'))

# Create plot 4
with(DF, 
     plot(datetime, Global_reactive_power, type = 'l'))

# Close the file
dev.off()

