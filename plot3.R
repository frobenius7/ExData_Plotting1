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

##Let's create Plot 3##
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

#we adjusted: main label, type of graph and the label of x,y axis
plot(hpcf$DateTime,hpcf$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")

#create lines and legend of metrics.
lines(hpcf$DateTime, hpcf$Sub_metering_1, col = "black" )
lines(hpcf$DateTime, hpcf$Sub_metering_2, col = "red" )
lines(hpcf$DateTime, hpcf$Sub_metering_3, col = "blue" )
legend("topright", c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), 
        lty = c( 1, 1, 1 ), 
        lwd = c( 1, 1, 1 ), 
        col = c( "black", "red", "blue" ))

dev.off()
##End of Plot 3##
