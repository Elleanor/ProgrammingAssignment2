# unzip data
file<-unzip("exdata-data-household_power_consumption.zip")

# read data
data<-read.table(file,header=T,sep=";",na.strings=c("?"))

# read size of the data object
format(object.size(data),units="Mb")

# change data in Date column to class of Date
data$Date<-strptime(data$Date,format="%d/%m/%Y")

# subset data to only include data of first two days of Feb 2007
 data<-data[(data$Date==strptime("20070201","%Y%m%d") | data$Date==strptime("20070202","%Y%m%d")),]

# open a png file
png("plot1.png",width=480,height=480,units='px')
 
# Get plot 1
hist(y[,3],col="red", main="Global Active Power",xlab="Global Acitve Power (Kilowatts)", ylab="Frequency")

# Close png device
dev.off()
