# unzip data
file<-unzip("exdata-data-household_power_consumption.zip")

# read data
data<-read.table(file,header=T,sep=";",na.strings=c("?"))

# change data in Date column to class of Date
data$Date<-strptime(data$Date,format="%d/%m/%Y")

# subset data to only include data of first two days of Feb 2007
 data<-data[(data$Date==strptime("20070201","%Y%m%d") | data$Date==strptime("20070202","%Y%m%d")),]

＃Combine the Date and Time column and create a DateTime Column in data
x<-paste(data$Date,data$Time)
x<-strptime(x,format="%Y-%m-%d %H:%M:%S")
data$datetime<-x
# The steps above may skiped for plot4


# open a png file
png("plot4.png",width=480,height=480,units='px')

# Get plot 4
# Set up for the four plots
par(mfcol=c(2,2))
# plot(1)
with(data, {
	plot(datetime, Global_active_power, xlab="", ylab="Global Acitve Power (Kilowatts)",type="n")
	lines(datetime,Global_active_power)
	 }
	)

#plot(2)
with(data, {
	plot(datetime, Sub_metering_1, xlab="", ylab="Energy sub metering",type="l")
	lines(datetime,Sub_metering_2,col="red")
	lines(datetime,Sub_metering_3,col="blue")
	 }
	)
legend("topright",
      legend=c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"),col=c("black", "red","blue"),lty=c(1,1,1),bty="n")

#plot(3)
with(data, {
	plot(datetime, Voltage,type="n")
	lines(datetime,Voltage)
	 }
	)

#plot(4)
with(data, {
	plot(datetime, Global_reactive_power,type="n")
	lines(datetime,Global_reactive_power)
	 }
	)

# Close png device
dev.off()
