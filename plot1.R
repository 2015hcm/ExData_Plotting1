#for plot 1


plot1<-function()
  
{
  subtemp<-read.table("sub_household_power_comsuption.txt",sep=",",header=T) #always re-read it so each segment can be run independently
windows()
mydf<-data.frame(subtemp)
gap<-(mydf$Global_active_power)
ngap<-as.numeric(as.character(gap))
ngap<-na.omit(ngap)
hist(ngap,main="Global Active Power",xlab="Global Active power (kilowatts)",col="red")
dev.copy(png,file="plot1.png")
dev.off()
}

plot1()