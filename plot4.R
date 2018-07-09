#read the rawdata
setwd("~/Desktop/MD/Rscript/chartboost/coursera")
rawdata<-read.table(file='household_power_consumption.txt',header=TRUE,sep=';',na.strings='?')
rawdata$Date<-as.Date(rawdata$Date,'%d/%m/%Y')

#truncate the data only to the portion needed
data<-rawdata[rawdata$Date<=as.Date('2007-02-02')&rawdata$Date>=as.Date('2007-02-01'),]
data$datetime<-paste(data$Date,data$Time)
data$datetime<-strptime(data$datetime,format='%Y-%m-%d %H:%M:%S')

#Plot 4
png('plot4.png')
par(mfrow=c(2,2),mar=c(4,4,2,2))
with(data,plot(datetime,Global_active_power,type='l',ylab='Global Acitve Power',xlab=''))

with(data,plot(datetime,Voltage,type='l'))

plot(data$datetime,data$Sub_metering_1,type='n',xlab='',ylab='Energy sub metering')
with(data,lines(datetime,Sub_metering_1))
with(data,lines(datetime,Sub_metering_2,col='red'))
with(data,lines(datetime,Sub_metering_3,col='blue'))
legend('topright',lty=1,col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),bty='n')       

with(data,plot(datetime,Global_reactive_power,type='l'))
dev.off()
