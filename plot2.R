#for plot 2

plot2<-function()
{
subtemp<-read.table("sub_household_power_comsuption.txt",sep=",",header=T) #always re-read it so each segment can be run independently
mydf<-data.frame(subtemp)
gap<-(mydf$Global_active_power)
ngap<-as.numeric(as.character(gap))
ngap<-na.omit(ngap)
windows()
a<-paste(subtemp$Date,subtemp$Time)
b<-paste(as.Date(a,"%d/%m/%Y"),subtemp$Time)
wd<-weekdays(as.Date(mydf$Date))
br<-as.POSIXct(b)
plot(br,ngap,type="l",ylab="Global Active power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png")
dev.off()
}

plot2()