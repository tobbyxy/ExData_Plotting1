#reading the data

df <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
str(df)

#conversion from character to date
df$Date <- as.Date(df$Date, "%d/%m/%Y")



df$Time <- strptime(data$Time, "%H:%M:%S")

df$Global_active_power <- as.numeric(df$Global_active_power)


Global_active_power <- df$Global_active_power

png("plot1.png", width=480, height = 480)
hist(df$Global_active_power,
     main = "Global Active power",
     xlab = "Global Active Power (Kilowatts)",
     col = "red")
dev.off()
