#read the rawdata
setwd("~/Desktop/MD/Rscript/chartboost/coursera")
rawdata<-read.table(file='household_power_consumption.txt',header=TRUE,sep=';',na.strings='?')
rawdata$Date<-as.Date(rawdata$Date,'%d/%m/%Y')

#truncate the data only to the portion needed
data<-rawdata[rawdata$Date<=as.Date('2007-02-02')&rawdata$Date>=as.Date('2007-02-01'),]
data$datetime<-paste(data$Date,data$Time)
data$datetime<-strptime(data$datetime,format='%Y-%m-%d %H:%M:%S')

#Plot 2
png('plot2.png')
with(data,plot(datetime,Global_active_power,type='l',ylab='Global Acitve Power (kilowatts)',xlab=''))
dev.off()