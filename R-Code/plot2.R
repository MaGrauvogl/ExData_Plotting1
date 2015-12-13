#Plot1.R
#Datea from the home directory
test <- subset(read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE), (Date=="1/2/2007" | Date=="2/2/2007"))
test$Date <- as.character(test$Date)
test$Time <- as.character(test$Time)
dt <- paste(test$Date, test$Time)
dt <- strptime(dt, format="%d/%m/%Y %T")
test$Date <- dt
nam <- names(test)
nam[1] <- "DateTime"
names(test) <- nam
test$Time <- NULL
#hist(test$Global_active_power, col="green", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", ylim = c(0, 1200), cex.axis=0.8)
plot(test$DateTime, test$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", cex.axis=0.8, xlab="")
#German spelling on the x-axis: Do = The, Fr = Fri, Sa = Sat
dev.copy(png, file="plot2.png")
dev.off()

