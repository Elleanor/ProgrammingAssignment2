# unzip data
file<-unzip("exdata-data-household_power_consumption.zip")

# read data
data<-read.table(file,header=T,sep=";",na.strings=c("?"))

# change data in Date column to class of Date
data$Date<-strptime(data$Date,format="%d/%m/%Y")

# subset data to only include data of first two days of Feb 2007
 data<-data[(data$Date==strptime("20070201","%Y%m%d") | data$Date==strptime("20070202","%Y%m%d")),]
# The steps above may skiped for plot2

＃Combine the Date and Time column and create a DateTime Column in data
x<-paste(data$Date,data$Time)
x<-strptime(x,format="%Y-%m-%d %H:%M:%S")
data$DateTime<-x

# open a png file
png("plot2.png",width=480,height=480,units='px')

# Get plot 2
with(data, {
	plot(DateTime, Global_active_power, xlab="", ylab="Global Acitve Power (Kilowatts)",type="n")
	lines(DateTime,Global_active_power)
	 }
	)

# Close png device
dev.off()
