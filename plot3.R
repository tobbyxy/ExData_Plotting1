#reading the data

df <- data.table::fread("household_power_consumption.txt", sep = ";", na.strings = "?")
str(df)





#conversion from character to date
df$Date <- as.Date(df$Date, "%d/%m/%Y")


datetime1 <- as.POSIXct(data$Time, format ="%Y/%d/%m %H:%M:%S")
df[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


#dataframe backup
data <- df

#subseting relevant years

df <- df[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", height = 480, width = 480)
plot(df$dateTime, df$Sub_metering_1, type="l",
     xlab = " ", ylab = "Energy Sub Metering")
lines(df$dateTime, df$Sub_metering_2, col="red")
lines(df$dateTime, df$Sub_metering_3, col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
dev.off()       
       