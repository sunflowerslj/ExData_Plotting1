## Unzip the data
#outDir<-"~/Desktop/MD/Rscript/chartboost/coursera" # Define the folder where the zip file should be unzipped to 
#zipF<-file.choose("exdata%2Fdata%2Fhousehold_power_consumption.zip") # lets you choose a file and save its file path in R (at least for windows)
#unzip(zipF,exdir=outDir)  # unzip your file
#unlink('outDir',recursive = TRUE)

#read the rawdata
setwd("~/Desktop/MD/Rscript/chartboost/coursera")
rawdata<-read.table(file='household_power_consumption.txt',header=TRUE,sep=';',na.strings='?')
rawdata$Date<-as.Date(rawdata$Date,'%d/%m/%Y')

#truncate the data only to the portion needed
data<-rawdata[rawdata$Date<=as.Date('2007-02-02')&rawdata$Date>=as.Date('2007-02-01'),]
data$datetime<-paste(data$Date,data$Time)
data$datetime<-strptime(data$datetime,format='%Y-%m-%d %H:%M:%S')

#Plot 1
png('plot1.png')
with(data,hist(Global_active_power,col='red',xlab='Global Active Power (kilowatts)',main='Global Acitive Power',ylim=c(0,1200)))
dev.off()
