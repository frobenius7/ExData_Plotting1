setwd("/Users/vb/coursera_r/04-Explda/Project1")
#read the dataset
cClasses = c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric", "numeric")
hpc<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=cClasses)
#we will need to filter only results for dates 2007-02-01 and 2007-02-02 
DateToFilter<-c("1/2/2007", "2/2/2007")
hpcf<-hpc[hpc$Date %in% DateToFilter, ]

#concatenate date and time strings into new field
hpcf$DateTime <-paste(hpcf$Date, hpcf$Time)
#convert string to time format.
hpcf$DateTime <- strptime( hpcf$DateTime, format = "%d/%m/%Y %H:%M:%S" )

##Let's create Plot 4##
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")

#first let's split our canvas in 2x2 zones
par( mfrow = c( 2, 2 ) )

#let's plot (1,1) diag (datetime vs global active power)
plot(hpcf$DateTime,hpcf$Global_active_power, type="l", xlab="",ylab="Global Active Power")

#let's plot (1,2) diag (datetime vs Voltage)
plot(hpcf$DateTime,hpcf$Voltage, type="l", xlab="datetime",ylab="Voltage")

#let's plot (2,1) diag (datetime vs EnergySubMetering)
plot(hpcf$DateTime,hpcf$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
#create lines
lines(hpcf$DateTime, hpcf$Sub_metering_1, col = "black" )
lines(hpcf$DateTime, hpcf$Sub_metering_2, col = "red" )
lines(hpcf$DateTime, hpcf$Sub_metering_3, col = "blue" )
legend("topright", c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), 
       lty = c( 1, 1, 1 ), 
       lwd = c( 1, 1, 1 ), 
       col = c( "black", "red", "blue" ))

#let's plot (2,2) diag (datetime vs Global reactive power)
plot(hpcf$DateTime,hpcf$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")

dev.off()
##End of Plot 4##

