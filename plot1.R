library(data.table)
library(dplyr)

## First, source PlotReadFile.R to create dataset for this code

PowerDS <- tbl_df(read.table("two-days-ds.txt",header=TRUE,sep=";"))

hist(PowerDS$Global_active_power,col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png", width=480, height=480)

dev.off()



