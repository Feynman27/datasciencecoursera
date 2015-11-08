df <- read.csv2("/home/thomas/Coursera/Exploratory_Data_Analysis/Assignments/household_power_consumption.txt")
df$Date <- as.Date(df$Date,format="%d/%m/%Y")
df.sub <- subset(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02") )
# create new timestamp column
x<-paste(df.sub$Date,df.sub$Time)
df.sub$DateTime <- strptime(x,"%Y-%m-%d %H:%M:%S")

# typecast from factor to numeric
df.sub$Sub_metering_1 <- as.numeric(levels(df.sub$Sub_metering_1)[df.sub$Sub_metering_1])
df.sub$Sub_metering_2 <- as.numeric(levels(df.sub$Sub_metering_2)[df.sub$Sub_metering_2])
df.sub$Sub_metering_3 <- as.numeric(levels(df.sub$Sub_metering_3)[df.sub$Sub_metering_3])

#sapply(df.sub,class)

png(file="plot3.png")
with(df.sub,plot(df.sub$DateTime,df.sub$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering'))
lines(df.sub$DateTime,df.sub$Sub_metering_2,type='l',col='red')
lines(df.sub$DateTime,df.sub$Sub_metering_3,type='l',col='blue')
#legend
legend("topright",c("SubMetering1","SubMetering2","SubMetering3"),col=c("black","red","blue"),lwd=1,lty=c(1,1,1))
dev.off()

