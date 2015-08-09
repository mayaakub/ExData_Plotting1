library(data.table)
library(dplyr)

## First, source PlotReadFile.R to create dataset for this code

PowerDS <- tbl_df(read.table("two-days-ds.txt",header=TRUE,sep=";"))

PowerDS$TS <- strptime(paste(PowerDS$Date,PowerDS$Time),format="%d/%m/%Y %H:%M:%S")

plot(PowerDS$TS,PowerDS$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")

points(PowerDS$TS,PowerDS$Sub_metering_1,type="l",col="black",lwd=1)

points(PowerDS$TS,PowerDS$Sub_metering_2,type="l",col="red",lwd=1)

points(PowerDS$TS,PowerDS$Sub_metering_3,type="l",col="blue",lwd=1)

legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png",width=640, height=480)

dev.off()

