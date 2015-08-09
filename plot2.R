library(data.table)
library(dplyr)

## First, source PlotReadFile.R to create dataset for this code

PowerDS <- tbl_df(read.table("two-days-ds.txt",header=TRUE,sep=";"))

PowerDS$TS <- strptime(paste(PowerDS$Date,PowerDS$Time),format="%d/%m/%Y %H:%M:%S")

plot(PowerDS$TS,PowerDS$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
     
dev.copy(png,file="plot2.png",width=480, height=480)

dev.off()


