library(data.table)
library(dplyr)

## First, source PlotReadFile.R to create dataset for this code

PowerDS <- tbl_df(read.table("two-days-ds.txt",header=TRUE,sep=";"))

PowerDS$TS <- strptime(paste(PowerDS$Date,PowerDS$Time),format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

## panel r1 c1
plot(PowerDS$TS,PowerDS$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")

## panel r1 c2
plot(PowerDS$TS,PowerDS$Voltage,xlab="datetime",ylab="Voltage",type="l")

## panel r2 c1
plot(PowerDS$TS,PowerDS$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(PowerDS$TS,PowerDS$Sub_metering_1,type="l",col="black",lwd=1)
points(PowerDS$TS,PowerDS$Sub_metering_2,type="l",col="red",lwd=1)
points(PowerDS$TS,PowerDS$Sub_metering_3,type="l",col="blue",lwd=1)
#legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
legend("topright",bty="n",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## panel r2 c2
plot(PowerDS$TS,PowerDS$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")

dev.copy(png,file="plot4.png",width=640, height=480)

dev.off()
