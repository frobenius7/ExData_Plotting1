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

##Let's create Plot 2##
#first step - plot on screen device
#we adjusted: main label, type of graph and the label of x,y axis
plot(hpcf$DateTime,hpcf$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
#next step - copy to png
dev.copy(png, file="plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
dev.off()
##End of Plot 2##
