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
png("plot2.png")

# Create plot
with(DF, 
     plot(datetime, Global_active_power, type = 'l',
          xlab = '',
          ylab = 'Global Active Power (kilowatts)'))

# Close the file
dev.off()

