#for plot 3
plot3<-function()
{
windows()
subtemp<-read.table("sub_household_power_comsuption.txt",sep=",",header=T) #always re-read it so each segment can be run independently
a<-paste(subtemp$Date,subtemp$Time)
b<-paste(as.Date(a,"%d/%m/%Y"),subtemp$Time)
wd<-weekdays(as.Date(mydf$Date))#not used
br<-as.POSIXct(b)
with(mydf, plot(br,as.character(Sub_metering_1),col="black",type="l",ylim=c(0.0,37.5),ylab="Energy submetering",xlab=""))
with(mydf, lines(br,as.character(Sub_metering_3),col="blue",type="l"))
with(mydf, lines(br,as.character(Sub_metering_2),col="red",type="l"))
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.75)
dev.copy(png,file="plot3.png")
dev.off()
}

plot3()