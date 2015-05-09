
#for plot 4
plot4<-function()
{
windows()
subtemp<-read.table("sub_household_power_comsuption.txt",sep=",",header=T) #always re-read it so each segment can be run independently
a<-paste(subtemp$Date,subtemp$Time)
b<-paste(as.Date(a,"%d/%m/%Y"),subtemp$Time)
wd<-weekdays(as.Date(mydf$Date))#not used
br<-as.POSIXct(b)
myplot2<-function(){plot(br,ngap,type="l",ylab="Global Active Power",xlab="")}
myplot3<-function()
{with(mydf, plot(br,as.character(Sub_metering_1),col="black",type="l",ylim=c(0.0,37.5),ylab="Energy submetering",xlab=""))
 with(mydf, lines(br,as.character(Sub_metering_3),col="blue",type="l"))
 with(mydf, lines(br,as.character(Sub_metering_2),col="red",type="l"))
 legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.75)
}
myplot2a<-function(){ with(mydf, plot(br,as.character(Voltage),col="black",type="l",ylab="Voltage",xlab="Datetime"))}
myplot3a<-function(){with(mydf, plot(br,as.character(Global_reactive_power),col="black",type="l",ylab="Global_reactive_power",xlab="Datetime"))}

myall<-function(){par(mfrow=c(2,2))
                  par(mai=c(0.5,0.5,0.25,0.5))
                  par(mgp=c(2.5,1,0))
                  par(cex=0.5)
                  myplot2()
                  myplot2a() 
                  myplot3() 
                  myplot3a()}


myall()
dev.copy(png,file="plot4.png")
dev.off()
}
plot4()