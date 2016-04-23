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
png("plot3.png")

# Create plot
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

# Close the file
dev.off()

