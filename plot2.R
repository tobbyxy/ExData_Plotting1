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


png("plot2.png", width=480, height = 480)

plot(x = df$dateTime, y =df$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

dev.off()
 