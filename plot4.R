#conversion from character to date
df$Date <- as.Date(df$Date, "%d/%m/%Y")


datetime1 <- as.POSIXct(data$Time, format ="%Y/%d/%m %H:%M:%S")
df[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


#dataframe backup
data <- df

#subseting relevant years

df <- df[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#setting space
par(mar = c(2,2,2,2))



png("plot4.png", height = 480, width= 480)
par(mfrow = c(2,2))
#plot1

plot(x = df$dateTime, y =df$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

#plot2

plot(x = df$dateTime, y =df$Voltage, type="l", xlab="",
     ylab="Global Active Power")

#plot3
plot(df$dateTime, df$Sub_metering_1, type="l",
     xlab = " ", ylab = "Energy Sub Metering")
lines(df$dateTime, df$Sub_metering_2, col="red")
lines(df$dateTime, df$Sub_metering_3, col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), cex = .5, bty = "n")


plot(x = df$dateTime, y = df$Global_reactive_power, type="l", xlab = "datetime",
     ylab="Global_reactive_power")
dev.off()
