
FileHandle <- file("household_power_consumption.txt")

DataRows <- readLines(FileHandle,-1L)

TwoDaysDS <- DataRows[grep("^1/2/2007|^2/2/2007",DataRows)]

# 
write.table(DataRows[1],"two-days-ds.txt",quote=FALSE,row.names=FALSE,col.names=FALSE)
#
write.table(TwoDaysDS,"two-days-ds.txt",quote=FALSE,row.names=FALSE,col.names=FALSE,append=TRUE)

on.exit(close(FileHandle))
